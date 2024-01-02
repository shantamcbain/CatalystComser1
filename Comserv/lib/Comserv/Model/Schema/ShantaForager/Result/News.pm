use utf8;
package Comserv::Model::Schema::ShantaForager::Result::News;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::News

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<News>

=cut

__PACKAGE__->table("News");

=head1 ACCESSORS

=head2 newsid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 content

  data_type: 'text'
  is_nullable: 1

=head2 posteddate

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 poster

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=cut

__PACKAGE__->add_columns(
  "newsid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "title",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "content",
  { data_type => "text", is_nullable => 1 },
  "posteddate",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "poster",
  { data_type => "varchar", is_nullable => 1, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</newsid>

=back

=cut

__PACKAGE__->set_primary_key("newsid");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TC+gAtOvusoRymFU+dUQwA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
