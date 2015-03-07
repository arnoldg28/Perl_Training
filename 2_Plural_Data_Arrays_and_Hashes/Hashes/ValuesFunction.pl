%hash = ("k1"=>"v1","k2"=>"v3","k3"=>"v3");

for $value (values %hash){
	print "$value" . "\n";
}