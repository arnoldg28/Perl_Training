%hash = ("k1"=>"v1","k2"=>"v3","k3"=>"v3");

$numberOfKeys = keys %hash;
@listOfKeys = keys %hash;

print "Number of keys: " . $numberOfKeys;
print "\n";
print "List of Keys: " . "@listOfKeys";

print "\n\n";

print "using for loop:\n";

foreach $key (keys %hash){
	print "$key" . "\n";
}