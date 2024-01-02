use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Concordance;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Concordance

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<concordance>

=cut

__PACKAGE__->table("concordance");

=head1 ACCESSORS

=head2 word

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 tally

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 concordance_item

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "word",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "tally",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "concordance_item",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ACHfma5skLkyFPEyD4KCSw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
