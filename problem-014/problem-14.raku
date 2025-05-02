# I tried caching the lengths for the whole sequence but it just slowed it down :/

my %lengths = 1 => 1;
for 2 ..^ 1_000_000 {
	my $n = $_;
	my $l = 1;
	while $n != 1 {
		$n = $n %% 2
			?? $n / 2
			!! 3*$n + 1;
		if %lengths{$n}:exists {
			$l += %lengths{$n};
			last;
		}
		$l++;
	}
	%lengths{$_} = $l;
}
say %lengths.antipairs.max.value;
