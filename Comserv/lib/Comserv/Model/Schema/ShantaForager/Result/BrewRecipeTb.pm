use utf8;
package Comserv::Model::Schema::ShantaForager::Result::BrewRecipeTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::BrewRecipeTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<brew_recipe_tb>

=cut

__PACKAGE__->table("brew_recipe_tb");

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

=head2 recipe_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 recipe_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 recipe_size

  data_type: 'float'
  is_nullable: 0

=head2 category

  data_type: 'text'
  is_nullable: 0

=head2 gravity

  data_type: 'decimal'
  is_nullable: 0
  size: [4,0]

=head2 ingredients

  data_type: 'text'
  is_nullable: 0

=head2 instructions

  data_type: 'text'
  is_nullable: 0

=head2 alcohol

  data_type: 'varchar'
  is_nullable: 0
  size: 52

=head2 colour

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 ph

  data_type: 'integer'
  is_nullable: 0

=head2 bitterness

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 maturation

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 boiltime

  data_type: 'time'
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 0

=head2 comments

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

=head2 mashtontemp

  data_type: 'float'
  is_nullable: 0

=head2 spargtemp

  data_type: 'float'
  is_nullable: 0

=head2 mashtemp

  data_type: 'float'
  is_nullable: 0

=head2 mashduration

  data_type: 'time'
  is_nullable: 0

=head2 status

  data_type: 'varchar'
  is_nullable: 0
  size: 10

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "sitename",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "recipe_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "recipe_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "recipe_size",
  { data_type => "float", is_nullable => 0 },
  "category",
  { data_type => "text", is_nullable => 0 },
  "gravity",
  { data_type => "decimal", is_nullable => 0, size => [4, 0] },
  "ingredients",
  { data_type => "text", is_nullable => 0 },
  "instructions",
  { data_type => "text", is_nullable => 0 },
  "alcohol",
  { data_type => "varchar", is_nullable => 0, size => 52 },
  "colour",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "ph",
  { data_type => "integer", is_nullable => 0 },
  "bitterness",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "maturation",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "boiltime",
  { data_type => "time", is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "comments",
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
  "mashtontemp",
  { data_type => "float", is_nullable => 0 },
  "spargtemp",
  { data_type => "float", is_nullable => 0 },
  "mashtemp",
  { data_type => "float", is_nullable => 0 },
  "mashduration",
  { data_type => "time", is_nullable => 0 },
  "status",
  { data_type => "varchar", is_nullable => 0, size => 10 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nHucdOR19V3QxJYXQ2CpzA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
