@array = ("k1","v1","k2","v2");
%hash = @array;

print keys %hash;
print "\n";
print values %hash;

print "\n";
@array2 = %hash;

print "@array2";