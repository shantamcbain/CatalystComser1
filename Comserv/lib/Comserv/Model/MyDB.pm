package Comserv::Model::MyDB;
use Moose;
use namespace::autoclean;
use JSON::MaybeXS qw(decode_json encode_json);
use Term::ReadPassword;
extends 'Catalyst::Model';
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

    # Create an instance of the Encryption module
    my $encryption = Comserv::Model::Encryption->new();

    # Check if the encrypted DBI file exists and is not empty
    if (-e 'encrypted_dbi_data.dat' && -s 'encrypted_dbi_data.dat') {
        # If the file exists and is not empty, read the file
        open my $fh, '<', 'encrypted_dbi_data.dat' or die "Cannot open encrypted_dbi_data.dat: $!";
        my @lines = <$fh>;
        close($fh);

        # Decrypt the first line to get the encryption key
        my $encrypted_encryption_key = $lines[0];
        chomp $encrypted_encryption_key;

        # Check if the encrypted encryption key is a multiple of 16 bytes
        if (length($encrypted_encryption_key) % 16 != 0) {
            die "Error: Encrypted encryption key is not a multiple of 16 bytes";
        }

        my $encryption_key = $encryption->decrypt($encrypted_encryption_key, $ENV{'MASTER_KEY'});

        # Decrypt the second line to get the JSON string
        my $encrypted_dbi_info = $lines[1];
        chomp $encrypted_dbi_info;
        my $dbi_info_json = $encryption->decrypt($encrypted_dbi_info, $encryption_key);

        # Decode the JSON string to get the DBI information
        my $dbi_info = decode_json($dbi_info_json);

        # Test the DB connection using the decrypted DBI information
        if ($self->_test_db_connection($dbi_info)) {
            print "DB connection test successful. Returning the decrypted DBI information.\n";
            return $dbi_info;  # Return the decrypted DBI information
        }
    }

    # If the file doesn't exist or the connection test failed, prompt the user for DBI information
    my $dbi_info = $self->_prompt_user_for_dbi_info();

    # Generate a new encryption key
    my $encryption_key = $self->_generate_random_key();

    # Encrypt the encryption key using the master key and save it to the file
    my $encrypted_encryption_key = $encryption->encrypt($encryption_key, $ENV{MASTER_KEY});
    open(my $fh, '>', 'encrypted_dbi_data.dat') or die "Cannot open encrypted_dbi_data.dat for writing: $!";
    print $fh $encrypted_encryption_key . "\n";

    # Convert the DBI information to JSON
    my $json = JSON::MaybeXS->new->allow_nonref;
    my $dbi_info_json = $json->encode($dbi_info);

    # Encrypt the DBI information (now in JSON format) using the encryption key
    my $encrypted_dbi_info = $encryption->encrypt($dbi_info_json, $encryption_key);

    # Write the encrypted DBI information to the file
    print $fh $encrypted_dbi_info . "\n";
    close($fh);

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
    my $self = shift;

    # Open the .dat file
    open my $fh, '<', 'encrypted_dbi_data.dat' or die "Cannot open encrypted_dbi_data.dat: $!";
    my $encrypted_data = do { local $/; <$fh> };
    close($fh);

    # Create an instance of the Encryption module
    my $encryption = Comserv::Model::Encryption->new();

    # Decrypt the encrypted data
    my $decrypted_data = $encryption->decrypt($encrypted_data, $ENV{'MASTER_KEY'});

    # Decode the decrypted data from JSON
    my $dbi_info = decode_json($decrypted_data);

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

# Method to test the DB connection using the DBI information
sub _test_db_connection {
    my ($self, $dbi_info) = @_;

    # Perform the necessary code to test the database connection using the $dbi_info
    # Return true if the connection is successful, false otherwise
    # [Add code here to test the database connection]
    # For example, using DBI to connect and execute a simple query
    my $dbh = DBI->connect("DBI:mysql:$dbi_info->{database}", $dbi_info->{username}, $dbi_info->{password});
    if ($dbh) {
        my $query = "SELECT 1";
        my $sth = $dbh->prepare($query);
        if ($sth && $sth->execute) {
            $sth->finish;
            $dbh->disconnect;
            return 1;  # Connection successful
        }
        $sth->finish;
        $dbh->disconnect;
    }

    return 0;  # Connection failed
}

# Method to prompt the user for DBI information
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
        username => $username,
        password => $password,
        database => $database,
    };

    return $dbi_info;
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
