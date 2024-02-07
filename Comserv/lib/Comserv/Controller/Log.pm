package Comserv::Controller::Log;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Comserv::Controller::Log - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $log_model = $c->model('Log');
    $log_model->write_log('This is a log message');

    $c->response->body('Matched Comserv::Controller::Log in Log.');
}

sub log_form :Path('log_form') :Args(0) {
    my ( $self, $c ) = @_;
    print "In log_form\n";
    my $log_model = $c->model('Log');

    # Check if the form has been submitted
    if ($c->request->parameters->{message}) {
    # Get the message from the form input
    my $message = $c->request->params->{message};

    # Pass the context object and the message to the write_log method
    $log_model->write_log($c, $message);
    $log_model->write_log($c, $message);
    }

    # Pass the context object to the get_log_data method
    my $log_data = $log_model->get_log_data($c);

    # Stash the log data and the template name so they can be accessed in the template
    $c->stash(log_data => $log_data, template => 'log/log_form.tt');

    # Detach to the View component to render the template
    $c->detach($c->view('TT'));
}

sub add_log_entry :Local {
    my ($self, $c) = @_;

    # Get the log data from the form
    my $log_entry = $c->request->params->{log_entry};

    # Write the log data to the log file
    $c->model('Log')->write_log($log_entry);

    # Redirect to the log form
    $c->response->redirect($c->uri_for($self->action_for('log_form')));
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
