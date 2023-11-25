package Comserv::Model::MyDB;
use Moose;
use namespace::autoclean;
use Apache::DBI;
use DBI;
use JSON::MaybeXS qw(decode_json encode_json);
use Term::ReadPassword;
use Data::Dumper;
extends 'Catalyst::Model';

my $debug = "Comserv::Model::MyDB Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";

my $env_master_key = '12345678901234567890123456789012';
$ENV{MASTER_KEY} = $env_master_key;
print $debug . __LINE__ . " MASTER_KEY: $ENV{MASTER_KEY}\n";

# Builder method to create the DBI handle
# Builder method to create the DBI handle
sub _build_dbh {
    my ($self, $c) = @_;

    # Retrieve the DBI information
    my $dbi_info = $self->dbi_info($c);

    # Connect to the database
    my $dbh = DBI->connect("DBI:mysql:database=$dbi_info->{database};host=$dbi_info->{host}", $dbi_info->{username}, $dbi_info->{password});

    # If the connection fails, store the DBI error and connection status in the stash and session
    if (!$dbh) {
        my $error_message = "DBI error: " . DBI->errstr;
        $c->stash(last_error => $error_message);
        $c->stash(dbi_connected => 0);
        $c->session(last_error => $error_message);
        $c->session(dbi_connected => 0);
        return;
    }

    # If the connection is successful, store the connection status in the stash and session
    $c->stash(dbi_connected => 1);
    $c->session(dbi_connected => 1);

    return $dbh;
}
# Method to get the dbi_info
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

# Method to set the dbi_info
sub set_dbi_info {
    my ($self, $c) = @_;

    # Clear the existing dbi_info
    $self->{dbi_info} = undef;

    # If dbi_info is already defined in the session, return it
    if ($c->session->{dbi_info}) {
        $self->{dbi_info} = $c->session->{dbi_info};
        $c->stash->{dbi_info} = $c->session->{dbi_info};
        return $self->{dbi_info};
    }

    # Try to read the DBI information from the form data
    my $dbi_info = $c->request->parameters;

    # If the DBI information is not provided in the form data, set an error message in the stash
    if (!defined $dbi_info || !$self->_test_db_connection($c, $dbi_info)) {
        $c->stash(error_message => 'DBI information is missing or invalid.');
        return;
    }

    # Store the DBI information in the object, session, and stash
    $self->{dbi_info} = $dbi_info;
    $c->session->{dbi_info} = $dbi_info;
    $c->stash->{dbi_info} = $dbi_info;

    return $self->{dbi_info};
}
# Method to read the DBI information from the file
sub _read_dbi_info_from_file {
    my ($self, $c) = @_;
    print $debug . __LINE__ . " in _read_dbi_info_from_file\n";
    # Path to the DBI information file
    my $file = 'dbi_info.dat';

    # Check if the file exists
    if (-e $file && -r $file) {
        # If the file exists, open it
        open my $fh, '<', $file or die "Cannot open $file: $!";
        print $debug . __LINE__ . " Opened file: $file\n";

        # Read the file content
        my $json_text = do { local $/; <$fh> };
        print $debug . __LINE__ . " json_text: $json_text\n";

        # Close the file
        print $debug . __LINE__ . " Closed file: $file\n";
        close($fh);

        # Decode the JSON text to get the DBI information
        my $dbi_info;
        eval {
            $dbi_info = decode_json($json_text);
            1;
        } or do {
            my $error = $@;
            print $debug . __LINE__ . " Failed to decode JSON: $error\n";
            $c->session(last_error => "Failed to decode JSON: $error");  # Store the error message in the session
            return undef;  # Return undef if JSON decoding fails
        };

        return $dbi_info;
    }

    # If the file does not exist, return undef
    print $debug . __LINE__ . " File does not exist: $file\n";
    $c->session(last_error => "File does not exist: $file");  # Store the error message in the session
    return undef;
}

# Method to test the DB connection
# Method to test the DB connection
sub _test_db_connection {
    my ($self, $c, $dbi_info) = @_;

    print $debug . __LINE__ . " in _test_db_connection\n";
    print $debug . __LINE__ . " dbi_info: " . Dumper($dbi_info) . "\n";
    my ($self, $c, $dbi_info) = @_;

    print $debug . __LINE__ . " dbi_info: $dbi_info\n";

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
__PACKAGE__->meta->make_immutable(inline_constructor => 0);

1;