package Comserv::Controller::Project;

use Moose;
use namespace::autoclean;
use Data::Dumper;  # Add this line

BEGIN { extends 'Catalyst::Controller'; }
my $debug = "Comserv::Controller::Project Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";
print $debug . __LINE__ . " Enter auto\n";  # Add this linedebug_log($debug . __LINE__ . " Enter Root\n");

sub aauto :Private {
    my ($self, $c) = @_;
print $debug . __LINE__ . " Enter auto\n";
    # Add this line

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