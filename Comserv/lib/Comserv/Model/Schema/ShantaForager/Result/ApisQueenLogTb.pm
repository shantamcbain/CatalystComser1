use utf8;
package Comserv::Model::Schema::ShantaForager::Result::ApisQueenLogTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::ApisQueenLogTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<apis_queen_log_tb>

=cut

__PACKAGE__->table("apis_queen_log_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 queen_record_id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 owner

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 start_date

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 brood_given

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 abstract

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 80

=head2 box_1_foundation

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 box_1_bees

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 box_1_brood

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 box_1_comb

  data_type: 'integer'
  is_nullable: 0

=head2 box_1_empty

  data_type: 'integer'
  is_nullable: 0

=head2 box_1_honey

  data_type: 'integer'
  is_nullable: 0

=head2 box_2_bees

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 box_2_brood

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 box_1_broodadded

  data_type: 'integer'
  is_nullable: 0

=head2 box_2_foundation

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 box_2_honey

  data_type: 'integer'
  is_nullable: 0

=head2 box_2_broodadded

  data_type: 'integer'
  is_nullable: 0

=head2 box_2_brood_x

  data_type: 'integer'
  is_nullable: 0

=head2 box_2_comb

  data_type: 'integer'
  is_nullable: 0

=head2 box_2_empty

  data_type: 'integer'
  is_nullable: 0

=head2 box_x_bees

  data_type: 'integer'
  is_nullable: 0

=head2 box_x_brood

  data_type: 'integer'
  is_nullable: 0

=head2 brood_given_x

  data_type: 'integer'
  is_nullable: 0

=head2 box_x_broodadded

  data_type: 'integer'
  is_nullable: 0

=head2 box_x_foundation

  data_type: 'integer'
  is_nullable: 0

=head2 box_x_comb

  data_type: 'integer'
  is_nullable: 0

=head2 box_x_empty

  data_type: 'integer'
  is_nullable: 0

=head2 box_x_honey

  data_type: 'integer'
  is_nullable: 0

=head2 honey_box

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 honey_box_foundation

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 honey_box_removed

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 details

  data_type: 'text'
  is_nullable: 1

=head2 status

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 25

=head2 queen_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 pallet_code

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 honey_removed

  data_type: 'varchar'
  default_value: 0
  is_nullable: 0
  size: 50

=head2 honey_added

  data_type: 'integer'
  is_nullable: 0

=head2 end_time

  data_type: 'varchar'
  default_value: 0.00
  is_nullable: 0
  size: 10

=head2 start_time

  data_type: 'decimal'
  default_value: 0.00
  is_nullable: 0
  size: [4,2]

=head2 comments

  data_type: 'text'
  is_nullable: 0

=head2 username_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 sitename

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 last_mod_by

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 last_mod_date

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 group_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 date_time_posted

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "queen_record_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "owner",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "start_date",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "brood_given",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "abstract",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 80 },
  "box_1_foundation",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "box_1_bees",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "box_1_brood",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "box_1_comb",
  { data_type => "integer", is_nullable => 0 },
  "box_1_empty",
  { data_type => "integer", is_nullable => 0 },
  "box_1_honey",
  { data_type => "integer", is_nullable => 0 },
  "box_2_bees",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "box_2_brood",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "box_1_broodadded",
  { data_type => "integer", is_nullable => 0 },
  "box_2_foundation",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "box_2_honey",
  { data_type => "integer", is_nullable => 0 },
  "box_2_broodadded",
  { data_type => "integer", is_nullable => 0 },
  "box_2_brood_x",
  { data_type => "integer", is_nullable => 0 },
  "box_2_comb",
  { data_type => "integer", is_nullable => 0 },
  "box_2_empty",
  { data_type => "integer", is_nullable => 0 },
  "box_x_bees",
  { data_type => "integer", is_nullable => 0 },
  "box_x_brood",
  { data_type => "integer", is_nullable => 0 },
  "brood_given_x",
  { data_type => "integer", is_nullable => 0 },
  "box_x_broodadded",
  { data_type => "integer", is_nullable => 0 },
  "box_x_foundation",
  { data_type => "integer", is_nullable => 0 },
  "box_x_comb",
  { data_type => "integer", is_nullable => 0 },
  "box_x_empty",
  { data_type => "integer", is_nullable => 0 },
  "box_x_honey",
  { data_type => "integer", is_nullable => 0 },
  "honey_box",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "honey_box_foundation",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "honey_box_removed",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "details",
  { data_type => "text", is_nullable => 1 },
  "status",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 25 },
  "queen_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "pallet_code",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "honey_removed",
  { data_type => "varchar", default_value => 0, is_nullable => 0, size => 50 },
  "honey_added",
  { data_type => "integer", is_nullable => 0 },
  "end_time",
  {
    data_type => "varchar",
    default_value => "0.00",
    is_nullable => 0,
    size => 10,
  },
  "start_time",
  {
    data_type => "decimal",
    default_value => "0.00",
    is_nullable => 0,
    size => [4, 2],
  },
  "comments",
  { data_type => "text", is_nullable => 0 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "sitename",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "last_mod_by",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "last_mod_date",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "group_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "date_time_posted",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hoNfFlxuGuGdKHnPqVZ3qg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
