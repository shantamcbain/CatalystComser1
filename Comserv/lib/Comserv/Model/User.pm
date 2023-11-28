package Comserv::Model::User;
use Moose;
use namespace::autoclean;
extends 'Catalyst::Model';

=head1 NAME

Comserv::Model::User - Catalyst Model

my $debug = "Comserv::Model::User Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";

print $debug . __LINE__ . join("\n", @INC);
print $debug . __LINE__ . "\n";


has 'username' => (is => 'rw', isa => 'Str', default => 'shanta');
has 'password' => (is => 'rw', isa => 'Str');  # This should be a hashed password
has 'roles' => (is => 'rw', isa => 'ArrayRef[Str]', default => sub { ['admin'] });



# Hash a password
sub hash_password {
    my ($self, $password) = @_;
    return sha256_hex($password);
}
# Check a password against a hashed password
sub check_password {
    my ($self, $password, $hashed_password) = @_;
    return $self->hash_password($password) eq $hashed_password;
}

# Check if a user has a certain role
sub has_role {
    my ($self, $role) = @_;
    return grep { $_ eq $role } @{$self->roles};
}
# Method to find a user by username
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
}__PACKAGE__->meta->make_immutable;

1;
