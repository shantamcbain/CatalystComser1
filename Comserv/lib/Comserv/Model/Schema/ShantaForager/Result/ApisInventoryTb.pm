use utf8;
package Comserv::Model::Schema::ShantaForager::Result::ApisInventoryTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::ApisInventoryTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<apis_inventory_tb>

=cut

__PACKAGE__->table("apis_inventory_tb");

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

=head2 item_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 item_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 80

=head2 discription

  data_type: 'text'
  is_nullable: 0

=head2 project_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 number

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 price

  data_type: 'decimal'
  default_value: 0.00
  is_nullable: 0
  size: [5,2]

=head2 start_day

  data_type: 'date'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00'
  is_nullable: 0

=head2 location

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 client_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

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

=head2 honey_removed

  data_type: 'varchar'
  default_value: 0
  is_nullable: 0
  size: 50

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

=head2 company_code

  data_type: 'varchar'
  default_value: (empty string)
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
  "sitename",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "owner",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "start_date",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "item_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "item_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 80 },
  "discription",
  { data_type => "text", is_nullable => 0 },
  "project_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "number",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "price",
  {
    data_type => "decimal",
    default_value => "0.00",
    is_nullable => 0,
    size => [5, 2],
  },
  "start_day",
  {
    data_type => "date",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00",
    is_nullable => 0,
  },
  "location",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "client_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
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
  "honey_removed",
  { data_type => "varchar", default_value => 0, is_nullable => 0, size => 50 },
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
  "company_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fc/ZV7BZlN4xIGjM2m7toQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
