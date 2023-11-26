package Comserv::Model::Schema::Result::Site;
use base 'DBIx::Class::Core';

__PACKAGE__->table('sites');
__PACKAGE__->add_columns(
    id => {
        data_type => 'integer',
        is_auto_increment => 1,
    },
    name => {
        data_type => 'varchar',
        size => 255,
    },
);
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many(user_sites => 'Comserv::Model::Schema::Result::UserSite', 'site_id');
__PACKAGE__->many_to_many(users => 'user_sites', 'user');

1;