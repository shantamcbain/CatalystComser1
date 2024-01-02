use utf8;
package Comserv::Model::Schema::ShantaForager::Result::UsersUpper;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::UsersUpper

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Users>

=cut

__PACKAGE__->table("Users");

=head1 ACCESSORS

=head2 userid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 password

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 realname

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 language

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 admin

  data_type: 'enum'
  extra: {list => ["Yes","No"]}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "userid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "password",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "realname",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "language",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "admin",
  {
    data_type => "enum",
    extra => { list => ["Yes", "No"] },
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</userid>

=back

=cut

__PACKAGE__->set_primary_key("userid");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MKEYwIlXmXdNI+pS5xaV7A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
