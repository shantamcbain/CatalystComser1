package Comserv::Controller::SunFire;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }


sub base :Chained('/') :PathPart('SunFire') :CaptureArgs(0) {
    my ($self, $c) = @_;

    # Check if the site name is 'SunFire'
    if ($c->stash->{SiteName} eq 'SunFire') {
        # Set the template
        $c->stash(template => 'SunFire/SunFire.tt');
    } else {
        # Redirect to 404 page or another appropriate page
        $c->response->redirect('/404');
    }
}

sub index :Chained('base') :PathPart('') :Args(0) {
    my ($self, $c) = @_;

    # Forward to the view
    $c->forward($c->view('TT'));
}
__PACKAGE__->meta->make_immutable;

1;