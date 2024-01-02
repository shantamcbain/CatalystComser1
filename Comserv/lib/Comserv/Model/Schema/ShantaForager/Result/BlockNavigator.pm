use utf8;
package Comserv::Model::Schema::ShantaForager::Result::BlockNavigator;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::BlockNavigator

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<block_navigator>

=cut

__PACKAGE__->table("block_navigator");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 navigator

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "navigator",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9h0nLgNkRY1+C9ZFPIqKLw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
