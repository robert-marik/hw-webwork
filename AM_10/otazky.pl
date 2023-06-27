
$odpovedi=[
"parciální derivace",  #0
"jedna diferenciální rovnice prvního řádu",          #1
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
odpoved=>"Popsanou úlohu umožňují vyřešit parciální derivace a pomocí nich formulovaný zákon šíření chyb. Tento zákon je přesně stvořen pro popsaný úkol.",
nastroj=>0
},
{
uloha=>"Máme veličinu \(X\) závislou na více vstupních datech, tj. na více jiných veličinách. Chceme udělat citlivostní analýzu, tj. zjistit, která veličina má zanedbatelný vliv a která podstatný vliv na změnu veličiny \(X\).",
odpoved=>"Parciální derivace udává změnu závislé veličiny způsobené jednotkovou změnou nezávislé veličiny. Zanedbatelný vliv mají veličiny s numericky malou derivací (přesně, ji s derivací blízkou k nule) a podstatný vliv veličiny s numericky velkou derivací (hodně kladnou nebo hodně zápornou).",
nastroj=>0
},
{
uloha=>"Máme vzorec pro pocitovou teplotu a potřebujeme vědět, jak se změny vstupních dat (změna okolní teploty a rychlosti větru) projevuje na změnách této teploty. Tedy potřebujeme znát odhad změny pocitové teploty při rychlosti větru o jednotku vyšší (a stejné teplotě). Nebo naopak, odhad změny pocitové teploty při stejné rychlosti větru a teplotě o jednotku vyšší.",
odpoved=>"Popsané informace jsou přímo interpretacemi parciální derivace funkce více proměnných. Odpovědí je tedy pojem parciální derivace.",
nastroj=>0
},
 #################### diferenciální rovnice
{
uloha=>"Sledujete veličinu měnící se v čase. Tato rychlost souvisí s numerickou hodnotou sledované veličiny a rádi bychom získali časový průběh veličiny. Obyčejné násobení nestačí, protože rychlost není konstantní. Obyčejná integrace rychlosti také nestačí, protože uvažovaná rychlost změny veličiny souvisí i s hodnotou této veličiny, tj. s funkcí, kterou teprve hledáme.",
odpoved=>"Rychlost je derivace podle času a souvislost mezi touto rychlostí a hodnotou veličiny představuje diferenciální rovnici. Úlohu budeme řešit pomocí diferenciálních rovnic.",
nastroj=>1
},
{
uloha=>"Máme počáteční data pro veličinu, která nás zajímá a model, který popisuje časový vývoj veličiny. Tento model používá fakt, že v každém okamžiku je dána rychlost změny. Chceme zjistit, za jak dlouho dosáhne veličina stacionárního neměnného stavu.",
odpoved=>"Rychlost je derivace podle času a zadána je tedy diferenciální rovnice (model popisující časový vývoj) a počáteční podmínka (výchozí stav, počáteční data). Jistě tedy využijeme aparát diferenciálních rovnic.",
nastroj=>1
},
   ################## autonomní systém
{
uloha=>"Sledujete koncentrace proteinů v řetězci chemických reakcí. Rychlosti změn v koncentracích jsou dány rychlostmi průběhu reakcí a ty souvisí s koncentracemi reagujících látek. Zajímají nás průběhy těchto koncentrací v čase. Přesněji, za jak dlouho dosáhne koncentrace sledovaného proteinu hodnotu, která způsobí jeho aktivitu.",
odpoved=>"Rychlosti jsou derivace, souvislosti koncentrací s rychlostí reakcí (a tím i s rychlostí změny koncentrací) jsou matematicky vyjádřeny jako diferenciální rovnice. Protože je proteinů více, nestačí jedna rovnice, ale je nutné použít soustavu.",
nastroj=>2
},
{
uloha=>"Sledujete navzájem interagující populace. Jsou definovány vztahy mezi těmito populacemi a tyto vztahy udávají, jak silně jedna populace podporuje či brzdí vývoj druhé populace. Zajímá nás, zda je realistická koexistence, nebo zda dojde ke konkurenčnímu vyloučení některé populace. Dále nás zajímá, jaký bude časový vývoj, tj. například jak rychlé bude vymírání konkurenčně méně úspěšného druhu.",
odpoved=>"Rychlosti jsou derivace a sledujeme derivace každé z populací podle času. Interakce mezi populacemi vyjádříme jako diferenciální rovnice a protože jich je několik, dostaneme autonomní systém.",
nastroj=>2
},
   ########## křivkový integrál
{
uloha=>"Je dáno vektorové pole popisující difuzní tok v plošném materiálu. V tomto materiálu je definována množina, která nás zajímá. Snažíme se určit, jestli díky toku množství veličiny narůstá či ubývá a jakou rychlostí.",
odpoved=>"Jinými slovy, potřebujeme určit tok vektorového pole křivkou tvořící hranici množiny. Tento tok počítáme křivkovým integrálem druhého druhu.",
nastroj=>3
},
{
uloha=>"Je dáno vektorové pole popisující silové působení a křivka definující počáteční a koncovou polohu objektu a také polohy objektu v průběhu pohybu. Chceme určit, jak velkou práci vykonalo silové pole při tomto přemístění objektu z počáteční polohy do polohy koncové.",
nastroj=>3
},
   ########## dvojný integrál
{
uloha=>"Máme dán nosník určitého průřezu a potřebujeme zjistit, jak se bude chovat při deformaci. Který nástroj využijeme při vyhodnocení toho, který průřez je vhodnější z hlediska dosažení nosníku? Podle čeho poznáme, který průřez lépe odolává deformaci?",
odpoved=>"Popsaný úkol přesně sedí na kvadratický modul průřezu nosníku. To je veličina definovaná dvojným integrálem.",
nastroj=>4
},
{
uloha=>"V každém bodě plošného materiálu známe výkon zdrojů produkujících teplo (tj. energie dodaná za jednotku času na jednotku plochy). Tento výkon není konstantní a proto není možné celkový výkon vyjádřit pomocí součinu obsahu a výkonu na jednotku obsahu. Jak tedy vypočteme celkový výkon v tomto případě?",
odpoved=>"Popsaný úkol je přesně důvodem, proč zavádíme dvojný integrál. Umožňuje nám posčítat příspěvky rozložené ve dvourozměrné množině.",
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
{
uloha=>"Máme termosnímek materiálu a z něj odvozený tok tepla. Chceme vědět, v kterých  místech (a zda vůbec) se materiál ohřívá, ve kterých se ochlazuje a jak rychle. Víme, že v materiálu nejsou dodatečné zdroje tepla.",
odpoved=>"Popsaná úloha je přesně úloha kvantitativně vyjádřena rovnicí vedení tepla. Rovnice vedení tepla je speciální případ difuzní rovnice.",
nastroj=>5
},
 ## rotace
{
uloha=>"Máme v prostoru definováno vektorové pole a chceme zjistit, jestli je možné přejít ke skalárním popisu tohoto vektorového pole. Tedy jestli je možno definovat pro toto vektorové pole skalární potenciál. To bude znamenat, že křivkový integrál v takovém poli nebude záviset na integrační cestě. Jak posoudíme, zda skalární potenciál existuje? Vyberte možnost, která nevyžaduje výpočet křivkového integrálu.",
odpoved=>"Vektorové pole má skalární potenciál právě tehdy, když má nulovou rotaci.",
nastroj=>6,
},
{
uloha=>"Máme v prostoru definováno vektorové pole, které uvažujeme jako pole rychlosti. Chceme zjistit, jestli pole má tendenci unášené objekty roztáčet okolo své osy. Jaký nástroj použijeme?",
odpoved=>"Jinými slovy, zajímá nás rotace vektorového pole.",
nastroj=>6
},
    ## divergence
{
uloha=>"Máme v prostoru definováno vektorové pole, které uvažujeme jako pole popisující tok tepla. Chceme zjistit, jestli tento tok v daném místě zesiluje, zeslabuje, nebo se zachovává. Jaký nástroj použijeme?",
odpoved=>"Zesilování či zeslabování toku v daném místě je dáno divergencí toku, zajímá nás tedy divergence vektorového pole.",
nastroj=>7
},
{
uloha=>"Máme v prostoru definováno vektorové pole, které uvažujeme jako pole popisující difuzní tok vody ve dřevě. Chceme zjistit, jestli tento tok v daném místě zesiluje, zeslabuje, nebo se zachovává. Jaký nástroj použijeme?",
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
uloha=>"Máme koncentraci vody ve dřevěném materiálu (množství vody v libovolném bodě) a známe materiálové vlastnosti. Zajímá nás, jak rychle a jakým směrem se množství vody přesunuje z místa, kde je vlhkost vysoká, do místa, kde je vlhkost nižší.",
odpoved=>"Popsaná závislost je závislost difuzního toku ve dřevě na záporně vzatém gradientu koncentrace. Tato závislost je vyjádřena konstitutivním zákonem. (Fickův zákon.)",
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
