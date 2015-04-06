 use strict;
    use warnings;

    # Opening the file containing the list of words
    my $filename = "WordList.txt";
    open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";
 
    # Words container and a counter that will be used to randomly get a word
    my @wordList;
    my $ctr = 0;
   
    # Put word in the continer and count the words
    while (my $row = <$fh>) {
        chomp $row;
        print "$row\n";
        $wordList[$ctr] = $row;
        $ctr++;
    }

    # Get a random index to be used to get a word in the container (wordList)
    my $wordIndex =  int(rand($ctr));
   
    # The word to be solved
    my $word_orig = $wordList[$wordIndex];
   
    print "Choosen word: $word_orig \n";
    my $shuf_word = "";
    do{
    $shuf_word = jumble_word($word_orig);
    }while($shuf_word eq $word_orig);
   
    print "Shuffled: $shuf_word \n";

sub jumble_word{
        my $word = $_[0];
       
        my $str_len = length($word);
       
        my @string = split(//,$word);
        my @shuffled;
        my @flags;
    # This for loop shuffles the characters of the string.
    #The shuffling is done by picking characters by random index
    # numbers. The flags array is used to keep track of characters
    # shuffled.
   
        my $i=0;
        my $j=0;
   
        for($i=0;$i<($str_len);$i++){
            $flags[$i] = 0;    # Intializing flags
        }
   
        for($i=0;$i<($str_len);$i++) {
            my $rand=int(rand($str_len-1));
            if($flags[$rand] != 1 ) {
                $flags[$rand] = 1;
                $shuffled[$j++] = $string[$rand];
            }  
        }
    #In case some characters were missed out in the above loop,
    # This loop will fill them up. The flags is checked to find out
    # which characters were left out.
        for(my $i=0;$i<($str_len);$i++) {
            if($flags[$i] != 1) {
                $flags[$i] = 1;
                $shuffled[$j++] = $string[$i];
            }
        }
       
    my $shuf = join("",@shuffled);
   
    return $shuf;
   
}

########################################################

my $dict = './wordsEn.txt';

my $scrambled_word   = $shuf_word;
my $scrambled_length = length $scrambled_word;
my $scrambled_sorted = join '', sort split '', $scrambled_word;

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
	print "$_\n";
}
close DICT or warn;