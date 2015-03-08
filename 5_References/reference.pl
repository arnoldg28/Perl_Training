# Reference to a Scalar  
print "Reference to a Scalar \n";
$x = 20;
$ref_x = \$x;
print "$$ref_x \n";

# Reference to an Array
print "Reference to an Array \n";
@array = (1 .. 8);
$arr_ref = \@array;

print "Single element deferencing: \n";
print "$$arr_ref[1] \n";

print "\n"; 

print "Whole Array deferencing \n"; 
print "@$arr_ref";

print "\n\n";

# Reference to a Hash
%hash = ("key1"=>"v1", "key2"=>"v2");
$hash_ref = \%hash;

print "Single element hash deferencing \n"; 
print $$hash_ref{"key1"}; 
print "\n";
print "Deferencing the Hash \n"; 
print %$hash_ref;

print "\n\n";

