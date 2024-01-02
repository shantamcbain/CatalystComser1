use utf8;
package Comserv::Model::Schema::ShantaForager::Result::ConcordanceNoise;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::ConcordanceNoise

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<concordance_noise>

=cut

__PACKAGE__->table("concordance_noise");

=head1 ACCESSORS

=head2 word

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=cut

__PACKAGE__->add_columns(
  "word",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</word>

=back

=cut

__PACKAGE__->set_primary_key("word");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0obwFk8YFjL5V+EksEaOwg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
