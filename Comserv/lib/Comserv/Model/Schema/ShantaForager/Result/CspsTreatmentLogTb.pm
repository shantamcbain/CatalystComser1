use utf8;
package Comserv::Model::Schema::ShantaForager::Result::CspsTreatmentLogTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::CspsTreatmentLogTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<csps_treatment_log_tb>

=cut

__PACKAGE__->table("csps_treatment_log_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 age

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

=head2 due_date

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 signs

  data_type: 'text'
  is_nullable: 0

=head2 priority

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 reporter

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 developer

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 details

  data_type: 'text'
  is_nullable: 1

=head2 status

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 25

=head2 name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 start_time

  data_type: 'time'
  default_value: '00:00:00'
  is_nullable: 0

=head2 end_time

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 10

=head2 time

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
  "age",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "owner",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "start_date",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "due_date",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "signs",
  { data_type => "text", is_nullable => 0 },
  "priority",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "reporter",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "developer",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "details",
  { data_type => "text", is_nullable => 1 },
  "status",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 25 },
  "name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "start_time",
  { data_type => "time", default_value => "00:00:00", is_nullable => 0 },
  "end_time",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 10 },
  "time",
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vr1N53/DFGtRYYn1s/pcwg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
