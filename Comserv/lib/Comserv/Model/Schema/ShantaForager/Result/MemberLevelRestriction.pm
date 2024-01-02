use utf8;
package Comserv::Model::Schema::ShantaForager::Result::MemberLevelRestriction;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::MemberLevelRestriction

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<member_level_restriction>

=cut

__PACKAGE__->table("member_level_restriction");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 button

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "button",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AfrbkZy3g801sTpGvmDNEQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
