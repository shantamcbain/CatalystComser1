use strict;
use warnings;
use lib '/home/shanta/public_html/catalyst/Comserv/lib';
use Comserv;

my $app = Comserv->apply_default_middlewares(Comserv->psgi_app);
$app;

