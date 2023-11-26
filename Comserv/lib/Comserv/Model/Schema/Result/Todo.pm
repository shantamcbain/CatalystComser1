package Comserv::Model::Schema::Result::Todo;
use base 'DBIx::Class::Core';

__PACKAGE__->table('todos');
__PACKAGE__->add_columns(
    id => {
        data_type => 'integer',
        is_auto_increment => 1,
    },
    title => {
        data_type => 'varchar',
        size => 255,
    },
    description => {
        data_type => 'text',
    },
    due_date => {
        data_type => 'date',
    },
    priority => {
        data_type => 'integer',
    },
    status => {
        data_type => 'varchar',
        size => 255,
    },
    user_id => {
        data_type => 'integer',
    },
    project_id => {
        data_type => 'integer',
    },
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->belongs_to(user => 'Comserv::Model::Schema::Result::User', 'user_id');
__PACKAGE__->belongs_to(project => 'Comserv::Model::Schema::Result::Project', 'project_id');

1;