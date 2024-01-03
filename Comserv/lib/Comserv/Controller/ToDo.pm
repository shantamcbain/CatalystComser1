package Comserv::Controller::ToDo;
use Moose;
use namespace::autoclean;
use DateTime;
use Try::Tiny;
my $debug = "Comserv::Controller::ToDo Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";

print $debug . __LINE__ . " Enter auto\n";  # Add this linedebug_log($debug . __LINE__ . " Enter Root\n");

BEGIN { extends 'Catalyst::Controller'; }
    __PACKAGE__->config(
        'default'   => 'text/html',
        'namespace' => '',
    );

sub index :Path('todo'):Args(0) {
    my ( $self, $c ) = @_;
    $c->session->{return_url} = $c->req->uri;
    $c->stash(template => 'todo/todo.tt');
    $c->forward($c->view('TT'));
}
sub aauto :Private {
    my ($self, $c) = @_;
    print $debug . __LINE__ . " Enter auto\n";  # Add this line

    # Define the private actions
    my @private_actions = ('todo', 'add', 'create');

    # Get the last part of the action name
    my ($action_name) = $c->action->name =~ /([^\/]+)$/;

    # If the requested action is a private action and a user doesn't exist in the session, store the original path and force login
    if (grep { $_ eq $action_name } @private_actions && !$c->user_exists) {
        $c->session->{original_path} = $c->request->uri;
        $c->response->redirect($c->uri_for('/login'));
        $c->detach();  # Detach instead of returning false
    }

    # If a user exists in the session or the action is not a private action, continue processing the request
    return 1;
}
sub add :Path('todo/add') :Args(0) {
    my ( $self, $c ) = @_;

    # Retrieve the submitted form data
    my $params = $c->req->params;

    # Stash the form data so it can be accessed in the addtodo.tt form
    $c->stash(todo => $params);
    $c->session->{return_url} = $c->req->uri;
    $c->stash(template => 'todo/addtodo.tt');
    $c->forward($c->view('TT'));
}
use Try::Tiny;

