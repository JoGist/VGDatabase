use 5.010_001; # Require Perl5 version 10.1 or newer
use strict;
use warnings;

package test;

sub now {
    say scalar localtime;  # now
}
