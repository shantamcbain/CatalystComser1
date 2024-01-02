use utf8;
package Comserv::Model::Schema::ShantaForager::Result::AltpowerCellLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::AltpowerCellLog

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<altpower_cell_log>

=cut

__PACKAGE__->table("altpower_cell_log");

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

=head2 cellcode

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 mastuntemp

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 modulecode

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

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
  "cellcode",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "mastuntemp",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "modulecode",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KSGj0sdmOOgnCYWNM9QAag


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
