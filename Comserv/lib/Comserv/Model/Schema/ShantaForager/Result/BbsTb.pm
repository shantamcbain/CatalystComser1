use utf8;
package Comserv::Model::Schema::ShantaForager::Result::BbsTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::BbsTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<bbs_tb>

=cut

__PACKAGE__->table("bbs_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 sitename

  data_type: 'varchar'
  default_value: 'All'
  is_nullable: 0
  size: 20

=head2 forum

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 40

=head2 parent_id

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 thread_id

  data_type: 'varchar'
  default_value: 0
  is_nullable: 0
  size: 40

=head2 magic

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 200

=head2 email

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 80

=head2 name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 80

=head2 subject

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 200

=head2 body

  data_type: 'text'
  is_nullable: 0

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

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "sitename",
  {
    data_type => "varchar",
    default_value => "All",
    is_nullable => 0,
    size => 20,
  },
  "forum",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 40 },
  "parent_id",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "thread_id",
  { data_type => "varchar", default_value => 0, is_nullable => 0, size => 40 },
  "magic",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 200 },
  "email",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 80 },
  "name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 80 },
  "subject",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 200 },
  "body",
  { data_type => "text", is_nullable => 0 },
  "comments",
  { data_type => "text", is_nullable => 1 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "group_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "date_time_posted",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/p/m0NdIeK9FDuGg60YaJw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
