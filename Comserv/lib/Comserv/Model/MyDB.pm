package Comserv::Model::MyDB;
use Moose;
use namespace::autoclean;
use DBI;  # Add this line
use JSON::MaybeXS qw(decode_json encode_json);
use Term::ReadPassword;
extends 'Catalyst::Model';
# Rest of your code...
my $debug = "Comserv::Model::MyDB Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";

=head1 NAME

Comserv::Model::MyDB - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.


=encoding utf8

=head1 AUTHOR" @u

Shanta McBain

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

my $env_master_key = '12345678901234567890123456789012';
$ENV{MASTER_KEY} = $env_master_key;
print $debug . __LINE__ . " MASTER_KEY: $ENV{MASTER_KEY}\n";
# Define the attribute to hold the DBI information
has 'dbi_info' => (
    is      => 'ro',
    lazy    => 1,
    builder => '_build_dbi_info',
);

sub retrieve_master_key_from_secrets_manager {
    # Retrieve the MASTER_KEY from an environment variable
    my $master_key = $ENV{'MASTER_KEY'};
    print $debug . __LINE__ . "Retrieved  MASTER_KEY: $master_key\n";
    return $master_key;
}
sub _build_dbi_info {
    my ($self, $c) = @_;

    # Try to read the DBI information from the file
    my $dbi_info = $self->_read_dbi_info_from_file();

    # If the DBI information could not be read or is not valid
    if (!defined $dbi_info || !$self->_test_db_connection($c, $dbi_info)) {
        # Prompt the user for DBI information
        $dbi_info = $self->_prompt_user_for_dbi_info();
    }

    return $dbi_info;
}

sub _set_master_key_in_env {
    my ($self, $master_key) = @_;

    # Set the master key in the environment
    $ENV{MASTER_KEY} = $master_key;
}
# Builder method to retrieve or create the DBI information
    my ($self, $c) = @_;
