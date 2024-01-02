use utf8;
package Comserv::Model::Schema::ShantaForager::Result::ErrorMessage;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::ErrorMessage

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<error_message>

=cut

__PACKAGE__->table("error_message");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 tag

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 message

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "tag",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "message",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:a/CL2BBDLxwSw2N4u0rTPQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
