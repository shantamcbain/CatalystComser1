use utf8;
package Comserv::Model::Schema::ShantaForager::Result::SitePref;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::SitePref

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<site_prefs>

=cut

__PACKAGE__->table("site_prefs");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 document_view

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 site_homepage_style

  data_type: 'varchar'
  default_value: 'document'
  is_nullable: 0
  size: 10

=head2 homepage_document

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 site_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 logo

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 theme

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 member_status

  data_type: 'tinyint'
  default_value: 2
  is_nullable: 0

=head2 news_default_view

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 10

=head2 table_size

  data_type: 'integer'
  default_value: 20
  extra: {unsigned => 1}
  is_nullable: 0

=head2 blog_size

  data_type: 'integer'
  default_value: 10
  extra: {unsigned => 1}
  is_nullable: 0

=head2 private_site

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 image_width

  data_type: 'integer'
  default_value: 640
  is_nullable: 0

=head2 image_height

  data_type: 'integer'
  default_value: 480
  is_nullable: 0

=head2 show_thumbnail

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 mogrify_path

  data_type: 'varchar'
  default_value: '/usr/local/bin/mogrify'
  is_nullable: 0
  size: 255

=head2 thumb_height

  data_type: 'integer'
  default_value: 64
  is_nullable: 0

=head2 thumb_width

  data_type: 'integer'
  default_value: 64
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "document_view",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "site_homepage_style",
  {
    data_type => "varchar",
    default_value => "document",
    is_nullable => 0,
    size => 10,
  },
  "homepage_document",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "site_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "logo",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "theme",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "member_status",
  { data_type => "tinyint", default_value => 2, is_nullable => 0 },
  "news_default_view",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 10 },
  "table_size",
  {
    data_type => "integer",
    default_value => 20,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "blog_size",
  {
    data_type => "integer",
    default_value => 10,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "private_site",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "image_width",
  { data_type => "integer", default_value => 640, is_nullable => 0 },
  "image_height",
  { data_type => "integer", default_value => 480, is_nullable => 0 },
  "show_thumbnail",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "mogrify_path",
  {
    data_type => "varchar",
    default_value => "/usr/local/bin/mogrify",
    is_nullable => 0,
    size => 255,
  },
  "thumb_height",
  { data_type => "integer", default_value => 64, is_nullable => 0 },
  "thumb_width",
  { data_type => "integer", default_value => 64, is_nullable => 0 },
);

=head1 UNIQUE CONSTRAINTS

=head2 C<id>

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->add_unique_constraint("id", ["id"]);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0g5bz5z2Y95Nww37bKbU0Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
