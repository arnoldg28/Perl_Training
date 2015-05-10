use Image::Magick;
$im = new Image::Magick;
$im->Read("test.bmp");
$x=20;$y=20;
($red, $green, $blue, $opacity) = split /,/, $im->Get("pixel[$x,$y]");
if($red==0 && $green==0 && $blue==0) {
    print "Color is black\n";
} elsif($red==255 && $green==255 && $blue==255) {
    print "Color is white\n";
} else {
    print "Color is $red,$green,$blue\n";
}
