
td:nth-child(4) {
  max-width:800px;  
  word-break: break-all;    
}



$("tr td:nth-child(4)").css("word-break","break-all");


library(htmltab)
url <- "Grader.html"
moje <- htmltab(doc = url)
library(dplyr)
moje %>% subset(`Latest Answers`!="There are no answers for this student.") -> moje2
length(unique(moje2$`Latest Answers`))

potom mozna https://stackoverflow.com/questions/16905425/find-duplicate-values-in-r


Skryti toho co je prazdne.

$("td:contains('There are no answers for this student.')").parent().css("display","none");


$("td:not(:contains('There are no answers for this student.'))").next('td').next('td').children().children().attr('checked',true);


Obarveni nevyplnene reakce.

$("textarea[name$='comment']:empty").css("background-color","#FAA");


Skryti hodnoceni 100%

$('select option:selected[value="100"]').parent().parent().parent().css("display","none"); 