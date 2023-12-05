package Comserv::Model::DB;
use Moose;
use namespace::autoclean;
use Apache::DBI;
use DBI;
use JSON::MaybeXS qw(decode_json encode_json);
use Term::ReadPassword;
use Data::Dumper;
use Digest::SHA;
extends 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'Comserv::Model::Schema::Ency',
    schema_class => 'Comserv::Model::Schema::ShantaForager',
);

my $debug = "Comserv::Model::DB Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";

my $env_master_key = '12345678901234567890123456789012';
$ENV{MASTER_KEY} = $env_master_key;
print $debug . __LINE__ . " MASTER_KEY: $ENV{MASTER_KEY}\n";

# Builder method to create the DBI handle
# Builder method to create the DBI handle
sub _read_dbi_info_from_file {
    my ($self) = @_;

    # Path to the DBI information file
    my $file = 'dbi_info.dat';

    # Check if the file exists
    if (-e $file && -r $file) {
        # If the file exists, open it
        open my $fh, '<', $file or die "Cannot open $file: $!";

        # Read the file content
        my $json_text = do { local $/; <$fh> };

        # Close the file
        close($fh);

        # Decode the JSON text to get the DBI information
        my $dbi_info;
        eval {
            $dbi_info = decode_json($json_text);
            1;
        } or do {
            my $error = $@;
            return undef;  # Return undef if JSON decoding fails
        };

        return $dbi_info;
    }

    # If the file does not exist, return undef
    return undef;
}
sub _build_dbh {
    my ($self) = @_;

    # Retrieve the DBI information
    my $dbi_info = $self->_read_dbi_info_from_file();

    # If the DBI information could not be read or is not valid, return
    if (!defined $dbi_info) {
        return;
    }

    # Connect to the database
    my $dbh = DBI->connect("DBI:mysql:database=$dbi_info->{database};host=$dbi_info->{host}", $dbi_info->{username}, $dbi_info->{password});

    return $dbh;
}# Method to get the dbi_info
sub dbi_info {
    my ($self, $c) = @_;

    # If dbi_info is already defined in the object, return it
    if (defined $self->{dbi_info}) {
        return $self->{dbi_info};
    }

    # Try to read the DBI information from the .dat file
    my $dbi_info = $self->_read_dbi_info_from_file($c);

    # If the DBI information could not be read or is not valid
    if (!defined $dbi_info || !$self->_test_db_connection($c, $dbi_info)) {
        $c->stash(error_message => 'DBI information is missing or invalid.');
        return;
    }

    # Store the DBI information in the object
    $self->{dbi_info} = $dbi_info;

    return $self->{dbi_info};
}
# Builder method to retrieve or create the DBI information
sub connect_info {
    my $self = shift;

    # Read the DBI information from dbi_info.dat
    my $dbi_info = $self->_read_dbi_info_from_file();

    return {
        dsn => "dbi:mysql:database=$dbi_info->{database};host=$dbi_info->{host}",
        user => $dbi_info->{username},
        password => $dbi_info->{password},
        AutoCommit => 1,
    };
}
sub _test_db_connection {
    my ($self, $c, $dbi_info) = @_;
    Comserv::debug_log($debug . __LINE__ . " Enter search_schema\n");
    print $debug . __LINE__ . " in _test_db_connection\n";
    #print $debug . __LINE__ . " dbi_info: " . Dumper($dbi_info) . "\n";

    # Check if the DBI information is provided
    if ($dbi_info && $dbi_info->{username} && $dbi_info->{password}) {
        # Perform the necessary code to test the database connection using the $dbi_info
        my $dbh = DBI->connect("DBI:mysql:database=$dbi_info->{database};host=$dbi_info->{host}", $dbi_info->{username}, $dbi_info->{password});

        if ($dbh) {
            my $query = "SELECT 1";
            my $sth = $dbh->prepare($query);
            if ($sth && $sth->execute) {
                print $debug . __LINE__ . " DB connection successful\n";
     # If the connection is successful, store the connection status in the stash and session
    $c->stash(dbi_connected => 1);
    $c->session(dbi_connected => 1);
               $sth->finish;
#                $dbh->disconnect;
                return 1;  # Connection successful
            }
            $sth->finish;
        } else {
            # Print the DBI error message
            print $debug . __LINE__ . " DBI error: " . DBI->errstr . "\n";
        }
    }

    print $debug . __LINE__ . " DB connection failed\n";
    return 0;  # Connection failed
}
sub _build_dbi_info {
    my ($self, $c) = @_;

    # Try to read the DBI information from the .dat file
    my $dbi_info = $self->_read_dbi_info_from_file($c);

    # If the DBI information could not be read or is not valid
    if (!defined $dbi_info || !$self->_test_db_connection($c, $dbi_info)) {
        $c->stash(error_message => 'DBI information is missing or invalid.');
        return;
    }

    # Store the DBI information in the object
    $self->{dbi_info} = $dbi_info;

    return $self->{dbi_info};
}
# Method to get the schema info
sub get_schema_info {
    my ($self, $c) = @_;

    print $debug . __LINE__ . " in get_schema_info\n";  # Debug print
# Open the log file for writing
open my $log_fh, '>', 'debug.log' or die "Could not open debug.log: $!";

# Redirect standard output to the log file
select $log_fh;

# Now all print statements will write to the log file
print $debug . __LINE__ . " in get_schema_info\n";  # Debug print
    # Retrieve the DBI handle
    my $dbh = $self->_build_dbh($c);

    # If the DBI handle is an error message, store it in the stash
    if (!ref $dbh) {
        $c->stash(error_message => $dbh);
        return;
    }

    # Prepare the query to retrieve schema information
    my $sth = $dbh->prepare('SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = ?');

    # If the prepare operation fails, store the DBI error in the stash
    if (!$sth) {
        $c->stash(error_message => "DBI error: " . $dbh->errstr);
        return;
    }

    # Execute the query
    my $result = $sth->execute($c->stash->{dbi_info}{database});

    # If the execute operation fails, store the DBI error in the stash
    if (!$result) {
        $c->stash(error_message => "DBI error: " . $dbh->errstr);
        return;
    }

    # Fetch the results
    my @schema_info;
    while (my $row = $sth->fetchrow_hashref) {
        push @schema_info, $row;
    }

    # Open a file for writing
    open my $fh, '>', 'schema.txt' or die "Could not open file 'schema.txt' $!";

    # Write the schema information to the file
    print $fh Dumper(\@schema_info);

    # Close the file
    close $fh;

    print $debug . __LINE__ . " schema_info written to schema.txt\n";  # Debug print
# Close the log file
close $log_fh;
    return \@schema_info;
}
sub get_filtered_schema_info {
    my ($self, $c, $criteria) = @_;

    # Retrieve the DBI handle
    my $dbh = $self->_build_dbh($c);

    # If the DBI handle is an error message, store it in the stash
    if (!ref $dbh) {
        $c->stash(error_message => $dbh);
        return;
    }

    # Prepare the query to retrieve schema information
    my $sth = $dbh->prepare('SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = ?');

    # Execute the query
    $sth->execute($c->stash->{dbi_info}{database});

    # Fetch the results
    my @schema_info;
    while (my $row = $sth->fetchrow_hashref) {
        # If the table name matches the criteria
        if ($row->{TABLE_NAME} =~ /$criteria/) {
            # Prepare the query to fetch the column information
            my $sth_columns = $dbh->prepare("SHOW COLUMNS FROM $row->{TABLE_NAME}");

            # Execute the query
            $sth_columns->execute();

            # Fetch the results
            my $columns = $sth_columns->fetchall_arrayref({});

            # Add the columns to the row
            $row->{columns} = $columns;

            push @schema_info, $row;
        }
    }

    return \@schema_info;
}
sub get_tables {
    my ($self, $c, $database) = @_;

    # Check if the database is defined
    if (!defined $database) {
        print "Error: No database specified\n";
        return;
    }

    # Retrieve the DBI handle
    my $dbh = $self->_build_dbh($c);

    # If the DBI handle is an error message, return it
    if (!ref $dbh) {
        return { error => $dbh };
    }

    # Prepare the query to retrieve tables for the given database
    my $sth = $dbh->prepare("SHOW TABLES IN `$database`");
    $sth->execute();

    # Fetch the results
    my @tables;
    while (my $row = $sth->fetchrow_arrayref) {
        push @tables, $row->[0];
    }

    # If no tables were found, log an error message
    if (!@tables) {
        print "Error: No tables found for database $database\n";
    }

    # Log each table
    foreach my $table (@tables) {
        print "Table: $table\n";
    }

    return \@tables;
}# Method to test the DB connection
sub get_databases {
    my ($self, $c, $schema) = @_;

    # Retrieve the DBI handle
    my $dbh = $self->_build_dbh($c);

    # If the DBI handle is an error message, return it
    if (!ref $dbh) {
        return { error => $dbh };
    }

    # Prepare the query to retrieve databases for the given schema
    my $sth = $dbh->prepare('SHOW DATABASES LIKE ?');
    $sth->execute($schema);

    # Fetch the results
    my @databases;
    while (my $row = $sth->fetchrow_arrayref) {
        push @databases, $row->[0];
    }

    return \@databases;
}
sub create_result_classes {
    my ($self, $c) = @_;

    # Connect to the shanta_forager database
    my $dbh = DBI->connect('dbi:mysql:database=shanta_forager;host=localhost');

    # Execute a SHOW TABLES query
    my $sth = $dbh->prepare('SHOW TABLES');
    $sth->execute();

    # Fetch all tables
    my @tables = @{$sth->fetchall_arrayref};

    # For each table
    foreach my $table (@tables) {
        # Create a new Perl module file
        my $file = "Comserv/Model/Schema/ShantaForager/Result/" . ucfirst($table->[0]) . ".pm";

        # Open the file for writing
        open my $fh, '>', $file or die "Could not open file '$file' $!";

        # Write the necessary Perl code to define a DBIx::Class result class for the table
        print $fh "package Comserv::Model::Schema::ShantaForager::Result::" . ucfirst($table->[0]) . ";\n";
        print $fh "use base 'DBIx::Class::Core';\n";
        print $fh "__PACKAGE__->table('$table->[0]');\n";

        # Execute a SHOW COLUMNS query to get the column names of the table
        my $sth_columns = $dbh->prepare('SHOW COLUMNS FROM ' . $table->[0]);
        $sth_columns->execute();

        # Fetch all columns
        my @columns = @{$sth_columns->fetchall_arrayref};

        # Add columns to the Perl code
        print $fh "__PACKAGE__->add_columns(qw/ " . join(' ', map { $_->[0] } @columns) . " /);\n";
        print $fh "__PACKAGE__->set_primary_key('$columns[0]->[0]');\n";  # Assuming the first column is the primary key
        print $fh "1;\n";

        # Close the file
        close $fh;

        # Print a message to indicate the progress
        print "Created Result class for table $table->[0]\n";
    }
}
sub get_user_by_username {
    my ($self, $username) = @_;

    # Print debug information
    print $debug . __LINE__ . " Enter get_user_by_username\n";
    Comserv::debug_log($debug . __LINE__ . " Enter get_user_by_username\n");
    print $debug . __LINE__ . " Username: $username\n";
    $username = 'Shanta';
    Comserv::debug_log($debug . __LINE__ . " Username: $username\n");

    # Retrieve the DBI handle
    my $dbh = $self->_build_dbh();
    if (!$dbh) {
        print $debug . __LINE__ . " DBI handle not retrieved\n";
        Comserv::debug_log($debug . __LINE__ . " DBI handle not retrieved\n");
        return;
    }

    # Prepare the SQL query
    my $sth = $dbh->prepare('SELECT * FROM users WHERE username = ?');
    if (!$sth) {
        print $debug . __LINE__ . " DBI error: " . $dbh->errstr . "\n";
        Comserv::debug_log($debug . __LINE__ . " DBI error: " . $dbh->errstr . "\n");
        return;
    }

    # Execute the query
    my $result = $sth->execute($username);
    if (!$result) {
        print $debug . __LINE__ . " DBI error: " . $sth->errstr . "\n";
        Comserv::debug_log($debug . __LINE__ . " DBI error: " . $sth->errstr . "\n");
        return;
    }

    # Fetch the user data
    my $user = $sth->fetchrow_hashref;
    if (!$user) {
        print $debug . __LINE__ . " User not found\n";
        Comserv::debug_log($debug . __LINE__ . " User not found\n");
    } else {
        print $debug . __LINE__ . " User found: " . Dumper($user) . "\n";
        Comserv::debug_log($debug . __LINE__ . " User found: " . Dumper($user) . "\n");
    }

    return $user;
}
sub check_password {
    my ($self, $c, $username, $password) = @_;
    print $debug . __LINE__ . " Enter check_password\n";
    # Retrieve the user from the database
    my $user = $self->get_user_by_username($username);
    print $debug . __LINE__ . " User: " . Dumper($user) . "\n";
    # If the user doesn't exist, return false
    if (!$user) {
        $c->stash(error_msg => 'User not found.');
        return 0;
    }

    # Hash the provided password
    my $hashed_password = $self->hash_password($password);

    # Compare the hashed password with the stored password
    if ($hashed_password eq $user->{password}) {
        # The passwords match
        return 1;
    } else {
        # The passwords don't match
        $c->stash(error_msg => 'Invalid password.');
        return 0;
    }
}
sub hash_password {
    my ($self, $password) = @_;

    # Hash the password using the Catalyst hashing system
    my $hashed_password = Digest::SHA::sha256_hex($password);

    return $hashed_password;
}
sub change_password {
    my ($self, $c, $username, $new_password) = @_;

    print $debug . __LINE__ . " Enter change_password\n";  # Debug print

    # Retrieve the user from the database
    my $user = $c->model('DB::User')->find({ username => $username });

    if ($user) {
        print $debug . __LINE__ . " User found: " . Dumper($user) . "\n";  # Debug print

        # Hash the new password
        my $hashed_password = $c->model('DB')->hash_password($new_password);

        print $debug . __LINE__ . " Hashed password: $hashed_password\n";  # Debug print

        # Update the password in the database
        $user->update({ password => $hashed_password });

        print $debug . __LINE__ . " Password updated successfully\n";  # Debug print

        $c->stash(success_msg => 'Password changed successfully.');
    } else {
        print $debug . __LINE__ . " User not found\n";  # Debug print

        $c->stash(error_msg => 'User not found.');
    }

    $c->stash(template => 'user/change_password.tt');
    $c->forward($c->view('TT'));
}sub create_or_update_schema {
    my ($self, $c) = @_;

    # Get the ShantaForager schema
    my $schema = $c->model('DB')->shanta_forager_schema->schema;

    # Use DBIx::Class's deploy method to create the schema in the database if it doesn't exist
    $schema->deploy({ add_drop_table => 0 });
}
sub shanta_forager_schema {
    my ($self, $c) = @_;
    return $c->model('DB::ShantaForager');
}
__PACKAGE__->meta->make_immutable(inline_constructor => 0);

1;