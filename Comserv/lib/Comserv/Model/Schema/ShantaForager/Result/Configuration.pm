use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Configuration;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Configuration

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Configuration>

=cut

__PACKAGE__->table("Configuration");

=head1 ACCESSORS

=head2 version

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 language

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 searchbar

  data_type: 'enum'
  extra: {list => ["On","Off"]}
  is_nullable: 1

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 taxrate

  data_type: 'float'
  is_nullable: 1
  size: [6,4]

=head2 billfromaddress

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 billreplyaddress

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 billsubject

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 billheader

  data_type: 'text'
  is_nullable: 1

=head2 billfooter

  data_type: 'text'
  is_nullable: 1

=head2 ticketnotifier

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 hotticket

  data_type: 'enum'
  extra: {list => ["On","Off"]}
  is_nullable: 1

=head2 billbcc

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 currencyafter

  data_type: 'enum'
  extra: {list => ["On","Off"]}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "version",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "language",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "searchbar",
  {
    data_type => "enum",
    extra => { list => ["On", "Off"] },
    is_nullable => 1,
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "taxrate",
  { data_type => "float", is_nullable => 1, size => [6, 4] },
  "billfromaddress",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "billreplyaddress",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "billsubject",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "billheader",
  { data_type => "text", is_nullable => 1 },
  "billfooter",
  { data_type => "text", is_nullable => 1 },
  "ticketnotifier",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "hotticket",
  {
    data_type => "enum",
    extra => { list => ["On", "Off"] },
    is_nullable => 1,
  },
  "billbcc",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "currencyafter",
  {
    data_type => "enum",
    extra => { list => ["On", "Off"] },
    is_nullable => 1,
  },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/ddYJqZPiKP9cnwVAvLrxA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
