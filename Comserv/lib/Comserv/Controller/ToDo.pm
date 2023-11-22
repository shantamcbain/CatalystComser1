package Comserv::Controller::ToDo;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash(template => 'todo.tt');
    $c->forward($c->view('TT'));
}

sub add :Path('add') :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash(template => 'addtodo.tt');
    $c->forward($c->view('TT'));
}

sub create :Path('create') :Args(0) {
    my ( $self, $c ) = @_;

    # Retrieve the submitted form data
    my $params = $c->req->params;

    # Create a new record with the submitted data
    my $new_record = {
        sitename     => $params->{sitename},
        username     => $params->{username},
        group        => $params->{group},
        subject      => $params->{subject},
        details      => $params->{details},
        subtask      => $params->{subtask},
        startdate    => $params->{startdate},
        duedate      => $params->{duedate},
        projectcode  => $params->{projectcode},
        status       => $params->{status},
        priority     => $params->{priority},
        share_groups => $params->{share_groups},
        estimated_time => $params->{estimated_time},
    };

    # Call the model method to save the new record
    $c->model('Model::Todo')->add_new_record($new_record);

    # Redirect to the todo.tt template or any other desired page
    $c->response->redirect($c->uri_for('/todo'));
}

__PACKAGE__->meta->make_immutable;

1;