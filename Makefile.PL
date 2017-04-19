use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'JavaScript::Unpacker',
    AUTHOR           => q{shad},
    VERSION_FROM     => 'lib/JavaScript/Unpacker.pm',
    ABSTRACT_FROM    => 'lib/JavaScript/Unpacker.pm',
    LICENSE          => 'perl_5',
    PL_FILES         => {},
    MIN_PERL_VERSION => '5.006',
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '0',
    },
    BUILD_REQUIRES => {
        'Test::More' => '0',
    },
    PREREQ_PM => {
        'Moo' => '0',
        'Math::BigInt' => '0',
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'JavaScript::Unpacker-*' },
);
