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



sub add_new_record {
    my ($self, $new_record) = @_;
    my $json_data = read_file($json_file) || '[]';
    my $tasks = decode_json($json_data);
    push @{$tasks}, $new_record;
    my $updated_json_data = encode_json($tasks);
    write_file($json_file, $updated_json_data);
}


sub generate_record_id {
    my $uuid = Data::UUID->new;
    my $record_id = $uuid->create_str();
    return $record_id;
}

__PACKAGE__->meta->make_immutable;
1;