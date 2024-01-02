use utf8;
package Comserv::Model::Schema::ShantaForager::Result::TactionTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::TactionTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<taction_tb>

=cut

__PACKAGE__->table("taction_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 status

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 action_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 action_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 description

  data_type: 'text'
  is_nullable: 0

=head2 herbs

  data_type: 'text'
  is_nullable: 1

=head2 formulas

  data_type: 'text'
  is_nullable: 1

=head2 reference

  data_type: 'varchar'
  is_nullable: 1
  size: 100

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
  size: 30

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "status",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "action_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "action_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "herbs",
  { data_type => "text", is_nullable => 1 },
  "formulas",
  { data_type => "text", is_nullable => 1 },
  "reference",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "comments",
  { data_type => "text", is_nullable => 1 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
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


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HAJ6Apz8XxyaEn+LQZuMXw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
