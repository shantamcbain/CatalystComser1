use utf8;
package Comserv::Model::Schema::ShantaForager::Result::MwUserAuthTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::MwUserAuthTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<mw_user_auth_tb>

=cut

__PACKAGE__->table("mw_user_auth_tb");

=head1 ACCESSORS

=head2 username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 password

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 60

=head2 groups

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 firstname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 lastname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 email

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 company

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 remedy_id

  data_type: 'varchar'
  is_nullable: 1
  size: 15

=head2 developer_status

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "password",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 60 },
  "groups",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "firstname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "lastname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "email",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "company",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "remedy_id",
  { data_type => "varchar", is_nullable => 1, size => 15 },
  "developer_status",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</username>

=back

=cut

__PACKAGE__->set_primary_key("username");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/KvK9TkHUsxiNbNjNtJGTw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
