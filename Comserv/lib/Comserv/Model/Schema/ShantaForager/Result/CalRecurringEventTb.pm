use utf8;
package Comserv::Model::Schema::ShantaForager::Result::CalRecurringEventTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::CalRecurringEventTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<cal_recurring_event_tb>

=cut

__PACKAGE__->table("cal_recurring_event_tb");

=head1 ACCESSORS

=head2 event_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 event_t_type

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 recurrence_rules

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 fname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 lname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 email

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 start_year

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 start_month

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 start_day

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 end_year

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 end_month

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 end_day

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 start_hour

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 start_minute

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 end_hour

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 end_minute

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 subject

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 75

=head2 message

  data_type: 'text'
  is_nullable: 0

=head2 attendees

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 owner

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=cut

__PACKAGE__->add_columns(
  "event_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "event_t_type",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "recurrence_rules",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "fname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "lname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "email",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "start_year",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "start_month",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "start_day",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "end_year",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "end_month",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "end_day",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "start_hour",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "start_minute",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "end_hour",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "end_minute",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "subject",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 75 },
  "message",
  { data_type => "text", is_nullable => 0 },
  "attendees",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "owner",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</event_id>

=back

=cut

__PACKAGE__->set_primary_key("event_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<email>

=over 4

=item * L</email>

=back

=cut

__PACKAGE__->add_unique_constraint("email", ["email"]);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UYGn3ojJt/sIn388VBLZRw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
