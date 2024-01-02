use utf8;
package Comserv::Model::Schema::ShantaForager::Result::UsersLower;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::UsersLower

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 idx

  data_type: 'mediumint'
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 8

=head2 password

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 12

=cut

__PACKAGE__->add_columns(
  "idx",
  { data_type => "mediumint", is_auto_increment => 1, is_nullable => 0 },
  "username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 8 },
  "password",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 12 },
);

=head1 PRIMARY KEY

=over 4

=item * L</idx>

=back

=cut

__PACKAGE__->set_primary_key("idx");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zb1tlxaDsPUrvxBooOEq7w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
