package Comserv::Controller::Root;
use Moose;
use namespace::autoclean;
use DateTime;
use Catalyst qw/-Debug/;

my $debug = "Comserv::Controller::Root Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";

BEGIN { extends 'Catalyst::Controller' }
__PACKAGE__->config(namespace => '');

=head1 NAME
Comserv::Controller::Root - Root Controller for Comserv

=head1 DESCRIPTION
[enter your description here]

=head1 METHODS

=head2 index
The root page (/)

=cut
sub index :Path :Args(0) {
    my ($self, $c) = @_;
    my $site_name = $c->stash->{SiteName};
    $c->stash(template => 'home.tt');
    $c->model('MyDB')->dbi_info;
    print $debug. __LINE__. " Site Name: $site_name\n";
    $c->forward($c->view('TT'));
}

sub catalyst_help :Path('/catalyst_help') {
    my ($self, $c) = @_;
    $c->response->body($c->welcome_message);
}
sub login :Path('/login') :Args(0) {
    my ($self, $c) = @_;

    if ($c->request->method eq 'POST') {
        my $username = $c->request->params->{username};
        my $password = $c->request->params->{password};

        # Retrieve the user from the database
        my $user = $c->model('User')->get_user($username);

        # Check the password
        if ($user && $user->check_password($password)) {
            # The username and password are correct
            # Create a user session...
        } else {
            # The username or password is incorrect
            # Handle the error...
        }
    }

    $c->stash(template => 'login.tt');
    $c->forward($c->view('TT'));
}
=head2 default
Standard 404 error page

=cut
sub css_form :Path('/css_form') {
    my ($self, $c) = @_;
    my $site_name = $c->stash->{SiteName};
    print $debug. __LINE__. " Site Name: $site_name\n";
    # Rest of the code...
}
sub setup :Path('/setup') {
    my ($self, $c) = @_;
    my $site_name = $c->stash->{SiteName};
    print $debug. __LINE__. " Site Name: $site_name\n";
    $c->stash(template => 'setup.tt');
    $c->forward($c->view('TT'));

}
sub generate_new_key :Path('/generate_new_key') {
    my ($self, $c) = @_;
    my $site_name = $c->stash->{SiteName};
    print $debug. __LINE__. " Site Name: $site_name\n";
    # In your controller
    $c->model('MyDB')->_build_dbi_info($c);
    $c->stash(template => 'newkey.tt');
    $c->forward($c->view('TT'));

}
sub generate_new_key :Path('/generate_new_key') :Args(0) {
    my ($self, $c) = @_;

    # Create an instance of the MyDB model
    my $mydb = $c->model('MyDB');

    # Generate a new encryption key
    my $new_key = $mydb->_generate_random_key();

    # Save the new key to the encrypted_dbi_data.dat file
    $mydb->_save_encrypted_dbi_info($new_key, $ENV{MASTER_KEY});

    # Redirect the user back to the original page
    $c->response->redirect($c->uri_for('/'));
}
sub default :Path {
    my ($self, $c) = @_;
    $c->response->body('Page not found');
    $c->response->status(404);
}

# Other methods ...

=head1 AUTHOR
Shanta McBain

=head1 LICENSE
This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;