package Comserv::Controller::Monashee::Controller::Monashee;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }
my $debug = "Comserv::Controller::Monashee::Controller::Monashee # " . __LINE__ . "\n";

print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package:
" . (caller(1))[0] . "\n";
sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    print $debug. __LINE__. "Callin home page\n";
    $c->stash(template => 'Monashee/Monashee.tt', layout => 'layout.tt');
    $c->forward($c->view('TT'));  # Render the template
}

sub csc :Path('/Monashee') :Args(0) {
    my ($self, $c) = @_;
    print $debug. __LINE__. "Calling home page\n";
    $c->stash(template => 'Monashee/Monashee.tt', layout => 'layout.tt');
    $c->forward($c->view('TT'));  # Render the template
}

__PACKAGE__->meta->make_immutable;

1;