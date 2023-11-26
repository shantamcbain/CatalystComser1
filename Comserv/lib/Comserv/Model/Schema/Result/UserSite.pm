package Comserv::Model::Schema::Result::UserSite;
use base 'DBIx::Class::Core';

__PACKAGE__->table('user_sites');
__PACKAGE__->add_columns(
    user_id => {
        data_type => 'integer',
    },
    site_id => {
        data_type => 'integer',
    },
);
__PACKAGE__->set_primary_key('user_id', 'site_id');
__PACKAGE__->belongs_to(user => 'Comserv::Model::Schema::Result::User', 'user_id');
__PACKAGE__->belongs_to(site => 'Comserv::Model::Schema::Result::Site', 'site_id');

1;