#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Skript nastavi uzivatelum vybrane sady stejny seed, jako je seed prvni ulohy z teto sady.
# Je nutne nastavit heslo do databaze, nazev tabulky podle jmena kurzu, nazev sady

import pymysql
import sys

# pristup do databaze
passwd=""
tablename="AM-2021-Marik_problem_user"
sada_uloh="10_Shrnuti"

# jmena uzivatelu z tabulky uzivatelu
tablenameUser="AM-2021-Marik_user"

# spojeni s databazi. V novych verizch misto db a passwd pouzivat database a password
db = pymysql.connect(host='localhost', port=3306, user='webworkWrite', passwd=passwd, db='webwork', charset='utf8')


cursor = db.cursor()

# stazeni seznamu uzivatelu
sql0 = "SELECT user_id FROM `"+tablenameUser+"`"
cursor.execute(sql0)
users = [i[0].decode('utf8') for i in cursor.fetchall()]

# pro ladici ucely jenom testovaci ucty
users = ["admin", "kombi", "pres"]

for koho in users: # cykus pres uzivatele

    # zjisteni hodnoty seed pro prvni ulohu
    sql1 = "SELECT problem_seed FROM `"+tablename+"` WHERE `user_id` = '"+koho+"' AND (`problem_id` = '01') AND (`set_id` = '10_Shrnuti') "
    cursor.execute(sql1)
    results = cursor.fetchall()
    seed = int(results[0][0])

    # nastaveni hodnoty seed pro vsechny ulohy dane sady
    sql2 = "UPDATE `"+tablename+"` SET `problem_seed`="+str(seed)+" WHERE `user_id` = '"+koho+"' AND (`set_id` = '"+sada_uloh+"')"
    p = cursor.execute(sql2)
    db.commit()

    # Tisk poctu zmenenych zaznamu
    pocet = cursor.rowcount
    print (koho+", seed "+str(seed)+", pocet radku "+str(pocet))


db.close()

