use utf8;
package Comserv::Model::Schema::ShantaForager::Result::HtmlLegalTag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::HtmlLegalTag

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<html_legal_tags>

=cut

__PACKAGE__->table("html_legal_tags");

=head1 ACCESSORS

=head2 tag

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=cut

__PACKAGE__->add_columns(
  "tag",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</tag>

=back

=cut

__PACKAGE__->set_primary_key("tag");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1ksHMAZAsKohsT3UUaTQFA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
