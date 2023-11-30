package Comserv::Controller::ToDo;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }
    __PACKAGE__->config(
        'default'   => 'text/html',
        'namespace' => '',
    );

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash(template => 'todo/todo.tt');
    $c->forward($c->view('TT'));
}
sub auto :Private {
    my ($self, $c) = @_;

    # Define the private actions
    my @private_actions = ('todo', 'add', 'create');

    # Get the last part of the action name
    my ($action_name) = $c->action->name =~ /([^\/]+)$/;

    # If the requested action is a private action and a user doesn't exist in the session, store the original path and force login
    if (grep { $_ eq $action_name } @private_actions && !$c->user_exists) {
        $c->session->{original_path} = $c->request->uri;
        $c->response->redirect($c->uri_for('/login'));
        return 0;
    }

    # If a user exists in the session or the action is not a private action, continue processing the request
    return 1;
}
sub add :Path('add') :Args(0) {
    my ( $self, $c ) = @_;

    # Retrieve the submitted form data
    my $params = $c->req->params;

    # Stash the form data so it can be accessed in the addtodo.tt form
    $c->stash(todo => $params);

    $c->stash(template => 'todo/addtodo.tt');
    $c->forward($c->view('TT'));
}
sub check_password {
    my ($self, $password, $hashed_password) = @_;

    # Use a password hashing module to check the password
    # This is just an example, replace it with your actual password checking logic
    use Authen::Passphrase::BlowfishCrypt;
    my $ppr = Authen::Passphrase::BlowfishCrypt->from_crypt($hashed_password);

    return $ppr->match($password);
}
sub create :Path('create') :Args(0) {
    my ( $self, $c ) = @_;

    # Retrieve the submitted form data
    my $params = $c->req->params;

    # Create a new record with the submitted data
    my $new_record = {
        record_id           => $params->{record_id},
        sitename            => $params->{sitename},
        start_date          => $params->{start_date},
        due_date            => $params->{due_date},
        subject             => $params->{subject},
        description         => $params->{description},
        estimated_man_hours => $params->{estimated_man_hours},
        accumulative_time   => $params->{accumulative_time},
        project_code        => $params->{project_code},
        status              => $params->{status},
        priority            => $params->{priority},
        share               => $params->{share},
        last_mod_by         => $params->{last_mod_by},
        last_mod_date       => $params->{last_mod_date},
        group_of_poster     => $params->{group_of_poster},
        user_id             => $params->{user_id},
        project_id          => $params->{project_id},
    };

    # Call the model method to save the new record
    $c->model('Model::Todo')->add_new_record($new_record);

    # Redirect to the todo.tt template or any other desired page
    $c->response->redirect($c->uri_for('/todo'));
}
sub add_project :Path(/add_project) :Args(0) {
    my ($self, $c) = @_;

    # Set the TT template to use
    $c->stash(template => 'todo/add_project.tt');
    $c->forward($c->view('TT'));
}
sub insert_into_project_table :Private {
    my ($self, $c, $project_details) = @_;

    # Retrieve the username_of_poster and group_of_poster from the session
    $project_details->{username_of_poster} = $c->session->{username};
    $project_details->{group_of_poster} = $c->session->{group};

    # Update the date_time_posted field to the current datetime
    $project_details->{date_time_posted} = DateTime->now();

    # Insert the new project into the database
    my $new_project = $c->model('DB::Project')->create($project_details);

    # Check if the insertion was successful
    if ($new_project->in_storage) {
        $c->log->info("New project inserted successfully");
    } else {
        $c->log->error("Failed to insert new project");
    }
}__PACKAGE__->meta->make_immutable;
use Try::Tiny;

sub add_site :Path(/add_site) :Args(0) {
    my ($self, $c) = @_;

    # Try to retrieve all the sites from the database
    my @sites;
    try {
        @sites = $c->model('Site')->all;
    } catch {
        # If an error occurs (e.g., the table does not exist), log the error and handle it
        $c->log->error("Failed to retrieve sites: $_");

        # Check if the user is an admin
        if ($c->user_exists && $c->user->is_admin) {
            # If the user is an admin, set a flag in the stash to show the "Add Table" button in the template
            $c->stash(show_add_table_button => 1);
        }
    };

    # Pass the sites to the template
    $c->stash(sites => \@sites);

    # Set the TT template to use
    $c->stash(template => 'todo/add_site.tt');
    $c->forward($c->view('TT'));
}
sub create_site :Path('/create_site') :Args(0) {
    my ($self, $c) = @_;

    # Try to get the Site source
    my $site_source;
    try {
        $site_source = $c->model('Schema::Result::Site')->result_source;
    } catch {
        # If an error occurs (e.g., the Site source does not exist), handle it
        $c->log->error("Failed to retrieve Site source: $_");
    };

    if (!defined $site_source) {
        # If the Site source does not exist, create it
        $self->create_table_from_schema($c, 'Schema::Result::Site');
    }

    # Retrieve the submitted site name
    my $site_name = $c->request->params->{site_name};

    # Check if a site with the submitted name already exists
    my $existing_site = $c->model('Schema::Result::Site')->find({ name => $site_name });
    if ($existing_site) {
        # If a site with the submitted name already exists, set an error message and redirect back to the add_site page
        $c->stash(error_msg => 'A site with this name already exists.');
        $c->response->redirect($c->uri_for('/add_site'));
        return;
    }

    # Create a new site record with the submitted name
    $c->model('Schema::Result::Site')->create({ name => $site_name });

    # Redirect back to the add_site page
    $c->response->redirect($c->uri_for('/add_site'));
}
sub create_table_from_schema {
    my ($self, $c, $table_schema_class) = @_;

    # Get the schema object
    my $schema = $c->model('Schema');

    # Get the source name from the table schema class
    my ($source_name) = $table_schema_class =~ /::(\w+)$/;

    # Get the source object for the table
    my $source = $schema->source($source_name);

    # Deploy the source object to create the table
    $source->deploy;
}