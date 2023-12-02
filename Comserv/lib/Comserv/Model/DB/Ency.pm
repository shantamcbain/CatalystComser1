package Comserv::Model::DB::Ency;
use Moose;
extends 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'Comserv::Model::Schema::Ency',
    connect_info => {
        dsn => 'dbi:DriverName:ency;host=local',
    }
);

__PACKAGE__->meta->make_immutable;
1;