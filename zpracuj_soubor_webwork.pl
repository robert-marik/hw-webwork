 #!/usr/bin/perl
use strict;
use warnings;

my @setA = ("B","C","D","F","G","H","J","K","L","M","N","P","R","S","T","V","Z");
my @seta = ("b","c","d","f","g","h","j","k","l","m","n","p","r","s","t","v","z");
my @seth = ("a","e","i","o","u");
my @dig = ("2","3","4","5","6","7","8","9");

my $heslo="";
my $zakodovane_heslo="";

my $file = $ARGV[0] or die "Need to get CSV file on the command line\n";
     
my $sum = 0;

my $txt_kod="";
my $txt_plain="";
    
open(my $data, '<', $file) or die "Could not open '$file' $!\n";
while (my $line = <$data>) {
    chomp $line;
    my @data = split /;/, $line;
#    $heslo=$setA[rand @setA].$seth[rand @seth].$seta[rand @seta].$dig[rand @dig].$dig[rand @dig].$seta[rand @seta].$seth[rand @seth];
    $heslo=$setA[rand @setA].$seth[rand @seth].$seta[rand @seta].".".$seta[rand @seta].$seth[rand @seth];
    $zakodovane_heslo=crypt($heslo,join"",(".","/",0..9,"A".."Z","a".."z")[rand 64,rand 64]);
    $txt_kod=$txt_kod.$data[3].",".$data[1].",".$data[2].",,,,,".$data[4].",".$data[5].",".$zakodovane_heslo.",\n";
    $txt_plain=$txt_plain.$data[3].",".$heslo.",\n";

    
}

print $txt_kod;
open(FH, '>', "courselist_crypted.lst") or die $!;
print FH $txt_kod;
close(FH);

print $txt_plain;
open(FH, '>', "courselist_plain.lst") or die $!;
print FH $txt_plain;
close(FH);

print "Finish";
#print "$sum\n";
#print $heslo;

