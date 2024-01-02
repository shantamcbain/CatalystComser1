use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Individual;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Individual

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<individual>

=cut

__PACKAGE__->table("individual");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0

=head2 indid

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 16

=head2 famid

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 16

=head2 private

  data_type: 'char'
  is_nullable: 1
  size: 1

=head2 firstname

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 lastname

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 midname

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 display_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 gender

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 soundfn

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 8

=head2 soundln

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 8

=head2 sourid

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 16

=head2 birthstr

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 birthdate

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 deathstr

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 deathdate

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 note

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "bigint", is_auto_increment => 1, is_nullable => 0 },
  "indid",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 16 },
  "famid",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 16 },
  "private",
  { data_type => "char", is_nullable => 1, size => 1 },
  "firstname",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "lastname",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "midname",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "display_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "gender",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "soundfn",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 8 },
  "soundln",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 8 },
  "sourid",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 16 },
  "birthstr",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "birthdate",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
  "deathstr",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "deathdate",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
  "note",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rP/CLbm9b/rN002+VpkJ/Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
