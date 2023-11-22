package Comserv::Model::User;
use Moose;
use namespace::autoclean;

extends 'Catalyst::Model';

=head1 NAME

Comserv::Model::User - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.


=encoding utf8

=head1 AUTHOR

Shanta McBain

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
my $debug = "Comserv::Model::User Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";



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

__PACKAGE__->meta->make_immutable;

1;
