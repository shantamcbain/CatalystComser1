package Comserv::Model::User;
use Moose;
use namespace::autoclean;
extends 'Catalyst::Model';


sub find_user {
    my ($self, $c, $username) = @_;

    # Retrieve the DBI handle
    my $dbh = $c->model('MyDB')->_build_dbh($c);

    # Prepare the query to find the user
    my $sth = $dbh->prepare('SELECT * FROM users WHERE username = ?');

    # Execute the query
    $sth->execute($username);

    # Fetch the user record
    my $user = $sth->fetchrow_hashref;

    return $user;
}
# Method to create a new user
sub create {
    my ($self, $c, $user_data) = @_;

    # Retrieve the DBI handle
    my $dbh = $c->model('MyDB')->_build_dbh($c);

    # Prepare the query to create a new user
    my $sth = $dbh->prepare('INSERT INTO users (username, password, email) VALUES (?, ?, ?)');

    # Hash the password
    my $hashed_password = $self->hash_password($user_data->{password});

    # Execute the query
    my $result = $sth->execute($user_data->{username}, $hashed_password, $user_data->{email});

    # Check if the execute method is successful
    if (!$result) {
        # If the execute method fails, return the DBI error message
        return "DBI error: $DBI::errstr";
    }

    # Fetch the created user record
    my $user = $self->find_user($c, $user_data->{username});

    return $user;
}
sub check_password {
    my ($self, $password, $hashed_password) = @_;

    # Use Digest::SHA for SHA-256 hashing
    use Digest::SHA qw(sha256_hex);

    # Hash the provided password
    my $hashed_input_password = sha256_hex($password);

    # Compare the hashed input password with the stored hashed password
    return $hashed_input_password eq $hashed_password;
}

__PACKAGE__->meta->make_immutable;

1;
