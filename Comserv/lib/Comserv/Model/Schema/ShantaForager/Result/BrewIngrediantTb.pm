use utf8;
package Comserv::Model::Schema::ShantaForager::Result::BrewIngrediantTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::BrewIngrediantTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<brew_ingrediant_tb>

=cut

__PACKAGE__->table("brew_ingrediant_tb");

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

=head2 item_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 ingrediant_name

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 recipe_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 description

  data_type: 'text'
  is_nullable: 0

=head2 stock

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 weight

  data_type: 'decimal'
  is_nullable: 0
  size: [10,2]

=head2 bill

  data_type: 'varchar'
  is_nullable: 0
  size: 10

=head2 comments

  data_type: 'text'
  is_nullable: 0

=head2 unit

  data_type: 'varchar'
  is_nullable: 0
  size: 5

=head2 last_mod_by

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
  "item_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "ingrediant_name",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "recipe_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "stock",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "weight",
  { data_type => "decimal", is_nullable => 0, size => [10, 2] },
  "bill",
  { data_type => "varchar", is_nullable => 0, size => 10 },
  "comments",
  { data_type => "text", is_nullable => 0 },
  "unit",
  { data_type => "varchar", is_nullable => 0, size => 5 },
  "last_mod_by",
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xUPOQFHztdAeUEXKx5BmwQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
