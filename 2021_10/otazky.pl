
$odpovedi=[
"parciální derivace",  #0
"diferenciální rovnice",          #1
"autonomní systém diferenciálních rovnic",  #2
"křivkový integrál",              #3
"dvojný integrál",                #4
"difuzní rovnice nebo rovnice vedení tepla",#5
"rotace vektorového pole",        #6
"divergence vektorového pole",    #7
"gradient a konstitutivní zákon", #8
"Greenova věta",                  #9
];

$otazky=
[
   #################### parcialni derivace
{
uloha=>"Máme vzorec pro výpočet veličiny, která nás zajímá. Máme naměřené veličiny vstupující do tohoto vzorce. Chceme odhadnout, jak se chyby v naměřených datech projeví na chybě takto vypočtené veličiny.",
odpoved=>"Zákon šíření chyb. Tento zákon se opírá o derivace a je přesně stvořen pro popsaný úkol.",
nastroj=>0
},
{
uloha=>"Máme veličinu závislou na více vstupních datech. Chceme zjistit, která vstupní data mají malý vliv a která velký vliv na změny této veličiny.",
odpoved=>"Parciální derivace udává změnu závislé veličiny způsobené jednotkovou změnou nezávislé veličiny.",
nastroj=>0,
},
   #################### diferenciální rovnice
{
uloha=>"Máme vzorec pro pocitovou teplotu a potřebujeme vědět, jak se změny vstupních dat projevují na změnách této teploty. Tedy potřebujeme znát odhad změny pocitové teploty při rychlosti větru o jednotku vyšší (a stejném obsahu) nebo naopak.",
odpoved=>"Popsané informace jsou přímo interpretacemi parciální derivace funkce více proměnných.",
nastroj=>1
},
{
uloha=>"Sledujete veličinu měnící proměnnou rychlostí. Tato rychlost souvisí s numerickou hodnotou sledované veličiny a rádi bychom získali časový průběh. Obyčejná integrace rychlosti nestačí, protože rychlost souvisí i s hodnotou veličiny, tj. s funkcí, kterou teprve hledáme.",
odpoved=>"Rychlost je derivace podle času a souvislost mezi touto rychlostí a hodnotou veličiny představuje diferenciální rovnici.",
nastroj=>1
},
   ################## autonomní systém
{
uloha=>"Sledujete koncentrace proteinů v řetězci chemických reakcí. Rychlosti změn v koncentracích jsou dány rychlostmi průběhu reakcí a ty souvisí s koncentracemi reagujících látek. Zajímají nás průběhy těchto koncentrací v čase. Přesněji, za jak dlouho dosáhne koncentrace sledovaného proteinu hodnotu, která způsobí jeho aktivitu.",
odpoved=>"Rychlosti jsou derivace, souvislosti koncentrací s rychlostí reakcí (a tím i s rychlostí změny koncentrací) jsou matematicky vyjádřeny jako diferenciální rovnice. Protože je proteinů více, nestačí jedna rovnice, ale je nutné použít soustavu.",
nastroj=>2
},
   ########## křivkový integrál
{
uloha=>"Je dáno vektorové pole popisující difuzní tok v plošném materiálu. V tomto materiálu je definována množina, která nás zajímá. Snažíme se určit, jestli díky toku množství veličiny narůstá či ubývá a jakou rychlostí.",
odpoved=>"Jinými slovy, potřebujeme určit tok vektorového pole křivkou tvořící hranici množiny. Tento tok počítáme křivkovým integrálem druhého druhu.",
nastroj=>3
},
   ########## dvojný integrál
{
uloha=>"Máme dán nosník určitého průřezu a potřebujeme zjistit, jak se bude chovat při deformaci. Který nástroj využijeme při vyhodnocení toho, který průřez je vhodnější z hlediska dosažení nosníku, který lépe odolává deformaci?",
odpoved=>"Popsaný úkol přesně sedí na kvadratický modul průřezu nosníku. To je veličina definovaná dvojným integrálem.",
nastroj=>4
},
{
uloha=>"V každém bodě plošného materiálu známe výkon zdrojů produkujících teplo (tj. energie dodaná za jednotku času na jednotku plochy). Tento výkon není konstantní a proto není možné celkový výkon vyjádřit pmocí součinu výkonu na jednotku obsahu s obsahem. Jak tedy vypočteme celkový výkon v tomto případě?",
odpoved=>"Popsaný úkol je přesně důvodem, proč zadádíme dvojný integrál. Umožňuje nám posčítat příspěvky rozložené ve dvourozměrné množině.",
nastroj=>4
},
   #### difuzní rovnice    
{
uloha=>"Sledujete vývoj teplotního pole ve dřevěném prkně v peci pro tepelnou modifikaci. Zajímá nás, jak rychle prostupuje teplo do prkna, tj. například, kdy je uprostřed prkna požadovaná teplota.",
odpoved=>"Šíření tepla materiálem je obecný transportní jev popsaný difuzní rovnicí. Speciálním případem difuzní rovnice je rovnice vedení tepla.",
nastroj=>5
},
{
uloha=>"Sledujete vývoj vlhkostního pole ve dřevěném prkně v sušárně. Zajímá nás, jak rychle vystupuje vlhkost z prkna, tj. například, kdy je uprostřed prkna požadovaná vlhkost.",
odpoved=>"Šíření vody materiálem je obecný transportní jev popsaný difuzní rovnicí.",
nastroj=>5
},
{
uloha=>"Na okrajích sledované oblasti je konstantní hladina chemické látky. Tato látka se šíří do okolí a současně degraduje (rozkládá se). Zajímá nás koncentrace látky v jednotlivých místech uvnitř sledované oblasti poté, co se koncentrace ustálí.",
odpoved=>"Transportní jevy jsou popsány difuzní rovnicí. Správnou odpovědí je tedy difuzní rovnice. V tomto případě víme i něco navíc: rovnice bude obsahovat zdroje charakterizující degradaci a bude nám stačit stacionární rovnice. ",
nastroj=>5
},
    ## rotace
{
uloha=>"Máme v prostoru definováno vektorové pole a chceme zjistit, jestli je možné přejít ke skalárním popisu tohoto vektorového pole. Tedy jestli je možno definovat pro toto vektorové pole skalární potenciál. Jak posoudíme, je-li taková úloha řešitelná? Jak posoudíme, zda skalární potenciál existuje?",
odpoved=>"Vektorové pole má skalární potenciál právě tehdy, když má nulovou rotaci.",
nastroj=>6
},
{
uloha=>"Máme v prostoru definováno vektorové pole, které uvažujeme jako pole rychlosti.  Chceme zjistit, jestli pole má tendenci unášené objekty roztáčet okolo své osy. Jaký nástroj použijeme?",
odpoved=>"Jinými slovy, zajímá nás rotace vektorového pole.",
nastroj=>6
},
    ## divergence
{
uloha=>"Máme v prostoru definováno vektorové pole, které uvažujeme jako pole popisující tok tepla.  Chceme zjistit, jestli tento tok v daném místě zesiluje, zeslabuje, nebo se zachovává. Jaký nástroj použijeme?",
odpoved=>"Zesilování či zeslabování toku v daném místě je dáno divergencí toku, zajímá nás tedy divergence vektorového pole.",
nastroj=>7
},
    ## gradient, konstitutivní zákon
{
uloha=>"Máme dánu teplotu a materiálové vlastnosti. Zajímá nás tok tepla, tj. jakým směrem a jakou intenzitou je v materiálu transportována energie.",
odpoved=>"Popsaná závislost je závislost toku na záporně vzatém gradientu teploty. Tato závislost je vyjádřena konstitutivním zákonem. (Fourierův zákon.)",
nastroj=>8
},
{
uloha=>"Máme termosnímek materiálu a známe materiálové vlastnosti. Zajímá nás tok tepla, tj. jakým směrem a jakou intenzitou je v materiálu transportována energie.",
odpoved=>"Popsaná závislost je závislost toku na záporně vzatém gradientu teploty. Tato závislost je vyjádřena konstitutivním zákonem. (Fourierův zákon.)",
nastroj=>8
},
{
uloha=>"Máme termosnímek materiálu a z něj odvozený tok tepla. Chceme vědět, v kterých  místech se materiál ohřívá, ve kterých se ochlazuje a jak rychle. Případně, zda je úloha stacionární či nestacionární.",
odpoved=>"Popsaná úloha je přesně úloha kvantitativně vyjádřena rovnicí vedení tepla. Rovnice vedení tepla je speciální případ difuzní rovnice.",
nastroj=>8
},
        ## Greenova veta
{
uloha=>"Máme představu, jak funguje fyzikální zákon v materiálu, a chceme z toho kvůli otestování hypotéz vyvodit pozorovatelné a měřitelné důsledky. Jaký nástroj dokáže přemostit propast mezi lokální a globální formulací fyzikálních zákonů?",
odpoved=>"Greenova věta je přesně to, co potřebujeme pro přechod mezi lokální a globální formulací libovolným směrem. Je to díky tomu, že potřebujeme přepočítat tok přes hranici (vyjádřen křivkovým integrálem) na součet příspěvků v celkovému přírůstku nebo poklesu v každém místě množiny.",
nastroj=>9
},
];

1;
