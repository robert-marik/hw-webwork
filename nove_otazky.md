# Nové otázky

 
Co je výsledkem součinu matice $n\times n$ a $n$-rozměrného sloupcového vektoru (v tomto pořadí)?

* Sloupcový vektor. Toto využíváme k tomu, že pomocí matic je možné zapisovat zobrazení vektorů na vektory.
* Skalární číslo. Toto využíváme při výpočtu skalárního součinu vektorů a při určování jejich odchylky.
* Řádkový vektor. Toho využíváme při transformacích tenzorových veličin do jiných souřadných soustav.
* Soustava lineárních rovnic. Toho využíváme pro efektivní a krátký zápis soustav libovolné dimenze na jednom řádku.
* Součin není definovaný.

  -----
  
Co je výsledkem součinu matice $n\times n$ a $n$-rozměrného řádkového vektoru (v tomto pořadí)?

* Součin není definovaný.
* Sloupcový vektor. Toto využíváme k tomu, že pomocí matic je možné zapisovat zobrazení vektorů na vektory.
* Skalární číslo. Toto využíváme při výpočtu skalárního součinu vektorů a při určování jejich odchylky.
* Řádkový vektor. Toho využíváme při transformacích tenzorových veličin do jiných souřadných soustav.
* Soustava lineárních rovnic. Toho využíváme pro efektivní a krátký zápis soustav libovolné dimenze na jednom řádku.

---

Některé materiálové vlastnosti se nedají popsat pouze pomocí skalárních čísel a vektorů, ale je nutné použít i matice (tenzory). Proč? V jakých případech stačí skalární materiálové konstanty a v jakých případech jsou nutné tenzorové (maticové) konstanty?

* Tenzory používáme tam, kde podnětem a odezvou jsou vektorové veličiny, které nemusí nutně mít stejný směr. Tedy při popisu dějů v anizotropních materiálech.
* Tenzory používáme tam, kde materiál nemá ve všech bodech stejné vlastnosti, ale je nehomogenní. V jednom místě může být odezva na stejný podnět jiná, než v místě o kousek vedle.
* Tenzory používáme tam, kde se pracuje se dvou rozměrnými nebo trojrozměrnými veličinami. Pouze při popisu jednorozměrných úloh se obejdeme bez tenzorů.
* Tenzorovost veličin je matematický trik k efektivnímu zápisu vícedimenzionálních úloh. Nemá odraz v reálných měřitelných materiálových vlastnostech. Podle důkladnosti popisu můžeme tenzorovost uvažovat, či nemusíme.

Odpověď. Tenzory používáme tam, kde podnětem a odezvou jsou vektorové veličiny, které nemusí nutně mít stejný směr. Toto nastává v anizotropních materiálech. Homogenita a počet dimenzí jsou na tomto nezávislé. Nehomogenní a trojrozměnré materiály nemusíme popisovat pomocí tenzorů, pokud jsou izotropní.

---

Soustava lineárních rovnic $$AX=B$$ má regulární matici soustavy $A$ a sloupec pravých stran $B$. Jaké je řešení soustavy?

* $X=A^{-1}B$
* $X=\frac{B}{A}$
* $X=BA^{-1}$
* $X=B^{-1}A$
* $X=\frac 1{|A|}B^{-1}$
* $X=A^{-1}B A$

---


---



----

Veličina $T(x,y)$ udává teplotu v místě o souřadnicích $x$, $y$, kde počátek soustavy souřadnic je na křižovatce před budovou B na MENDELU, osa $x$ míří na východ a osa $y$ na sever. Teplotu měříme ve stupních Celsia, souřadnice v kilometrech. Gradient teploty v počátku je $\nabla T(0,0)=(-1,1) {}^\circ\mathrm{C}/\mathrm{km}$. Jak tuto skutečnost můžeme interpretovat pro uvedenou situaci?

* Na křižovatce před budovou B teplota roste severozápadním směrem rychlostí přibližně $1.4$ stupně Celsia na kilometr.
* Severozápdně od křižovatky před budovou B (kilometr na sever a kilometr na západ) je teplota maximální.
* Situace není reálná, gradient značí nárůst veličiny a nemůže mít záporné znaménko.
* Situace není reálná, teplota by současně musela růst (o jeden stupeň Celsia na kilometr) západním i severním směrem, což v praxi nemůže nastat. Jedna z komponent gradientu musí být nulová.

---

Veličina $T(x,t)$ udává teplotu v čase $t$ a v hloubce $x$ pod povrchem homogenní stěny, měřeno ze vnitřku budovy ven. (Uvnitř budovy je na povrchu stěny hodnota $x$ nulová a na vnějším povrchu budovy je rovna tloušťce stěny.) Obě paricální derivace $\frac{\partial T}{\partial t}$ a $\frac{\partial T}{\partial x}$ jsou nulové. V jaké situaci toto může nastat?

* Paricální derivace jsou nulové, pokud se teplota nemění v čase ani v profilu stěny. Například pokud vnitřek i vnějšek budovy mají stejnou teplotu a teplota zdi se ustálila na této společné hodnotě.
* Situace nemůže nastat, teplotní profil v homogenní stěně je lineární a paricální derivace podle polohy je vždy nenulová. 
* Situace nemůže nastat, ve stěně neustále probíhá přenos energie mezi vnějším a vnitřním prostředím a derivace podle času nebude nikdy nulová.
* Parciální derivace budou nulové, pokud bude mít teplota lokální extrém. Například v situaci, kdy horká stěna odděluje dvě studená prostředí.

---

Vyberte tvrzení, které vhodně ilustruje větu o nezávislosti.

Pro připomenutí, konzervativní vektorové pole je pole, kde integrál nezávisí na integrační cestě a skalární potenciál vektorového pole je taková skalární funkce, že její gradient je roven zadanému vektorovému poli.

* Vektorové pole je konzervativní, jestliže je jeho rotace nulová. V takovém případě má pole skalární potenciál a křivkový integrál po libovolné křivce je možné vypočítat jako rozdíl skalárních potenciálů v koncovém a počátečním bodě křivky. 
* Vektorové pole, které má skalární potenciál, umožňuje vypočítat rotaci tohoto vektorového pole prostřednictvím křivkového integrálu. 
* Nenulová rotace vektorového pole indikuje, že pole má skalární potenciál. Takové vektorové pole není konzervativní a křivkový integrál se redukuje na Riemannův integrál skelárního potenciálu.
* Je-li rotace skalárního potenciálu nulová, je vektorové pole konzervativní. Křivkový integrál podál libovolné křivky je poté možno určit jako Riemannův integrál skalárního potenciálu, případně jako křivkový integrál gradientu rotace.
