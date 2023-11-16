package Comserv::Model::MyDB;
use Moose;
use namespace::autoclean;

extends 'Catalyst::Model';

=head1 NAME

Comserv::Model::MyDB - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.


=encoding utf8

=head1 AUTHOR

Shanta McBain

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
my $env_master_key = '12345678901234567890123456789012';

# Define the attribute to hold the DBI information
has 'dbi_info' => (
    is      => 'ro',
    lazy    => 1,
    builder => '_build_dbi_info',
);

sub _set_master_key_in_env {
    my ($self, $master_key) = @_;

    # Set the master key in the environment
    $ENV{MASTER_KEY} = $master_key;
}
# Builder method to retrieve or create the DBI information
sub _build_dbi_info {
    my $self = shift;
    # Check if the master key is available in the environment
    my $master_key = $ENV{MASTER_KEY};
    unless ($master_key && length($master_key) == 32) {
        # Redirect the user to a web page to enter the master key
        $self->_redirect_to_master_key_page();
    }

    # Check if the encrypted DBI file exists
    if (-e 'encrypted_dbi_data.dat') {
        # If the file exists, read and decrypt the DBI information
        print "Reading encrypted DBI information...\n";
        my $encrypted_dbi_info = $self->_read_encrypted_dbi_info();
        print "Encrypted DBI information read: $encrypted_dbi_info\n";
        my $decrypted_dbi_info = $self->_decrypt_dbi_info($encrypted_dbi_info);
        print "DBI information decrypted: $decrypted_dbi_info\n";

        # Test the DB connection using the decrypted DBI information
        if ($self->_test_db_connection($decrypted_dbi_info)) {
            print "DB connection test successful. Using decrypted DBI information.\n";
            return $decrypted_dbi_info;  # Return the decrypted DBI information
        }
    }

    # If the file doesn't exist or the connection test failed, prompt the user for DBI information
    print "DBI file not found or connection test failed. Prompting user for DBI information.\n";
    my $dbi_info = $self->_prompt_user_for_dbi_info();  # Prompt the user for DBI information
    print "DBI information entered by user: $dbi_info\n";
    $self->_save_encrypted_dbi_info($dbi_info);  # Save the encrypted DBI information to a file
    return $dbi_info;  # Return the new DBI information
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

    open(my $fh, '<', 'encrypted_dbi_data.dat') or die "Cannot open encrypted_dbi_data.dat: $!";
    my $encrypted_data = do { local $/; <$fh> };
    close($fh);

    return $encrypted_data;
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
    my ($self, $dbi_info) = @_;

    # Create an instance of the Encryption module
    my $encryption = Comserv::Model::Encryption->new();

    # Encrypt the DBI information
    my $encrypted_data = $encryption->encrypt($dbi_info);

    open(my $fh, '>', 'encrypted_dbi_data.dat') or die "Cannot open encrypted_dbi_data.dat for writing: $!";
    print $fh $encrypted_data;
    close($fh);
}

__PACKAGE__->meta->make_immutable(inline_constructor => 0);

;
