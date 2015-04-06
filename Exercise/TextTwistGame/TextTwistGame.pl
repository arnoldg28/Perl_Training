package TextTwistGame;

use strict;
use warnings;
use ShuffledWordGenerator;
use Player;

my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();

ShuffledWordGenerator::process();
my $orig_word =  ShuffledWordGenerator::getOrigWord();
my $shuffled_word = ShuffledWordGenerator::getShuffledWord();
#For Debug Only
#print " Orig Word: $orig_word \n";

print "Shuffled Word: $shuffled_word \n";

printf("Start Time: %02d:%02d:%02d \n", $hour, $min, $sec);
my @test =  Player::play($shuffled_word);
my $key;

foreach $key (@test){
	if($key eq $orig_word){
		print "Eureka! Answer is: $key \n";
	}
}

printf("End Time: %02d:%02d:%02d \n", $hour, $min, $sec);