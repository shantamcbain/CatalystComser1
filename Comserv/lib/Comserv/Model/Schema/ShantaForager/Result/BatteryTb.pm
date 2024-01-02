use utf8;
package Comserv::Model::Schema::ShantaForager::Result::BatteryTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::BatteryTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<battery_tb>

=cut

__PACKAGE__->table("battery_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 sitename

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 start_day

  data_type: 'varchar'
  default_value: 'All'
  is_nullable: 0
  size: 20

=head2 start_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 time

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'current_timestamp()'
  is_nullable: 0

=head2 batterycode

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 40

=head2 cellcode

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 volts

  data_type: 'decimal'
  default_value: 0.0000
  is_nullable: 0
  size: [10,4]

=head2 amps

  data_type: 'decimal'
  is_nullable: 0
  size: [10,4]

=head2 temp

  data_type: 'decimal'
  is_nullable: 0

=head2 location

  data_type: 'varchar'
  is_nullable: 0
  size: 60

=head2 project_code

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 share

  data_type: 'varchar'
  is_nullable: 0
  size: 10

=head2 description

  data_type: 'varchar'
  is_nullable: 0
  size: 300

=head2 comments

  data_type: 'text'
  is_nullable: 1

=head2 username_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 group_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 date_time_posted

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 last_mod_by

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 last_mod_date

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "sitename",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "start_day",
  {
    data_type => "varchar",
    default_value => "All",
    is_nullable => 0,
    size => 20,
  },
  "start_date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "time",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "current_timestamp()",
    is_nullable => 0,
  },
  "batterycode",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 40 },
  "cellcode",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "volts",
  {
    data_type => "decimal",
    default_value => "0.0000",
    is_nullable => 0,
    size => [10, 4],
  },
  "amps",
  { data_type => "decimal", is_nullable => 0, size => [10, 4] },
  "temp",
  { data_type => "decimal", is_nullable => 0 },
  "location",
  { data_type => "varchar", is_nullable => 0, size => 60 },
  "project_code",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "share",
  { data_type => "varchar", is_nullable => 0, size => 10 },
  "description",
  { data_type => "varchar", is_nullable => 0, size => 300 },
  "comments",
  { data_type => "text", is_nullable => 1 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "group_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "date_time_posted",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "last_mod_by",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "last_mod_date",
  { data_type => "varchar", is_nullable => 0, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Dm9daAOkZwkmYYb/Mu5MrQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
