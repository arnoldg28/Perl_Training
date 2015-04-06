package Player;
use strict;
use warnings;

sub play{
	my $dict = './wordsEn.txt';
	my $scrambled_word   = $_[0];
	my $scrambled_length = length $scrambled_word;
	my $scrambled_sorted = join '', sort split '', $scrambled_word;
	my @answers;
	my $ctr = 0;
	
	my $pattern = qr{
							\A
								(?:
									[$scrambled_word]{$scrambled_length}
								)
								\n
							\z
							}x;

	open DICT, '<', $dict or die "Cannot open '$dict': $!";

	while (<DICT>) {
		next unless /$pattern/o;
		chomp;
		my $sorted = join '', sort split '', $_;
		next unless $sorted eq $scrambled_sorted;
		$answers[$ctr] = $_;
		$ctr++;
	}
	close DICT or warn;
	return @answers;
}1;