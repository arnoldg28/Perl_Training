%hash = ("k1"=>"v1","k2"=>"v2","k3"=>"v3");

print "Printing key value using each (output is random) \n";
($key,$value) = each %hash;
print "$key $value";

print "\n\n";

print "Using While loop in printing all key and value using each function \n";

while(($key2,$value2)=each %hash){
	print "$key2 : $value2 \n";	
}

#Notice that while prints only 2 sets of key:value pairs.