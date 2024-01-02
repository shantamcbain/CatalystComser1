use utf8;
package Comserv::Model::Schema::ShantaForager::Result::BlockRss;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::BlockRss

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<block_rss>

=cut

__PACKAGE__->table("block_rss");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 block_rss_type

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 news_department

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 url

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 cache_timeout

  data_type: 'integer'
  default_value: 60
  is_nullable: 0

=head2 cache_updated

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 cache

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "block_rss_type",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "news_department",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "cache_timeout",
  { data_type => "integer", default_value => 60, is_nullable => 0 },
  "cache_updated",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "cache",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:EeZiOpFOM8MBO2UVcqoIsA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