sub create :Path('create') :Args(2) {
    my ($self, $c, $database, $table) = @_;

    my $debug = "Comserv::Model::DB Line #";
    print $debug . __LINE__ . " Enter create\n";
    Comserv::debug_log($debug . __LINE__ . " Enter create\n");

    # Retrieve the DBI handle from Comserv::Model::DB
    my $dbh = $c->model('DB')->_build_dbh();

    # Construct the model name from the database and table names
    my $model = 'DB::' . ucfirst($database) . '::' . ucfirst($table);

    try {
        print $debug . __LINE__ . " Trying to create record\n";
        Comserv::debug_log($debug . __LINE__ . " Trying to create record\n");

        # Check if the table exists in the database
        my $sth = $dbh->table_info(undef, $database, $table, 'TABLE');
        my $info = $sth->fetchrow_hashref;

        # If the table doesn't exist in the database, create it
        if (!$info) {
            my $deploy_result = $c->model('DB')->schema->source($model)->deploy({ add_drop_table => 0 });

            if (!$deploy_result) {
                print $debug . __LINE__ . " Failed to create table\n";
                die "Failed to create table";
            }
            print $debug . __LINE__ . " Created table\n";
        }

        # Retrieve the submitted form data
        my $params = $c->req->params;

        # Create a new record with the submitted data
        my $new_record = $c->model($model)->create($params);

        # Redirect to the old_todo route
        $c->response->redirect($c->uri_for("/old_todo"));
    }
    catch {
        my $error = $_;

        # Log the error to the command line
        warn $error;

        # Log the error to the debug file
        open my $fh, '>>', 'debug.log' or die "Could not open debug.log: $!";
        print $fh $error;
        close $fh;

        # Pass the error message to the template
        $c->stash(error_msg => $error);

        # Set the template
        $c->stash(template => 'error.tt');

        # Forward to the view
        $c->forward($c->view('TT'));
    };
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
}
sub select_tables :Path('select_tables') :Args(0) {
    my ($self, $c) = @_;

    print $debug . __LINE__ . " Enter select_tables\n";  # Debug print

    # Retrieve the selected databases from the form data
    my @selected_databases = $c->req->param('databases');

    # Check if any databases were selected
    if (!@selected_databases) {
        print $debug . __LINE__ . " No databases selected\n";  # Debug print
        Comserv::debug_log($debug . __LINE__ . " No databases selected\n");  # Debug log
        $c->stash(error_msg => "No databases selected");
        return;
    }

    print $debug . __LINE__ . " Retrieved " . scalar(@selected_databases) . " selected databases\n";  # Debug print

    # Retrieve the list of tables for each selected database
    my %tables;
    foreach my $database (@selected_databases) {
        my $tables_ref = eval { $c->model('DB')->get_tables($c, $database) };
        if ($@ || !defined $tables_ref) {
            print $debug . __LINE__ . " Error retrieving tables for database $database: $@\n";  # Debug print
            Comserv::debug_log($debug . __LINE__ . " Error retrieving tables for database $database: $@\n");  # Debug log
            $c->stash(error_msg => "Error retrieving tables for database $database: $@");
            return;
        }
        my @tables = @{$tables_ref};
        $tables{$database} = \@tables;

        print $debug . __LINE__ . " Retrieved " . scalar(@tables) . " tables for database $database\n";  # Debug print
        Comserv::debug_log($debug . __LINE__ . " Retrieved " . scalar(@tables) . " tables for database $database\n");  # Debug log
    }

    # Stash the list of tables so it can be accessed in the template
    $c->stash(tables => \%tables);

    # Set the template to use
    $c->stash(template => 'todo/select_tables.tt');

    # Forward processing to the TT view
    $c->forward($c->view('TT'));
}
sub old_todo_add :Path('old_todo_add') :Args(2) {
    my ($self, $c, $database, $table) = @_;

    # Construct the model name from the database and table names
    my $model = 'DB::' . ucfirst($database) . '::' . ucfirst($table);

    # Get the result source for the table
    my $source = $c->model($model)->result_source;

    # Get the column names of the table
    my @columns = $source->columns;

    # Retrieve the distinct company_code values from the cscclienttb table
    my @company_codes = $c->model('DB::ShantaForager::Cscclienttb')->search(
        {},  # No search conditions
        {
            select   => ['company_code'],  # Select only the company_code column
            distinct => 1,  # Remove duplicates
        }
    )->get_column('company_code')->all;

    # Retrieve the distinct sitename values from the ency_site table
    my @sites = $c->model('DB::ShantaForager::Cscclienttb')->search(
        {},  # No search conditions
        {
            select   => ['company_code'],  # Select only the sitename column
            distinct => 1,  # Remove duplicates
        }
    )->get_column('company_code')->all;

    # Retrieve the distinct project_code values from the appropriate table
    my @project_codes = $c->model('DB::ShantaForager::CscProjectTb')->search(
        {},  # No search conditions
        {
            select   => ['project_code'],  # Select only the project_code column
            distinct => 1,  # Remove duplicates
        }
    )->get_column('project_code')->all;

    # Define the status and priority hashes
    my %status = ( 1 => 'NEW', 2 => 'IN PROGRESS', 3 => 'DONE', );
    my %priority = (
        1 => 'LOW',
        2 => 'MODERATE',
        3 => 'CONSIDERABLE',
        4 => 'HIGH',
        5 => 'EXTREME',
    );
    my %share = (
       'pub'		=> 'Every Body',
       'priv'		=> 'This is personal.',
   );

    # Pass the column names, company_code values, sitename values, project_code values, status, and priority to the template
    $c->stash(columns => \@columns);
    $c->stash(company_codes => \@company_codes);
    $c->stash(sites => \@sites);
    $c->stash(project_codes => \@project_codes);
    $c->stash(status => \%status);
    $c->stash(priority => \%priority);
    $c->stash(share => \%share);

    # Set the template
    $c->stash(template => 'todo/old_todo_add.tt');

    # Forward to the view
    $c->forward($c->view('TT'));
}
sub list_databases :Path('list_databases') :Args(0) {
    my ($self, $c) = @_;
    print $debug . __LINE__ . " Enter list_databases\n";  # Debug

        my $databases = $c->model('DB')->get_databases($c);
    print $debug . __LINE__ . " Retrieved " . scalar(@{$databases}) . " databases\n";  # Debug print
    $c->stash(databases => $databases);
    $c->stash(template => 'todo/list_databases.tt');
    $c->response->content_type('text/html');
    $c->forward($c->view('TT'));
}
sub old_todo :Path('old_todo') :Args(0) {
    my ($self, $c) = @_;

    # Retrieve the todos from the csc_todo table
    my @todos = $c->model('DB::ShantaForager::CscTodoTb')->search(
        { status =>  { '!=' => '3' } },  # Filter out the completed tasks
        { order_by => { -desc => ['priority', 'due_date'] } }  # Sort by priority and due date
    );

    # Pass the todos to the template
    $c->stash(todos => \@todos);

    # Set the template
    $c->stash(template => 'todo/old_todo.tt');

    # Forward to the view
    $c->forward($c->view('TT'));
}
sub details :Path('todo/details') :Args(3) {
    my ($self, $c, $database, $table, $record_id) = @_;

    # Construct the model name from the database and table names
    my $model = 'DB::' . $database . '::' . $table;

    # Retrieve the record from the database using the record_id
    my $record = $c->model('DB')->get_record_by_id($c, $database, $table, $record_id);

    # Check if the record exists
    if (!$record) {
        $c->stash(error_msg => "No record found with id: $record_id");
        $c->stash(template => 'error.tt');
    } else {
        # Get the column names of the record
        my @columns = $record->result_source->columns;

        # Pass the record and the column names to the template
        $c->stash(record => $record);
        $c->stash(columns => \@columns);

        # Set the template
        $c->stash(template => 'todo/details.tt');
    }

    # Forward to the view
    $c->forward($c->view('TT'));
}
sub modify :Path('modify') :Args(3) {
    my ($self, $c, $database, $table, $record_id) = @_;

    # Construct the model name from the database and table names
    my $model = 'DB::' . ucfirst($database) . '::' . ucfirst($table);

    # Retrieve the record from the database using the record_id
    my $record = $c->model($model)->find($record_id);

    # Check if the record exists
    if (!$record) {
        $c->stash(error_msg => "No record found with id: $record_id");
        $c->stash(template => 'error.tt');
        $c->forward($c->view('TT'));
        return;
    }

    # Retrieve the submitted form data
    my $params = $c->req->params;

    # Add the username of the current user and the current date to the data
    $params->{last_mod_by} = $c->session->{username} // 'unknown';  # Use 'unknown' if the username is undefined
    $params->{last_mod_date} = DateTime->now->strftime('%Y-%m-%d %H:%M:%S');

    # Update the record with the submitted data
    $record->update($params);

    # Set a success message in the stash
    $c->stash(success_msg => "Record updated successfully");

    # Redirect to the form page for the record
    $c->response->redirect($c->uri_for("/todo/details/$database/$table/$record_id"));
}