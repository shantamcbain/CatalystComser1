use utf8;
package Comserv::Model::Schema::ShantaForager::Result::MemberNavigation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::MemberNavigation

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<member_navigation>

=cut

__PACKAGE__->table("member_navigation");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 item

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 member_navigation

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 url

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 document

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 member_level

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "item",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "member_navigation",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "document",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "member_level",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dGqp+DgaI9Mgb5sfZtKe+A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
