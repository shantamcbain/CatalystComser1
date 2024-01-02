use utf8;
package Comserv::Model::Schema::ShantaForager::Result::DocumentView;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::DocumentView

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<document_view>

=cut

__PACKAGE__->table("document_view");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 button

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BOvdPup9p5eNTUOnUzukLw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
