package Comserv::Model::User;
use Moose;
use namespace::autoclean;
use Data::Dumper;  # Add this line
extends 'Catalyst::Model';

my $debug = "Comserv::Model::User Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";
Comserv::debug_log($debug . __LINE__ . " Enter Root\n");
sub find_user {
    my ($self, $c, $username) = @_;

    # Print debug information
    print $debug . __LINE__ . " Enter find_user\n";
    Comserv::debug_log($debug . __LINE__ . " Enter find_user\n");
    print $debug . __LINE__ . " Username: $username\n";
    Comserv::debug_log($debug . __LINE__ . " Username: $username\n");

    # Retrieve the DBI handle
    my $dbh = $c->model('DB')->_build_dbh($c);
    if (!$dbh) {
        print $debug . __LINE__ . " DBI handle not retrieved\n";
        Comserv::debug_log($debug . __LINE__ . " DBI handle not retrieved\n");
        $c->stash(error_msg => 'DBI handle not retrieved.');
        return;
    }

    # Prepare the query to find the user
    my $sth = $dbh->prepare('SELECT * FROM users WHERE username = ?');
    if (!$sth) {
        print $debug . __LINE__ . " DBI error: " . $dbh->errstr . "\n";
        Comserv::debug_log($debug . __LINE__ . " DBI error: " . $dbh->errstr . "\n");
        $c->stash(error_msg => 'DBI error: ' . $dbh->errstr);
        return;
    }

    # Execute the query
    my $result = $sth->execute($username);
    if (!$result) {
        print $debug . __LINE__ . " DBI error: " . $sth->errstr . "\n";
        Comserv::debug_log($debug . __LINE__ . " DBI error: " . $sth->errstr . "\n");
        $c->stash(error_msg => 'DBI error: ' . $sth->errstr);
        return;
    }

    # Fetch the user record
    my $user = $sth->fetchrow_hashref;
    if (!$user) {
        print $debug . __LINE__ . " User not found\n";
        Comserv::debug_log($debug . __LINE__ . " User not found\n");
        $c->stash(error_msg => 'User not found.');
    } else {
        print $debug . __LINE__ . " User found: " . Dumper($user) . "\n";
        Comserv::debug_log($debug . __LINE__ . " User found: " . Dumper($user) . "\n");
    }

    return $user;
}
# Method to create a new user
sub create {
    my ($self, $c, $user_data) = @_;

    # Retrieve the DBI handle
    my $dbh = $c->model('DB')->_build_dbh($c);

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
    my ($self, $c, $password, $hashed_password) = @_;
    print $debug . __LINE__ . " Enter check_password\n";
    # Hash the provided password
    my $hashed_input_password = $self->hash_password($password);

    # Compare the hashed input password with the stored hashed password
    if ($hashed_input_password eq $hashed_password) {
        return 1;
    } else {
        print $debug . __LINE__ . " Password check failed\n";
        $c->stash(error_msg => 'Password check failed.');
        return 0;
    }
}

sub get_user {
    my ($self, $c, $username) = @_;

    # Print debug information
    print $debug . __LINE__ . " Enter get_user\n";
    Comserv::debug_log($debug . __LINE__ . " Enter get_user\n");
    print $debug . __LINE__ . " Username: $username\n";
    Comserv::debug_log($debug . __LINE__ . " Username: $username\n");

my $user = $c->model('DB')->get_user_by_username($c, $username);
    if ($user) {
        print $debug . __LINE__ . " User found: " . Dumper($user) . "\n";
        Comserv::debug_log($debug . __LINE__ . " User found: " . Dumper($user) . "\n");
        $c->stash(error_msg => 'user not found.');
    } else {
        print $debug . __LINE__ . " User not found\n";
        $c->stash(error_msg => 'User not found.');
        Comserv::debug_log($debug . __LINE__ . " User not found\n");
    }

    return $user;
}


__PACKAGE__->meta->make_immutable;

1;
