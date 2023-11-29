package Comserv::Model::Schema::Result::Todo;
use base 'DBIx::Class::Core';

__PACKAGE__->table('todos');
__PACKAGE__->add_columns(
    record_id => {
        data_type => 'integer',
        is_auto_increment => 1,
    },
    sitename => {
        data_type => 'varchar',
        size => 255,
    },
    start_date => {
        data_type => 'date',
    },
    parent_todo => {
        data_type => 'varchar',
    },
    due_date => {
        data_type => 'date',
    },
    subject => {
        data_type => 'varchar',
        size => 255,
    },
    description => {
        data_type => 'text',
    },
    estimated_man_hours => {
        data_type => 'integer',
    },
    accumulative_time => {
        data_type => 'integer',
    },
    project_code => {
        data_type => 'varchar',
        size => 255,
    },
    status => {
        data_type => 'varchar',
        size => 255,
    },
    priority => {
        data_type => 'integer',
    },
    share => {
        data_type => 'integer',
    },
    last_mod_by => {
        data_type => 'varchar',
        size => 255,
    },
    last_mod_date => {
        data_type => 'date',
    },
    group_of_poster => {
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

__PACKAGE__->set_primary_key('record_id');
__PACKAGE__->belongs_to(user => 'Comserv::Model::Schema::Result::User', 'user_id');
__PACKAGE__->belongs_to(project => 'Comserv::Model::Schema::Result::Project', 'project_id');

1;