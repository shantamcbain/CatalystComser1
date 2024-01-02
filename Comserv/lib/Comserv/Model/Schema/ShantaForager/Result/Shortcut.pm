use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Shortcut;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Shortcut

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<shortcut>

=cut

__PACKAGE__->table("shortcut");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 url

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 section

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "section",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8RsJ+U5EnYyAXyd5e3H9iQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
