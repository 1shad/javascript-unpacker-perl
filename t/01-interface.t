#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;
use Test::Fatal qw(dies_ok lives_ok);

plan tests => 12;
#plan 'no_plan';

use_ok( 'JavaScript::Unpacker' ) || print "Bail out!\n";

my $unpacker = JavaScript::Unpacker->new;
can_ok($unpacker, qw(payload radix count keywords dict packed is_valid));

# loading packed tests
my $js = from_file("t/data/10-malformed.js");
dies_ok { $unpacker->packed(\$js) } 'loading malformed packed js' ;

$js = from_file("t/data/10.js");
ok(JavaScript::Unpacker::is_valid(\$js), 'check valid packed js' );
ok(!JavaScript::Unpacker::is_valid(\'var a=null'), 'check wrong packed js');
lives_ok { $unpacker->packed(\$js) } 'loading valid packed js' ;
dies_ok  { $unpacker->packed(\"var a=null") } 'loading wrong packed js' ;

# validity test
is($unpacker->payload, '(0(){4 1="5 6 7 8";0 2(3){9(3)}2(1)})();', 'payload test');
ok($unpacker->radix == 10, 'radix test');
ok($unpacker->count == 10, 'count test');
my $keywords_list = 'functionbsomethingavarsomesamplepackedcodealert';
is( join('', @{$unpacker->keywords}), $keywords_list, 'keywords test');

# result test
$js = from_file("t/data/10-expected.js");
is( $unpacker->unpack, $js, 'expected test' );

sub from_file {
    my $filename = shift;
    my $js;

    open(my $fh, "<", $filename) 
        or die "Could not open file '$filename'. $!";
    $js = <$fh>;
    close $fh;
    chomp($js);
    return $js;
}

