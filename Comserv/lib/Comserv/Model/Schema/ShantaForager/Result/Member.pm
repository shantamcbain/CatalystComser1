use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Member;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Member

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<member>

=cut

__PACKAGE__->table("member");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 email

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 password

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 password_retype

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 member_status

  data_type: 'integer'
  default_value: 2
  is_nullable: 0

=head2 member_level

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 theme

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

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

=head2 avatar

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "email",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "password",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "password_retype",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "member_status",
  { data_type => "integer", default_value => 2, is_nullable => 0 },
  "member_level",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "theme",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
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
  "avatar",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<email>

=over 4

=item * L</email>

=back

=cut

__PACKAGE__->add_unique_constraint("email", ["email"]);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:REEH2oLbUxtFsq16KDwVRg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
