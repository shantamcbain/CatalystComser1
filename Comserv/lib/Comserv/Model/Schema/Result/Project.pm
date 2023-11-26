package Comserv::Model::Schema::Result::Project;
use base 'DBIx::Class::Core';

__PACKAGE__->table('projects');
__PACKAGE__->add_columns(
    id => {
        data_type => 'int',
        is_auto_increment => 1,
    },
    name => {
        data_type => 'varchar',
        size => 255,
    },
    description => {
        data_type => 'text',
    },
    start_date => {
        data_type => 'date',
    },
    end_date => {
        data_type => 'date',
    },
    status => {
        data_type => 'varchar',
        size => 255,
    }
);
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many(todos => 'Comserv::Model::Schema::Result::Todo', 'project_id');

1;