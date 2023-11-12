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
    print $debug. __LINE__. " Site Name: $site_name\n";
    $c->forward($c->view('TT'));
}

sub catalyst_help :Path('/catalyst_help') {
    my ($self, $c) = @_;
    $c->response->body($c->welcome_message);
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