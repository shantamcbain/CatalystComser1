# In your Dev.pm file
package Comserv::Controller::Dev;

use strict;
use warnings;
use base 'Catalyst::Controller';

# Home page route
sub index :Path :Args(0) {
    my ($self, $c) = @_;

    # Render the 'dev/index.tt' template
    $c->stash(template => 'dev/index.tt');
}
sub github_projects :Local {
    my ($self, $c) = @_;

    # Render the 'dev/github_projects.tt' template
    $c->stash(template => 'dev/github_projects.tt');

    # Forward to the view
    $c->forward($c->view('TT'));
}

1;
