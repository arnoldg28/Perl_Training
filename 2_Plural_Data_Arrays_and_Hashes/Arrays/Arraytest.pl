#declaration of an array
@myArray = (1,2,"Number");

#Accessing an array
print "$myArray[0] \n";
print "$myArray[1] \n";
print "$myArray[2] \n";

print "\n\n";

# Return number of elements
$x = @myArray;
print $x; #return number of elements in the array

print "\n\n";

#assigning values of the array to a list of scalar
($a, $b,$c) = @myArray;
print $a;
print $b;
print $c;

#Assigning empty value
@empty = ();

print "\n\n";

#Getting the last element index. Index not length
print "Getting array last element index:\n";
print $#myArray;

print "\n\n";

#Array indexing
print "Array indexing example:\n";
@array = qw(arnold noni gatmaitan);
for($i=0;$i<=$#array;$i++){
	print "\$array[$i] = $array[$i] \n"
}

print "\n\n";

#Negative indexed array
print "negative indexed array:\n";
@array_neg = ("a".."d");
print $array_neg[-1];
