use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Tool;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Tool

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<tools>

=cut

__PACKAGE__->table("tools");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 abstract

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 80

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
  is_nullable: 0

=head2 status

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 25

=head2 category

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 script_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 area

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 code

  data_type: 'text'
  is_nullable: 0

=head2 version

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 webct_version

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 url

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 used_for

  data_type: 'text'
  is_nullable: 0

=head2 how_used

  data_type: 'text'
  is_nullable: 0

=head2 server_os

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 comments

  data_type: 'text'
  is_nullable: 0

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
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "abstract",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 80 },
  "priority",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "reporter",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "developer",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "details",
  { data_type => "text", is_nullable => 0 },
  "status",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 25 },
  "category",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "script_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "area",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "code",
  { data_type => "text", is_nullable => 0 },
  "version",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "webct_version",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "used_for",
  { data_type => "text", is_nullable => 0 },
  "how_used",
  { data_type => "text", is_nullable => 0 },
  "server_os",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "comments",
  { data_type => "text", is_nullable => 0 },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hNizJzn3jKAUuqdhZK+C9A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
