package Comserv::Model::Schema::Result::User;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table('users');

__PACKAGE__->add_columns(
    id => {
        data_type => 'integer',
        is_auto_increment => 1,
    },
    username => {
        data_type => 'varchar',
        size => 255,
    },
    password => {
        data_type => 'varchar',
        size => 255,
    },
    roles => {
        data_type => 'text',
    },
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint(['username']);

1;