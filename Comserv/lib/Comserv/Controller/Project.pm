package Comserv::Controller::Project;

use Moose;
use namespace::autoclean;
use Data::Dumper;  # Add this line

BEGIN { extends 'Catalyst::Controller'; }

sub auto :Private {
    my ($self, $c) = @_;


    # If a user exists in the session, continue processing the request
    return 1;
}
sub add :Path(/project/add) :Args(0) {
    my ($self, $c) = @_;
$c->session->{return_url} = $c->req->uri;

    # Set the TT template to use
    $c->stash(template => 'add_project.tt');
$c->forward($c->app->view('TT'));
}# Your other methods (add, modify, delete) go here

__PACKAGE__->meta->make_immutable;

1;