%sampleHash = ('name' => 'Bob', 'phone' => '111-111-1111');
 print %sampleHash;
 print "\n";
 print "Found phone\n" if exists $sampleHash{'phone'};
 if (exists $sampleHash{'address'}) {
   print "Found address\n";
 }
 else {
   print "No address\n";
 }