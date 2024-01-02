use utf8;
package Comserv::Model::Schema::ShantaForager::Result::PageTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::PageTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<page_tb>

=cut

__PACKAGE__->table("page_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 sitename

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 lastupdate

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 facebook

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 linkedin

  data_type: 'varchar'
  is_nullable: 0
  size: 150

=head2 mailchimp

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 view_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 80

=head2 link_order

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 news

  data_type: 'varchar'
  is_nullable: 0
  size: 5

=head2 developer

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 status

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 25

=head2 pageheader

  data_type: 'varchar'
  is_nullable: 0
  size: 250

=head2 page_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 body

  data_type: 'text'
  is_nullable: 0

=head2 app_title

  data_type: 'text'
  is_nullable: 0

=head2 keywords

  data_type: 'varchar'
  is_nullable: 0
  size: 80

=head2 page_site

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 menu

  data_type: 'varchar'
  is_nullable: 0
  size: 30

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

=head2 share

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 10

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
  "sitename",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "lastupdate",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "facebook",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "linkedin",
  { data_type => "varchar", is_nullable => 0, size => 150 },
  "mailchimp",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "view_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 80 },
  "link_order",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "news",
  { data_type => "varchar", is_nullable => 0, size => 5 },
  "developer",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "status",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 25 },
  "pageheader",
  { data_type => "varchar", is_nullable => 0, size => 250 },
  "page_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "body",
  { data_type => "text", is_nullable => 0 },
  "app_title",
  { data_type => "text", is_nullable => 0 },
  "keywords",
  { data_type => "varchar", is_nullable => 0, size => 80 },
  "page_site",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "menu",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "comments",
  { data_type => "text", is_nullable => 0 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "company_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "share",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 10 },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:66nH42lGOqu9a9bRtgUBxg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
