Essay vychází z předpokladu,k že se jedná vždy o úlohu číslo 15.

## Essay - kdo odpovídá a kdo to fláká

Vytáhne z tabulky AM-2021-Marik_past_answer pro každého uživatele a sadu úloh příklad číslo 15 a zjistí, kolik sad úloh obsahuje pokus o odpověď na tuto otázku.
Připojí jména a příjmení uživatelů

SELECT y.user_id, y.pocet, z.first_name, z.last_name 
FROM 
  (SELECT user_id, count(set_id) as pocet
      FROM 
          (SELECT DISTINCT user_id, set_id
           FROM `AM-2021-Marik_past_answer`
           WHERE `problem_id` LIKE '15%' AND `user_id` LIKE 'x%') AS x
      GROUP BY user_id
      ORDER BY pocet desc) AS y 
LEFT JOIN `AM-2021-Marik_user` as z
ON z.user_id = y.user_id;



## Essay - jaké jsou poslední odpovědi na jednotlivé otázky

Pro každého uživatele a každou sadu otázek zobrazí poslední pokus o odpověď na úkol číslo 15. K loginům přidá jména. 

SELECT x.user_id, z.first_name, z.last_name, x.set_id, timestamp, answer_string, comment_string FROM (
   # pro kazdeho uzivatele a sadu nejnovejsi odpoved na ukol cislo 15
   SELECT user_id, set_id, max(timestamp) as maxtime
   FROM `AM-2021-Marik_past_answer`
   WHERE `problem_id` LIKE '15%' AND `user_id` LIKE 'x%'
   GROUP BY user_id, set_id
   ) as x 
INNER JOIN `AM-2021-Marik_past_answer` AS y ON y.timestamp = x.maxtime  # pripojit odpovedi, komentare, casovou znacku ...
LEFT JOIN `AM-2021-Marik_user` AS z ON z.user_id = x.user_id        # pripojit prijmeni
ORDER BY x.user_id, set_id



## Kdo mel nejvetsi problemy s ulohou a s jakou

Pro jednotlive uzivatele a ulohy pocet pokusu, serazeno sestupne podle poctu pokusu

SELECT user_id, set_id, problem_id, count(*) as pocet, max(scores) as uspesnost
FROM `AM-2021-Marik_past_answer`
WHERE `user_id` LIKE 'x%'
GROUP BY user_id, set_id, problem_id
ORDER BY pocet DESC


## Ktere priklady vyzaduji nejvice pokusu?

SELECT set_id, problem_id, count(*) as pocet_pokusu, 
count(distinct(user_id)) as pocet_uzivatelu, count(*)/count(distinct(user_id)) as pokusu_na_uzivatele
FROM `AM-2021-Marik_past_answer`
WHERE `user_id` LIKE 'x%'
GROUP BY set_id, problem_id
ORDER BY pokusu_na_uzivatele DESC, set_id, problem_id

## Vypise ziskane achievementy

select x.achievement_id as id, pocet, y.name as jmeno, description as popis, icon as ikona 
from ( SELECT achievement_id, count(earned) as pocet
         FROM `AM-2021-Marik_achievement_user`
         where earned=1 and user_id like "x%"
         group by achievement_id)  as x
left join `AM-2021-Marik_achievement` as y
on x.achievement_id=y.achievement_id
order by round(y.number/100) desc, y.number


## Vypise kombinovane studenty a data uloh 

select * from `AM-2021-Marik_set_user`
where user_id in
(select user_id from `AM-2021-Marik_user`
     where section = "komb" and user_id!="kombi")


## Nakopirovani deadlinu uzivatele kombi vsem uzivatelum sekce komb v kurzu AM-2021-Marik

UPDATE 
`AM-2021-Marik_set_user` as t1
join
(select * from `AM-2021-Marik_set_user` where user_id="kombi") as t2
on t1.set_id=t2.set_id
SET t1.open_date = t2.open_date,
    t1.due_date = t2.due_date,
    t1.answer_date = t2.answer_date
where t1.user_id in (select user_id from `AM-2021-Marik_user` 
    where section = "komb" and user_id!="kombi")
    
## Bodovy zisk

Vypíše bodový zisk

SELECT x.user_id, sum(x.status*ifnull(x.value, y.value)) as score
FROM `AM-2021-Marik_problem_user` as x
left join `AM-2021-Marik_problem` as y
on x.set_id = y.set_id and x.problem_id = y.problem_id
where user_id like "x%"
group by user_id
order by score desc



select x.user_id, sum(x.status*ifnull(x.value, y.value)) as score
from `AM-2021-Marik_problem_user` as x
left join `AM-2021-Marik_problem` as y
on x.set_id = y.set_id and x.problem_id = y.problem_id
left join `AM-2021-Marik_set` as z on z.set_id = x.set_id
where user_id like "x%" and assignment_type = "default" and x.set_id like "00%"
group by user_id
order by score desc


## Bodovy zisk ze zkoušky


SELECT x.user_id, x.set_id, sum(x.status*ifnull(x.value, y.value)) as score
#assignment_type as typ
FROM `MT-Marik_problem_user` as x
left join `MT-Marik_problem` as y
on x.set_id = y.set_id and x.problem_id = y.problem_id
left join `MT-Marik_set` as z on z.set_id = x.set_id
where user_id like "x%" and assignment_type = "default" and x.set_id like "Z%"
group by user_id, set_id
order by score desc

