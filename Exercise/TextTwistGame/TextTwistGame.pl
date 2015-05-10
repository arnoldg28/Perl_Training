package TextTwistGame;

use strict;
use warnings;
use MyTime;
use ShuffledWordGenerator;
use Player;


ShuffledWordGenerator::process();
my $orig_word =  ShuffledWordGenerator::getOrigWord();
my $shuffled_word = ShuffledWordGenerator::getShuffledWord();
#For Debug Only
#print " Orig Word: $orig_word \n";

print "Shuffled Word: $shuffled_word \n";

MyTime::printTime();
my @test =  Player::play($shuffled_word);
my $key;

foreach $key (@test){
	if($key eq $orig_word){
		print "Eureka! Answer is: $key \n";
	}
}
MyTime::printTime();

