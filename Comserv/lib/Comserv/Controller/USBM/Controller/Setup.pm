# Comserv/Controller/Setup.pm
package Comserv::Controller::USBM::Controller::Setup;

use Moose;
use namespace::autoclean;
my $debug = "Comserv::Model::DB Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";

BEGIN { extends 'Catalyst::Controller'; }

# Display the setup form
# Comserv/Controller/Setup.pm

sub index :Path :Args(0) {
    my ($self, $c) = @_;

    if ($c->req->method eq 'POST') {
        my $host     = $c->req->params->{host};
        my $user     = $c->req->params->{user};
        my $password = $c->req->params->{password};

        my $result = Comserv::Model::DB->initialize_dbi($host, $user, $password);

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
