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

udelat achievement s cislem malym a obsahem, ktery vymaze eseje z pole @problemSets.

----------------
## List of problems which will be excluded from the @setProblems
my %essayProblems = (
 '01_Derivace' => {      # set id
 '15' => 1,    # problem number
},
 '02_...' => {      # set id
 '2' => 1,    # problem number
 '15' => 1, 
},
 '2' => {      # set id
 '2' => 1,    # problem number
 '15' => 1, 
},
 '3' => {      # set id
 '3' => 1,    # problem number
 '15' => 1, 
},
 '4' => {      # set id
 '4' => 1,    # problem number
 '15' => 1, 
}
);


my $index_preamble=0;
my @idxsToRemove_preamble=();
foreach (@setProblems)
{
    unshift @idxsToRemove_preamble, $index_preamble if $essayProblems{$_->set_id} && $essayProblems{$_->set_id}{$_->problem_id} ; 
    $index_preamble++;
}

splice @setProblems, $_, 1 for @idxsToRemove_preamble;

return 0;
---------------


# * pridat last_attempt_solves.at  a ctyrlistek. Kontrolovat max_attempts
# * finished set on friday between the lunch and the evening
# * finished set on sunday between the lunch and the evening
# * problem solved on Monday morning



### speed_mather.at a super_speed_math.at nefunguji, cas se nastavi pokazde kdyz se prepnu do teto sady . 
