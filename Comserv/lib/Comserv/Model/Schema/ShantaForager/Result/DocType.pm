use utf8;
package Comserv::Model::Schema::ShantaForager::Result::DocType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::DocType - For each document subclass, information on where the entrypo

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<doc_type>

=cut

__PACKAGE__->table("doc_type");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 subtable

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 description

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 member_level

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 template

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "subtable",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "description",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "member_level",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "template",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/XWzFuMK4j/321B2tsBL0Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
