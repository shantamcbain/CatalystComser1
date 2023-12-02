package Comserv::Controller::AJAX;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller::REST'; }
my $debug = "Comserv::Controller::Ajax Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";

sub get_databases :Path('/get_databases') :Args(1) :ActionClass('REST') { }

sub get_databases_GET {
    my ($self, $c, $schema) = @_;
    print $debug . __LINE__ . " In get_databases_GET\n";
    # Call the get_databases method from Comserv::Model::DB
    my $databases = $c->model('DB')->get_databases($schema);
    print $debug . __LINE__ . " In get_databases_GET, databases: " . $databases . "\n";
    # If get_databases returned an error, return the error message
    if (ref $databases eq 'HASH' && exists $databases->{error}) {
        $self->status_bad_request($c, message => $databases->{error});
        return;
    }

    $self->status_ok($c, entity => $databases);
}

sub get_tables :Path('/get_tables') :Args(2) :ActionClass('REST') { }

sub get_tables_GET {
    my ($self, $c, $schema, $database) = @_;

    # Call the get_tables method from Comserv::Model::DB
    my $tables = $c->model('DB')->get_tables($schema, $database);

    # If get_tables returned an error, return the error message
    if (ref $tables eq 'HASH' && exists $tables->{error}) {
        $self->status_bad_request($c, message => $tables->{error});
        return;
    }

    $self->status_ok($c, entity => $tables);
}

sub get_table_structure :Path('/get_table_structure') :Args(3) :ActionClass('REST') { }

sub get_table_structure_GET {
    my ($self, $c, $schema, $database, $table) = @_;

    # Call the get_table_structure method from Comserv::Model::DB
    my $table_structure = $c->model('DB')->get_table_structure($schema, $database, $table);

    $self->status_ok($c, entity => $table_structure);
}

__PACKAGE__->meta->make_immutable;

1;