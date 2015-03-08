# multi dimensional array can be implemented using references
@array = (1 .. 5);
$ref = \@array;

@array_2 = (a,b,c,$ref);

print $array_2[3][0];
print "\n";
print $array_2[3][1]; 
