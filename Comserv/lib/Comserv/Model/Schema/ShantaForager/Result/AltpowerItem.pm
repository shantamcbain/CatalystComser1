use utf8;
package Comserv::Model::Schema::ShantaForager::Result::AltpowerItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::AltpowerItem

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<altpower_item>

=cut

__PACKAGE__->table("altpower_item");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 sitename

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 type

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 is_container

  data_type: 'varchar'
  is_nullable: 0
  size: 5

=head2 project_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 150

=head2 description

  data_type: 'varchar'
  is_nullable: 0
  size: 160

=head2 comments

  data_type: 'varchar'
  is_nullable: 0
  size: 250

=head2 stock

  data_type: 'text'
  is_nullable: 0

=head2 last_mod_by

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 time

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 end_date

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 start_day

  data_type: 'float'
  default_value: 0
  is_nullable: 0

=head2 last_mod_date

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 start_minute

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 owner

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 group_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 username_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "sitename",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "type",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "is_container",
  { data_type => "varchar", is_nullable => 0, size => 5 },
  "project_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 150 },
  "description",
  { data_type => "varchar", is_nullable => 0, size => 160 },
  "comments",
  { data_type => "varchar", is_nullable => 0, size => 250 },
  "stock",
  { data_type => "text", is_nullable => 0 },
  "last_mod_by",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "time",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "end_date",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "start_day",
  { data_type => "float", default_value => 0, is_nullable => 0 },
  "last_mod_date",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "start_minute",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "owner",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "group_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VBN3vP+Gdu9lWyvHPBhBnQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
