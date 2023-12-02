#!/usr/bin/perl
use strict;
use warnings;
use DBIx::Class::Schema::Loader qw/ make_schema_at /;

make_schema_at(
    'Comserv::Model::Schema::ShantaForager',
    {
        debug => 1,
        dump_directory => './lib',
        moniker_map => {
            'Notes' => 'NotesUpper',
            'notes' => 'NotesLower',
            'Users' => 'UsersUpper',
            'users' => 'UsersLower',
        },
    },
    [
        'dbi:mysql:database=shanta_forager;host=localhost',
        'shanta_forager',
        'UA=nPF8*m+T#',
    ],
);