package Comserv::Controller::Root;
use Moose;
use namespace::autoclean;
use Data::Dumper;

BEGIN { extends 'Catalyst::Controller' }

sub stash_dump {
    my ($self, $c) = @_;
#    print Dumper($c->stash);
}

# Rest of your code...
my $debug = "Comserv::Controller::Root Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";

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
sub display_tables :Path('display_tables') :Args(0) {
    my ($self, $c) = @_;

    # Get an instance of Comserv::Model::MyDB
    my $mydb = $c->model('MyDB');

    # Check if $mydb is an instance of Comserv::Model::MyDB
    if (!blessed($mydb) || !$mydb->isa('Comserv::Model::MyDB')) {
        die "Error: \$mydb is not an instance of Comserv::Model::MyDB";
    }

    # Call the get_schema_info method with $c as an argument
    my $schema_info = $mydb->get_schema_info($c);

    # Call the get_relevant_tables method from the ToDo model
    my $relevant_tables = $c->model('ToDo')->get_relevant_tables($c, $c->model('MyDB')->dbi_info($c));

    # Store the relevant tables in the stash
    $c->stash(relevant_tables => $relevant_tables);

    # Set the template
    $c->stash(template => 'display_tables.tt');
}
sub display_schema_info {
    my ($self, $c) = @_;

    # Get the schema info
    my $schema_info = $self->get_schema_info($c);

    # Format and print the schema info
    foreach my $table (@$schema_info) {
        print "Table: $table->{TABLE_NAME}\n";
        print "Engine: $table->{ENGINE}\n";
        print "Version: $table->{VERSION}\n";
        print "Row format: $table->{ROW_FORMAT}\n";
        print "Rows: $table->{TABLE_ROWS}\n";
        print "Avg row length: $table->{AVG_ROW_LENGTH}\n";
        print "Data length: $table->{DATA_LENGTH}\n";
        print "Max data length: $table->{MAX_DATA_LENGTH}\n";
        print "Index length: $table->{INDEX_LENGTH}\n";
        print "Data free: $table->{DATA_FREE}\n";
        print "Auto increment: $table->{AUTO_INCREMENT}\n";
        print "Create time: $table->{CREATE_TIME}\n";
        print "Update time: $table->{UPDATE_TIME}\n";
        print "Check time: $table->{CHECK_TIME}\n";
        print "Table collation: $table->{TABLE_COLLATION}\n";
        print "Checksum: $table->{CHECKSUM}\n";
        print "Create options: $table->{CREATE_OPTIONS}\n";
        print "Table comment: $table->{TABLE_COMMENT}\n";
        print "\n";
    }
}
sub css_form :Path('/css_form') {
    my ($self, $c) = @_;
    my $site_name = $c->stash->{SiteName};
    print $debug. __LINE__. " Site Name: $site_name\n";
     $c->stash(template => 'css_form.tt');
    $c->forward($c->view('TT'));

}
sub setup :Path('/setup') {
    my ($self, $c) = @_;
       # Get the DBI information
    my $dbi_info = $c->model('MyDB')->dbi_info($c);

    my $site_name = $c->stash->{SiteName};
    print $debug. __LINE__. " Site Name: $site_name\n";

    # Add the DBI information to the stash
    $c->stash(
        dbi_info => $dbi_info,
    );
    $c->stash(template => 'setup.tt');
    $c->forward($c->view('TT'));

}
sub debug :Path('/debug') :Args(0) {
    print $debug. __LINE__. " Enter debug\n";
    my ($self, $c) = @_;

    # Get the DBI information
    my $dbi_info = $c->model('MyDB')->_read_dbi_info_from_file();
    print $debug. __LINE__. " dbi_info: $dbi_info\n";

    # Print the DBI information using Data::Dumper
    print Data::Dumper::Dumper($dbi_info);

    # Store the DBI information in the stash
    print $debug. __LINE__. " Put dbi_info in stash\n";
    $c->stash->{dbi_info} = $dbi_info;
    $c->session->{$dbi_info} = $dbi_info;

    # Get the state of the DBI connection
    my $db_connection_successful = $c->stash->{db_connection_successful};

    # Print the state of the DBI connection
    if ($db_connection_successful) {
        print "DB connection successful.\n";
    } else {
        print "DB connection failed.\n";
    }

    # Set the template
    $c->stash(template => 'debug.tt');

    # Forward to the view to render the template
    $c->forward($c->view('TT'));
}sub generate_new_key :Path('/generate_new_key') :Args(0) {
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



__PACKAGE__->meta->make_immutable;

1;