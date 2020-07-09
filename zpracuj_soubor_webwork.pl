#!/usr/bin/perl

# 1. Stáhnout z UIS Seznamy studentů, Všichni, csv, sestava s Id emaily loginy a identifikaci, prijmeni a jmeno; ulozit jako seznam_cp1250.csv
# 2. Stáhnout bodovací arch csv, uložit jako bodovaci_arch.csv
# 3. Spustit:
#       iconv -f CP1250 -t UTF-8 seznam_cp1250.csv -o seznam_utf8.csv
# 4. Spustit:
#       perl zpracuj_soubor_webwork.pl seznam_utf8.csv
# 5. naimportovat courselist_crypted.lst do WeBWoRK
# 6. naimportovat bodovaci_arch_import.csv do UISu

my @setA = ("B","C","D","F","G","H","J","K","L","M","N","P","R","S","T","V","Z");
my @seta = ("b","c","d","f","g","h","j","k","l","m","n","p","r","s","t","v","z");
my @seth = ("a","e","i","o","u");
my @dig = ("2","3","4","5","6","7","8","9");

my $heslo="";
my $zakodovane_heslo="";

my $file = $ARGV[0] or die "Need to get CSV file on the command line\n";
     
my $sum = 0;
%mydata=();

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
    #$txt_plain=$txt_plain.$data[3].",".$heslo.",\n";
    $mydata{"\"".$data[5]."\""}=$heslo;
    
}

open(FH, '>', "courselist_crypted.lst") or die $!;
print FH $txt_kod;
close(FH);

$newfile="";

open(my $data, '<', "bodovaci_arch.csv") or die "Could not open file\n";

while (my $line = <$data>) {
    chomp $line;
    my @data = split /,/, $line;
    print $data[5];
    $data[4]="\"".$mydata{$data[5]}."\"";
    $newline=join (",",@data);
    $newfile=$newfile."\n".$newline;
}    


open(FH, '>', "bodovaci_arch_import.csv") or die $!;
print FH $newfile;
close(FH);

print "Finish";


