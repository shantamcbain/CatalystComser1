use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Resource;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Resource

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Resources>

=cut

__PACKAGE__->table("Resources");

=head1 ACCESSORS

=head2 resourceid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 description

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 price

  data_type: 'float'
  is_nullable: 1
  size: [10,8]

=head2 taxrate

  data_type: 'float'
  is_nullable: 1
  size: [6,4]

=cut

__PACKAGE__->add_columns(
  "resourceid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "price",
  { data_type => "float", is_nullable => 1, size => [10, 8] },
  "taxrate",
  { data_type => "float", is_nullable => 1, size => [6, 4] },
);

=head1 PRIMARY KEY

=over 4

=item * L</resourceid>

=back

=cut

__PACKAGE__->set_primary_key("resourceid");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lVZFhhUvFVZq6YFpvgVIPg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
