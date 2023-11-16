# Comserv/Controller/Setup.pm
package Comserv::Controller::Setup;

use Moose;
use namespace::autoclean;
use Comserv::Model::MyDB;  # Import your MyDB module

BEGIN { extends 'Catalyst::Controller'; }

# Display the setup form
# Comserv/Controller/Setup.pm

sub index :Path :Args(0) {
    my ($self, $c) = @_;

    if ($c->req->method eq 'POST') {
        my $host     = $c->req->params->{host};
        my $user     = $c->req->params->{user};
        my $password = $c->req->params->{password};

        my $result = Comserv::Model::MyDB->initialize_dbi($host, $user, $password);

        if ($result->{status} eq 'success') {
            $c->res->redirect($c->uri_for('/'));  # Redirect to home page
            $c->detach();
        } else {
            $c->stash->{error_message} = $result->{error_message};
        }
    }

    $c->stash(template => 'setup.tt');
}

__PACKAGE__->meta->make_immutable;
1;
