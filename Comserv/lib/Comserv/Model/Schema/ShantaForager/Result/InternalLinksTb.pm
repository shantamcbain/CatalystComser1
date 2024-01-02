use utf8;
package Comserv::Model::Schema::ShantaForager::Result::InternalLinksTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::InternalLinksTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<internal_links_tb>

=cut

__PACKAGE__->table("internal_links_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 sitename

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 owner

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 category

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 view_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 60

=head2 subject

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 share

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 link_order

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 5

=head2 keywords

  data_type: 'varchar'
  default_value: 0
  is_nullable: 0
  size: 75

=head2 target

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 10

=head2 name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 description

  data_type: 'text'
  is_nullable: 0

=head2 url

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

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

=head2 last_mod_date

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 last_mod_by

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "sitename",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "owner",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "category",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "view_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 60 },
  "subject",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "share",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "link_order",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 5 },
  "keywords",
  { data_type => "varchar", default_value => 0, is_nullable => 0, size => 75 },
  "target",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 10 },
  "name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "comments",
  { data_type => "text", is_nullable => 1 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "group_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "date_time_posted",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "last_mod_date",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "last_mod_by",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8CadYSKQACLu3OFtk41W9A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
