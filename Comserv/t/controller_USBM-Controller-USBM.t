use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Comserv';
use Comserv::Controller::USBM::Controller::USBM;

ok( request('/usbm/controller/usbm')->is_success, 'Request should succeed' );
done_testing();
