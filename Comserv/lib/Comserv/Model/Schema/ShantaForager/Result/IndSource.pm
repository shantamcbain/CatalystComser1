use utf8;
package Comserv::Model::Schema::ShantaForager::Result::IndSource;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::IndSource

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ind_source>

=cut

__PACKAGE__->table("ind_source");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0

=head2 indid

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 12

=head2 sour

  data_type: 'blob'
  is_nullable: 0

=head2 birtsour

  data_type: 'blob'
  is_nullable: 1

=head2 deatsour

  data_type: 'blob'
  is_nullable: 1

=head2 burisour

  data_type: 'blob'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "bigint", is_auto_increment => 1, is_nullable => 0 },
  "indid",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 12 },
  "sour",
  { data_type => "blob", is_nullable => 0 },
  "birtsour",
  { data_type => "blob", is_nullable => 1 },
  "deatsour",
  { data_type => "blob", is_nullable => 1 },
  "burisour",
  { data_type => "blob", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mY0osOKCOdMcWA3PS2AfMg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
