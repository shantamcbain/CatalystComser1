package Comserv::Model::ToDo;
use Moose;
use namespace::autoclean;
use JSON::MaybeXS;
use File::Slurp qw(read_file write_file);
use Data::UUID;

extends 'Catalyst::Model';
my $json_file = 'root/Data/todo.json';  # Update the file path accordingly

sub get_sorted_tasks {
    my $self = shift;
    my $json_data = read_file($json_file) || '[]';
    my $tasks = decode_json($json_data);
    my @sorted_tasks = sort { $a->{due_date} cmp $b->{due_date} } @{$tasks};  # Sort tasks by due date
    return \@sorted_tasks;
}

sub get_task_details {
    my ($self, $record_id) = @_;
    my $json_data = read_file($json_file) || '[]';
    my $tasks = decode_json($json_data);
    my ($task) = grep { $_->{record_id} eq $record_id } @{$tasks};
    return $task;
}

sub save_task_details {
    my ($self, $task) = @_;
    my $json_data = read_file($json_file) || '[]';
    my $tasks = decode_json($json_data);
    my ($index) = grep { $tasks->[$_]{'record_id'} eq $task->{'record_id'} } (0..$#{$tasks});
    $tasks->[$index] = $task;
    my $updated_json_data = encode_json($tasks);
    write_file($json_file, $updated_json_data);
}
sub get_relevant_tables {
    my ($self, $c) = @_;
    # Call the get_schema_info method from the MyDB model
    my $schema_info = $c->model('MyDB')->dbi_info->get_schema_info($c);

    # Define the table names for the ToDo system
    my @todo_table_names = ('todos', 'projects', 'logins');

    # Filter the schema information to find the relevant tables
    my @relevant_tables = grep { my $table_name = $_->{TABLE_NAME}; grep { $_ eq $table_name } @todo_table_names } @{$schema_info};

    return \@relevant_tables;
}
sub generate_record_id {
    my $uuid = Data::UUID->new;
    my $record_id = $uuid->create_str();
    return $record_id;
}

__PACKAGE__->meta->make_immutable;
1;