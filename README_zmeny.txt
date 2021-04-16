Bazální metabolismus a růst hmotnosti jedince
* pridat otazku na dW/dM
* zduraznit, ze u dW/dt se chce dosazeni

Do kazde sady dat nco s desetinnym cislem

* Prozkoumat nutnost commitu ve skriptu, ktery meni data uzivatelu
* Randomizovat příklad s plejtvákem



Pred upgradem na 2.16 je asi potreba doinstalovat knihovny:
libjson-maybexs-perl libarchive-zip-perl libhttp-async-perl libxml-simple-perl npm


For multiple reasons stemming from many improvements, you need to install
npm on the server if it is not already there. Then go to the htdocs/ folder
and run:
npm install


Po upgradu na verzi 2.16:
* site.conf.dist na site.conf, nastavit URL serveru, Mariadb zmenit na mysql
* local.overrides.dist na local.overrides a zohlednit zmeny
* doinstaloval xml:simple.pm
* nezapomenout sudo patch -p1 -d / < /opt/webwork/webwork2/docker-config/xmlrpc-lite-utf8-fix.patch
* $permissionLevels{modify_tags} = "nobody";   do localOverriges aby
neotravovaly hlasky o taxnomny, viz https://webwork.maa.org/moodle/mod/forum/discuss.php?d=4819 




Achievementy
============

do preamble.at dat otazky opravovane rucne
my %essayProblems = (
 '1' => {      # set id
 '1' => 1,    # problem number
 '15' => 1, 
},
 '2' => {      # set id
 '1' => 1,    # problem number
 '15' => 1, 
}
);

a pote do testu na ukonceni sady pridat napriklad toto

# return 0 if this is not first correct submission of the current problem
return 0 if $problem->status != 1 && $problem->num_correct != 1;

# return 0 if a problem is this set is not solved
# the essay problems are not threated here
foreach my $problemRecord (@setProblems) {
  if ($problemRecord->status != 1) {
    return 0 
    unless $essayProblems{$problemRecord->set_id} && $essayProblems{$problemRecord->set_id}{$problemRecord->problem_id} ;
  }
}

return 1;



### speed_mather.at a super_speed_math.at nefunguji, cas se nastavi pokazde kdyz se prepnu do teto sady . 
