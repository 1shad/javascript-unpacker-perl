# NAME

JavaScript::Unpacker - JavaScript unpacker for Dean Edward's p.a.c.k.e.r

# VERSION

Version 0.30

# SYNOPSIS

This module unpacks javascript packed via Dean Edward's tools.
[http://dean.edwards.name/packer/](http://dean.edwards.name/packer/)

Inspired by: 

- [https://github.com/beautify-web/js-beautify/blob/master/python/jsbeautifier/unpackers/packer.py](https://github.com/beautify-web/js-beautify/blob/master/python/jsbeautifier/unpackers/packer.py)
- Math::Base36 [http://search.cpan.org/perldoc?Math::Base36](http://search.cpan.org/perldoc?Math::Base36)

Code snipet:

    use JavaScript::Unpacker;

    my $pack = "eval(function(p,a,c,k,e,r)....";

    my $unpacker = JavaScript::Unpacker->new( packed => \$pack );

    print $unpacker->unpack ."\n";
    

# SUBROUTINES/METHODS

## $unpacker->new()

## $unpacker->new( packed => \\$js )

    Creates and loads the packed javascript assigned by reference.
    It dies if the entry is not valid.
    

## $unpacker->packed( \\$js )

    Loads it by reference.
    Dies if not valid.
    

## $unpacker->unpack()

    Returns a string, the unpacked javascript.

## $unpacker->payload()

    Returns a string, ie the symbol tab.

## $unpacker->radix()

    Returns the radix.

## $unpacker->count()

    Returns the number of words.
    

## $unpacker->keywords()

    Returns an array reference. Keywords extract by the encoder

## $unpacker->dict()

    Returns a hash reference. The dictionnary used by JavaScript::Unpacker.
    

## JavaScript::Unpacker::is\_valid( \\$js )

    Check the validity of a packed javascript.
    Returns a boolean.

# AUTHOR

    shad

# INSTALLATION

To install this module, run the following commands:

    perl Makefile.PL
    make
    make test
    make install

# BUGS

Please report any bugs or feature requests through the web interface at

# SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc JavaScript::Unpacker

# LICENSE AND COPYRIGHT

Copyright 2017 shad.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See [http://dev.perl.org/licenses/](http://dev.perl.org/licenses/) for more information.
