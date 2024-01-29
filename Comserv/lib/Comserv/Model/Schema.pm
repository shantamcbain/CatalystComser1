package Comserv::Model::Schema;
use Moose;
use namespace::autoclean;

extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces(
    result_namespace => ['Schema::ShantaForager::Result', 'Schema::Ency::Result'],
);

__PACKAGE__->meta->make_immutable;

1;