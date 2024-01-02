use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Session;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Session

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<session>

=cut

__PACKAGE__->table("session");

=head1 ACCESSORS

=head2 sesskey

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 32

=head2 expiry

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 userid

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 remote_addr

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 value

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "sesskey",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 32 },
  "expiry",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "userid",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "remote_addr",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "value",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</sesskey>

=back

=cut

__PACKAGE__->set_primary_key("sesskey");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:b4+hx1YUO17UBwnEYts7Ow


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
