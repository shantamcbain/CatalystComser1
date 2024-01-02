use utf8;
package Comserv::Model::Schema::ShantaForager::Result::CspsSchedule;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::CspsSchedule

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<csps_schedule>

=cut

__PACKAGE__->table("csps_schedule");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 type

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 priority

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 location

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 last_mod_by

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 start_date

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

=head2 recur_until_date

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 recur_interval

  data_type: 'varchar'
  default_value: 0
  is_nullable: 0
  size: 10

=head2 end_minute

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 subject

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 75

=head2 description

  data_type: 'text'
  is_nullable: 0

=head2 status

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 25

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
  "type",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "priority",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "location",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "last_mod_by",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "start_date",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "end_date",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "start_day",
  { data_type => "float", default_value => 0, is_nullable => 0 },
  "last_mod_date",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "recur_until_date",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "recur_interval",
  { data_type => "varchar", default_value => 0, is_nullable => 0, size => 10 },
  "end_minute",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "subject",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 75 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "status",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 25 },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CKW7aAofE3fZeRcchsqL4Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
