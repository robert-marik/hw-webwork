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
