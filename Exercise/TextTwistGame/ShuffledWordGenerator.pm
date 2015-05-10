package ShuffledWordGenerator;

use strict;
use warnings;

my $orig_word = "";
my $shuffled_word = "";

sub getOrigWord{
	return $orig_word;
}1;

sub getShuffledWord{
	return $shuffled_word;
}1;

sub process{
	# Opening a file of list of words. The shuffled word will come from one of the word inside this file.
	my $filename = './wordsEn.txt';
	open(my $fh, '<:encoding(UTF-8)', $filename)
	or die "Could not open file '$filename' $!";

	# Words container and a counter that will be used to randomly get a word
	my @wordList;
	my $ctr = 0;

	# Put word in the container and count the words
	while (my $row = <$fh>) {
		chomp $row;
		#print "$row\n";
		$wordList[$ctr] = $row;
		$ctr++;
	}

	# Get a random index to be used to get a word in the container (wordList)
	my $wordIndex =  int(rand($ctr));

	# The chosen word
	my $word_orig = $wordList[$wordIndex];

	#print "Chosen word: $word_orig \n";

	# Shuffle the word. I use do while since the jumble_word sub output might be the same as the orig word.
	my $shuf_word = "";
	do{
		$shuf_word = jumble_word($word_orig);
	}while($shuf_word eq $word_orig);

	$orig_word = $word_orig;
	$shuffled_word = $shuf_word;
}1;

# sub to jumble the words
sub jumble_word{

	my $word = $_[0];
	my $str_len = length($word);

	my @string = split(//,$word);
	my @shuffled;
	my @flags;

	my $i=0;
	my $j=0;

	for($i=0;$i<($str_len);$i++){
		$flags[$i] = 0;    # Initializing flags
	}

	for($i=0;$i<($str_len);$i++) {
		my $rand=int(rand($str_len-1));
		if($flags[$rand] != 1 ) {
			$flags[$rand] = 1;
			$shuffled[$j++] = $string[$rand];
		}  
	}

	for(my $i=0;$i<($str_len);$i++) {
		if($flags[$i] != 1) {
			$flags[$i] = 1;
			$shuffled[$j++] = $string[$i];
		}
	}

	my $shuf = join("",@shuffled);

	return $shuf;

}1;