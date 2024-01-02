use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Config;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Config

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<config>

=cut

__PACKAGE__->table("config");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 sitename

  data_type: 'varchar'
  is_nullable: 1
  size: 25

=head2 domain

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 home_view_name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 auth_table

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 last_update

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 site_last_update

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 additionalauthusernamecomments

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 affiliate

  data_type: 'integer'
  is_nullable: 1

=head2 pid

  data_type: 'integer'
  is_nullable: 1

=head2 home_view

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 basic_data_view

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 app_logo

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 app_logo_alt

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 app_logo_width

  data_type: 'integer'
  is_nullable: 1

=head2 app_logo_height

  data_type: 'integer'
  is_nullable: 1

=head2 css_view_name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 page_top_view

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 page_bottom_view

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 page_left_view

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 left_page_view

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 mail_from

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 mail_to

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 mail_to_discussion

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 mail_to_admin

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 mail_to_user

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 mail_to_client

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 mail_replyto

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 site_display_name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 document_root_url

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 link_target

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 http_header_params

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 image_root_url

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 global_datafiles_directory

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 templates_cache_directory

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 app_datafiles_directory

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 datasource_type

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 cal_table

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 http_header_description

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 http_header_keywords

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "sitename",
  { data_type => "varchar", is_nullable => 1, size => 25 },
  "domain",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "home_view_name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "auth_table",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "last_update",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "site_last_update",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "additionalauthusernamecomments",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "affiliate",
  { data_type => "integer", is_nullable => 1 },
  "pid",
  { data_type => "integer", is_nullable => 1 },
  "home_view",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "basic_data_view",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "app_logo",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "app_logo_alt",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "app_logo_width",
  { data_type => "integer", is_nullable => 1 },
  "app_logo_height",
  { data_type => "integer", is_nullable => 1 },
  "css_view_name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "page_top_view",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "page_bottom_view",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "page_left_view",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "left_page_view",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "mail_from",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "mail_to",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "mail_to_discussion",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "mail_to_admin",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "mail_to_user",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "mail_to_client",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "mail_replyto",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "site_display_name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "document_root_url",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "link_target",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "http_header_params",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "image_root_url",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "global_datafiles_directory",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "templates_cache_directory",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "app_datafiles_directory",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "datasource_type",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "cal_table",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "http_header_description",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "http_header_keywords",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ttajTTVp3HJ037NG0VpaGg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
