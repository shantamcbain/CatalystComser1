package Comserv::Model::DB::ShantaForager;
use Moose;
extends 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'Comserv::Model::Schema::ShantaForager',
   connect_info => {
        dsn => 'dbi:DriverName:shanta_forager;host=local;port=port',
    }
);

__PACKAGE__->meta->make_immutable;
1;