package Comserv::Model::Schema;
use Moose;
use namespace::autoclean;

extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces();


__PACKAGE__->meta->make_immutable;

1;