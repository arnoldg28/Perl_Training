# This also works for array.

%hash = ("k1"=>"v1","k2"=>"v2");
@array = ('1'..'4');

delete $hash{"k1"};
delete $array[0];

print %hash;
print "\n";
print @array;