sub _generate_random_key {
    my @chars = ('a'..'z', 'A'..'Z', 0..9, '_');
    my $key_length = 32;
    my $random_key;

    foreach (1..$key_length) {
        $random_key .= $chars[rand @chars];
    }
    print $debug . __LINE__ . " random_key: $random_key\n";
    return $random_key;
}
sub _launch_master_key_popup {
    my $self = shift;

    # Generate the HTML content for the popup
    my $popup_html = q{
        <html>
        <head>
            <title>Enter Master Key</title>
            <script>
                function submitMasterKey() {
                    var masterKey = document.getElementById('masterKeyInput').value;
                    window.opener.postMessage(masterKey, window.location.origin);
                    window.close();
                }
            </script>
        </head>
        <body>
            <h1>Enter Master Key</h1>
            <input type="text" id="masterKeyInput" placeholder="Enter master key">
            <button onclick="submitMasterKey()">Submit</button>
        </body>
        </html>
    };

    # Create a temporary HTML file for the popup content
    my $popup_file = "/path/to/popup.html";
    open(my $fh, '>', $popup_file) or die "Cannot open $popup_file for writing: $!";
    print $fh $popup_html;
    close($fh);

    # Launch the popup using the default web browser
    system("xdg-open $popup_file &");
}
# Method to read the encrypted DBI information from the file
sub _read_encrypted_dbi_info {
sub _read_dbi_info_from_file {
    my ($self) = @_;
    print $debug . __LINE__ . " in _read_dbi_info_from_file\n";
    # Path to the DBI information file
    my $file = 'dbi_info.dat';

    # Check if the file exists
    if (-e $file) {
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
        };

        return $dbi_info;
    }

    # If the file does not exist, return undef
    print $debug . __LINE__ . " File does not exist: $file\n";
    return undef;
}
# Method to test the DB connection using the DBI information
sub _test_db_connection {
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
                $sth->finish;
                $dbh->disconnect;

                # Store the result in the stash and session
                $c->stash->{db_connection_successful} = 1;
                $c->session->{db_connection_successful} = 1;

                print $debug . __LINE__ . " DB connection successful\n";
                return 1;  # Connection successful
            }
            $sth->finish;
            $dbh->disconnect;
        } else {
            # Print the DBI error message
            print "DBI error: " . DBI->errstr . "\n";
        }
    }

    # Store the result in the stash and session
    $c->stash->{db_connection_successful} = 0;
    $c->session->{db_connection_successful} = 0;

    print $debug . __LINE__ . " DB connection failed\n";
    return 0;  # Connection failed
}
sub _prompt_user_for_dbi_info {
    # [Changed] Add a comment explaining why the user is prompted for DBI information
    # If the encrypted DBI file doesn't exist or the connection test failed, prompt the user to enter DBI information
    print "Please enter the DBI information:\n";

    print "Username: ";
    my $username = <STDIN>;
    chomp $username;

    print "Password: ";
    my $password = <STDIN>;
    chomp $password;

    print "Database Name: ";
    my $database = <STDIN>;
    chomp $database;

    # Construct and return the DBI information as a hashref
    my $dbi_info = {
        host     => 'localhost',
        port     => 3306,
        username => $username,
        password => $password,
        database => $database,
    };
     # Save the DBI information to a file
    open(my $fh, '>', 'dbi_info.dat') or die "Cannot open dbi_info.dat for writing: $!";
    print $fh encode_json($dbi_info);
    close($fh);
    print $debug . __LINE__ . " dbi_info: $dbi_info\n";
    $c->stash(prompt_dbi_info => $dbi_info);
}    my ($self, $c) = @_;

    # Open the .dat file
    open my $fh, '<', 'encrypted_dbi_data.dat' or die "Cannot open encrypted_dbi_data.dat: $!";
    my @lines = <$fh>;
    close($fh);

    # Get the encrypted DBI info from the second line of the file
    my $encrypted_dbi_info = $lines[1];
    chomp $encrypted_dbi_info;

    # Create an instance of the Encryption module
    my $encryption = Comserv::Model::Encryption->new();

    # Decrypt the encrypted DBI info
    my $decrypted_data = $encryption->decrypt($encrypted_dbi_info, $ENV{'MASTER_KEY'});

    # Decode the decrypted data from JSON
    my $dbi_info = decode_json($decrypted_data);

    # Store the DBI info in the stash and session
    $c->stash->{dbi_info} = $dbi_info;
    $c->session->{dbi_info} = $dbi_info;

    return $dbi_info;
}
# Method to decrypt the DBI information
sub _decrypt_dbi_info {
    my ($self, $encrypted_data) = @_;

    # Create an instance of the Encryption module
    my $encryption = Comserv::Model::Encryption->new();

    # Decrypt the encrypted data
    return $encryption->decrypt($encrypted_data);
}

# Method to save the encrypted DBI information to a file
sub _save_encrypted_dbi_info {
    my ($self, $dbi_info, $encryption_key) = @_;

    # Create an instance of the Encryption module
    my $encryption = Comserv::Model::Encryption->new();

    # Encrypt the encryption_key using the master_key
    my $encrypted_encryption_key = $encryption->encrypt($encryption_key, $ENV{MASTER_KEY});

    # Open the file for writing
    open(my $fh, '>', 'encrypted_dbi_data.dat') or die "Cannot open encrypted_dbi_data.dat for writing: $!";

    # Write the encrypted encryption_key to the file
    print $fh $encrypted_encryption_key;

    # Check if the DBI information is provided
    if ($dbi_info) {
        # Encrypt the DBI information using the encryption_key
        my $json = JSON::MaybeXS->new->allow_nonref;
        my $encrypted_dbi_info = $encryption->encrypt($json->encode($dbi_info), $encryption_key);

        # Write the encrypted DBI information to the file
        print $fh $encrypted_dbi_info;
    }

    close($fh);
}
__PACKAGE__->meta->make_immutable(inline_constructor => 0);

;
