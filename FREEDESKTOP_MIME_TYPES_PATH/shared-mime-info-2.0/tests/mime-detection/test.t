use Test::More tests => 4;

my $true_value = !0;
ok( $true_value, "Boolean negation of 0 is true" );

SKIP: {
    skip("Confused implementor", 1);
    is( $true_value, "0 but true", "'0 but true' is true");
}

TODO: {
    local $TODO = "Need fuzzy magic";
    is( $true_value, 0.999999999999999, "True-ish in the fuzzy sense");
}

is( $true_value, 1, "Boolean negation of 0 is 1" );
