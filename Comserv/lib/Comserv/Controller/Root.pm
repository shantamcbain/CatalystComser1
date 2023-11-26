package Comserv::Controller::Root;
use Moose;
use namespace::autoclean;
use Data::Dumper;
use JSON::MaybeXS qw(encode_json);
BEGIN { extends 'Catalyst::Controller' }

sub stash_dump {
    my ($self, $c) = @_;
#    print Dumper($c->stash);
}


my $debug = "Comserv::Controller::Root Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";
Comserv::debug_log($debug . __LINE__ . " Enter Root\n");

my $site_name = 'home';
__PACKAGE__->config(namespace => '');

sub index :Path :Args(0) {
    print $debug. __LINE__. " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";
    my ($self, $c) = @_;
    my $site_name = $c->stash->{SiteName};
    print $debug . __LINE__ . " Site Name: $site_name\n";
    $c->stash(template => 'home.tt');
    $c->model('MyDB')->_build_dbi_info($c);
    print $debug. __LINE__. " Site Name: $site_name\n";
    print stash_dump($c);
    $c->forward($c->view('TT'));
}
sub auto :Private {
    my ($self, $c) = @_;

    # Get the domain name from the request
    my $domain = $c->request->uri->host;
    $c->session->{Domain} = $domain;

    # Get the site name from the URL
    my $site_name = $c->req->param('site')||'home';
    $c->stash->{SiteName} = $site_name;

    # Get the debug parameter from the URL
    my $debug_param = $c->req->param('debug');
    # If the debug parameter is defined, store it in the session
    if (defined $debug_param) {
        $c->session->{debug_mode} = $debug_param;
        $c->stash->{debug_mode} = $debug_param;
    }

    # Set the HostName and SiteName in the stash
    $c->stash->{HostName} = $c->request->base;
    $c->stash->{SiteName} = $site_name;

    # Set the SiteName and Domain in the session
    $c->session->{SiteName} = $site_name;
    $c->session->{Domain} = $domain;

    # Continue processing the rest of the request
    return 1;
}
sub catalyst_help :Path('/catalyst_help') {
    my ($self, $c) = @_;
    $c->response->body($c->welcome_message);
}
sub login :Path('/login') :Args(0) {
    my ($self, $c) = @_;

    if ($c->request->method eq 'POST') {
        my $username = $c->request->params->{username};
        my $password = $c->request->params->{password};

        # Retrieve the user from the database
        my $user = $c->model('User')->get_user($username);

        # Check the password
        if ($user && $user->check_password($password)) {
            # The username and password are correct
            # Create a user session...
        } else {
            # The username or password is incorrect
            # Handle the error...
        }
    }

    $c->stash(template => 'login.tt');
    $c->forward($c->view('TT'));
}
sub display_tables {
    my ($self, $c) = @_;

    print $debug . __LINE__ . " in display_tables\n";  # Debug print
    Comserv::debug_log($debug . __LINE__ . " Enter display_tables\n");
    # Get an instance of Comserv::Model::MyDB
    my $mydb = $c->model('MyDB');
    print ref $mydb;

    # Check if $mydb is an instance of Comserv::Model::MyDB
    if (!blessed($mydb) || !$mydb->isa('Comserv::Model::MyDB')) {
        my $error_message = "Error: \$mydb is not an instance of Comserv::Model::MyDB";

        # Store the error message in the stash and session
        $c->stash(last_error => $error_message);
        $c->session(last_error => $error_message);

        # Open the debug.log file for appending
        open my $log_fh, '>>', 'debug.log' or die "Could not open debug.log: $!";

        # Write the error message to the debug.log file
        print $log_fh $error_message . "\n";

        # Close the debug.log file
        close $log_fh;

        # Return from the method
        return;
    }

    # Call the get_schema_info method with $c as an argument
    my $schema_info = $mydb->get_schema_info($c);

    print $debug . __LINE__ . " schema_info: " . Dumper($schema_info) . "\n";  # Debug print

    # Call the get_relevant_tables method from the ToDo model
    my $relevant_tables = $c->model('ToDo')->get_relevant_tables($c, $c->model('MyDB')->dbi_info($c));

    # Store the relevant tables in the stash
    $c->stash(relevant_tables => $relevant_tables);

    # Set the template
    $c->stash(template => 'display_tables.tt');
}
sub css_form :Path('/css_form') {
    my ($self, $c) = @_;
    my $site_name = $c->stash->{SiteName};
    print $debug. __LINE__. " Site Name: $site_name\n";
     $c->stash(template => 'css_form.tt');
    $c->forward($c->view('TT'));

}
sub display_schema :Local {
    my ($self, $c) = @_;
    Comserv::debug_log($debug . __LINE__ . " Enter display_schema\n");
    # Get the criteria from the request parameters
    my $criteria = $c->request->parameters->{criteria};

    # Get the filtered schema information
    my $schema_info = $c->model('MyDB')->get_filtered_schema_info($c, $criteria);

    # Pass the schema information to the view
    $c->stash(schema_info => $schema_info);
}
sub display_filtered_schema :Local {
    Comserv::debug_log($debug . __LINE__ . " Enter display_filtered_schema\n");
    my ($self, $c) = @_;

    # Get the criteria from the request parameters
    my $criteria = $c->request->parameters->{criteria};

    # Get the filtered schema information
    Comserv::debug_log($debug . __LINE__ . " Call get_filtered_schema_info\n");
    my $schema_info = $c->model('MyDB')->get_filtered_schema_info($c, $criteria);

    # Pass the schema information to the view
    $c->stash(schema_info => $schema_info);
    Comserv::debug_log($debug . __LINE__ . " Exit display_filtered_schema $schema_info\n");

    # Get the debug log entries
    my $debug_log_entries = \@Comserv::debug_log_entries;

    # Pass the debug log entries to the view
    $c->stash(debug_log_entries => $debug_log_entries);

    # Set the template
    $c->stash(template => 'display_schema.tt');

    # Forward to the view
    $c->forward($c->view('TT'));
}
sub search_schema :Path('/search_schema') :Args(0) {
    my ($self, $c) = @_;
    Comserv::debug_log($debug . __LINE__ . " Enter search_schema\n");
    print $debug . __LINE__ . " Enter search_schema\n";
    Comserv::debug_log($debug . __LINE__ . " Call get_schema_info\n");

    # Redirect to the setup method
    $c->detach('setup');
}sub display_sorted_tables :Path('/display_sorted_tables') :Args(0) {
    my ($self, $c) = @_;

    # Get the table name from the request parameters
    my $table_name = $c->request->params->{table_name};

    # Get the sorted tables from the MyDB model
    my $sorted_tables = $c->model('MyDB')->sort_tables($c, $table_name);

    # Store the sorted tables in the stash
    $c->stash(sorted_tables => $sorted_tables);

    # Set the template
    $c->stash(template => 'setup.tt');

    # Forward to the view
    $c->forward($c->view('TT'));
}
sub generate_new_key :Path('/generate_new_key') :Args(0) {
    my ($self, $c) = @_;

    # Create an instance of the MyDB model
    my $mydb = $c->model('MyDB');

    # Generate a new encryption key
    my $new_key = $mydb->_generate_random_key();
    print $debug. __LINE__. " env Masterkey Key: $ENV{MASTER_KEY}\n";
    # Save the new key to the encrypted_dbi_data.dat file
    $mydb->_save_encrypted_dbi_info($new_key, $ENV{MASTER_KEY});

    # Redirect the user back to the original page
    $c->response->redirect($c->uri_for('/'));
}
sub default :Path {
    my ($self, $c) = @_;
    $c->response->body('Page not found');
    $c->response->status(404);
}
sub setup :Path('/setup') :Args(0) {
    my ($self, $c) = @_;

    # Retrieve the DBI information
    my $dbi_info = $c->model('MyDB')->dbi_info($c);

    # Store the DBI information in the stash
    $c->stash(dbi_info => $dbi_info);

    # Retrieve the schema information
    my $schema_info = $c->model('MyDB')->get_schema_info($c);

    # Store the schema information in the stash
    $c->stash(schema_info => $schema_info);

    # Set the template
    $c->stash(template => 'setup.tt');

    # Forward to the view
    $c->forward($c->view('TT'));
}
sub get_table_structure :Path('/get_table_structure') :Args(1) {
    my ($self, $c, $table_name) = @_;
    Comserv::debug_log($debug . __LINE__ . " Enter get_table_structure\n");

    # Get the table structure from the MyDB model
    Comserv::debug_log($debug . __LINE__ . " Call get_table_structure\n");
    my $table_structure = $c->model('MyDB')->get_table_structure($c, $table_name);
   if ($c->request->method eq 'POST') {
        sub sort_tables {
    my ($self, $c, $table_name) = @_;

    # Retrieve the result from get_related_tables
    Comserv::debug_log($debug . __LINE__ . " Enter sort_tables\n");
    my $tables = $self->get_related_tables($c, $table_name);
    Comserv::debug_log($debug . __LINE__ . " tables: $tables\n");
            # Sort the tables based on the table name
    my @sorted_tables = sort { $a->{table_name} cmp $b->{table_name} } @{$tables->{table_structure}};

    # For each table, sort the related tables based on the table name
    foreach my $table (@sorted_tables) {
        my @sorted_related_tables = sort { $a->{table_name} cmp $b->{table_name} } @{$table->{related_tables}};
        $table->{related_tables} = \@sorted_related_tables;
    }

    return \@sorted_tables;
}
my $table_name = $c->request->params->{table_name};

        # Get the sorted tables from the MyDB model
        my $new_sorted_tables = $c->model('MyDB')->sort_tables($c, $table_name);

        # Get the existing sorted tables from the stash
        my $existing_sorted_tables = $c->stash->{sorted_tables} || [];

        # Combine the new and existing sorted tables
        my @combined_sorted_tables = (@$existing_sorted_tables, @$new_sorted_tables);

        # Remove duplicate tables
        my %seen;
        my @unique_sorted_tables = grep { !$seen{$_->{table_name}}++ } @combined_sorted_tables;

        # Store the unique sorted tables in the stash
        $c->stash(sorted_tables => \@unique_sorted_tables);
    }
        open my $log_fh, '>>', 'todoschemaold.txt' or die "Could not open todoschemaold.txt: $!";
        # Create a new hash where the key is the table name and the value is the table structure
        # Change the Data::Dumper settings
        $Data::Dumper::Varname = $table_name;
        $Data::Dumper::Indent = 1;
        my %table_data = ( $table_name => $table_structure );

        # Write the table data to the schema file
        print $log_fh Dumper(\%table_data) . "\n";        # Close the debug.log file
        close $log_fh;

    # Log the content of the table_structure array
    Comserv::debug_log($debug . __LINE__ . " table_structure: " . Dumper($table_structure));

    # Convert the table structure to JSON
    Comserv::debug_log($debug . __LINE__ . " Call to_json\n");
    my $json = $c->stash->{json} = $table_structure;
    Comserv::debug_log($debug . __LINE__ . " json: $json\n");

    # Set the response content type to application/json
    $c->response->content_type('application/json');

    # Write the JSON to the response body
    $c->response->body($json);
}
__PACKAGE__->meta->make_immutable;

1;