package Comserv::Controller::Admin;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

sub edit_admin_notes :Local :Args(0) {
    my ( $self, $c ) = @_;

    # Retrieve the DBI handle from the model
    my $dbh = $self->dbi_info->{dbh};

    # Check if $dbh is defined
    if (!defined $dbh) {
        $c->log->error("DBI handle is not defined");
        $c->response->body('Internal server error');
        $c->response->status(500);
        return;
    }

    # Prepare the SQL statement to fetch the admin notes
    my $sth = $dbh->prepare("SELECT body FROM page_tb WHERE page_code = 'SiteAdminNotes' AND sitename = ?");

    # Execute the SQL statement
    $sth->execute($c->session->{SiteName});

    # Fetch the result
    my $body = $sth->fetchrow_array;

    # Pass the body to the template
    $c->stash(body => $body);
    $c->stash(template => 'todo/edit_admin_notes.tt');

    # Render the template
    $c->forward( $c->view('TT') );
}

sub submit_admin_notes :Local :Args(0) {
    my ( $self, $c ) = @_;

    # Retrieve the new body from the form parameters
    my $new_body = $c->request->params->{body};

    # Retrieve the DBI handle from the stash
    my $dbh = $c->stash->{dbi};

    # Check if $dbh is defined
    if (!defined $dbh) {
        $c->log->error("DBI handle is not defined");
        $c->response->body('Internal server error');
        $c->response->status(500);
        return;
    }

    # Prepare the SQL statement to update the admin notes
    my $sth = $dbh->prepare("UPDATE page_tb SET body = ? WHERE page_code = 'SiteAdminNotes' AND sitename = ?");

    # Execute the SQL statement
    $sth->execute($new_body, $c->session->{SiteName});

    # Redirect the user back to the edit page
    $c->response->redirect($c->uri_for($self->action_for('edit_admin_notes')));
}
sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched Comserv::Controller::admin in admin.');
}

sub submit_admin_notes {
    my $self = shift;
    my $body = $self->param('body');

    # Validate the input...

    # Update the admin notes in the database
    my $dbh = $self->session->{dbi};
    my $sth = $dbh->prepare("UPDATE page_tb SET body = ? WHERE page_code = 'SiteAdminNotes' AND sitename = ?");
    $sth->execute($body, $self->session->{SiteName});
}


=encoding utf8

=head1 AUTHOR

Shanta McBain

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
