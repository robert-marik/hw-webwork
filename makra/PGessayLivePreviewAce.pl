
HEADER_TEXT(<<EOF);

<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ace.js"></script>

<script>

//
//  Cache a callback to the CreatePreview action
//


function Viditelnost()
{
answerField.css("box-sizing","border-box");
answerField.css("height","200px");
jQuery("#envelopePreview").toggle();
jQuery("#envelopePreview").css("display","inline-block");
answerField.css({'height':("200"+'px')});
answerField.keyup(function() {Preview.Update();});
}


jQuery(document).ready(function(){

answerField=jQuery("#AnSwEr0001");

jQuery( function() {
answerField.after("<div class='AAeditor alert  alert-secondary'><div class=AeditorButtons><a class='nav_button btn btn-primary' onclick=\\"doplnit('\\\\\\\\\\\\[','\\\\\\\\\\\\]');\\" title=\'Doplní matematické prostředí umístěné na samostatném řádku buď okolo vybraného úseku textu nebo na místo kurzoru. Ve druhém případě předvyplní textem se třemi X. Ve druhém případě předvyplní textem se třemi X. \'>\\\\&ZeroWidthSpace;[XXX\\\\&ZeroWidthSpace;]</a> "+
"<a class='nav_button btn btn-primary' onclick=\\"doplnit('\\\\\\\\\\\\(','\\\\\\\\\\\\)');\\" title=\'Funguje stejně jako vedlejší tlačítko, ale matematický výraz zůstává na řádku s textem.\'>\\\\&ZeroWidthSpace;(XXX\\\\&ZeroWidthSpace;)</a> "+
"<a class='nav_button btn btn-primary' onclick=\\"doplnit(\'^{\',\'}\');\\" title=\'Okolo vybraného textu doplní příkazy, které text přesunou do horního indexu. Pokud není vybraný žádný text, vloži na dané místo značku pro horní index se třemi X. Pozor, každý objekt může mít jenom jeden dolní a jeden horní index.\'>^{XXX}</a> "+
"<a class='nav_button btn btn-primary' onclick=\\"doplnit(\'_{\',\'}\');\\" title=\'Okolo vybraného textu doplní příkazy, které text přesunou do dolního indexu. Pokud není vybraný žádný text, vloži na dané místo značku pro dolní index se třemi X. Pozor, každý objekt může mít jenom jeden dolní a jeden horní index.\'>_{XXX}</a> "+
"<a class='nav_button btn btn-primary' onclick=\\"doplnitZlomek();\\" title=\'Vloží zlomek s předepsaným čitatelem a jmenovatelem na místo kurzoru. Pokud je vybrán nějaký text obsahující lomítko, použije se do čitatele výraz před prvním lomítkem a do jmenovatele výraz za tímto lomítkem. Pokud lomítko ve vybraném textu není, umístí se celý text do čitatele.\'>\\\\frac{XXX}{YYY}</a> "+
"<a class='nav_button btn btn-primary' onclick=\\"doplnit('\\\\\\\\left(','\\\\\\\\right)');\\" title=\'Přidá natahovací závorky okolo vybraného textu. Pokud žádný text není vybrán, vloží se konstrukce na místo kurzoru a dovnitř se vloží tři X.\'>\\\\left(XXX\\\\right)</a> "+
"<a class='nav_button btn btn-primary' onclick=\\"doplnit('{','}');\\" title=\'Přidá složené závorky okolo vybraného textu. Používá se pro rozšíření obsahu působnosti příkazů (do složených závorek se píšou víceznakové indexy, čitatel, jmenovatel, argument odmocniny a další). Pokud žádný text není vybrán, vloží se konstrukce na místo kurzoru a dovnitř se vloží tři X.\'>{XXX}</a> "+
"<a class='nav_button btn btn-primary' onclick=doplnitPred('\\\\\\\\mathrm');>\\\\mathrm </a> "+
"<a class='nav_button btn btn-primary' onclick=doplnitPred('\\\\\\\\partial');>\\\\partial </a> "+
"<a class='nav_button btn btn-primary' onclick=doplnitPred('\\\\\\\\int');>\\\\int </a><br> "+
"<a class='nav_button btn btn-primary' onclick=ace.edit('Aeditor').undo();>Undo</a> "+
"<a class='nav_button btn btn-primary' onclick=ace.edit('Aeditor').redo();>Redo</a> "+
"</div><div id=Aeditor></div><div id=envelopePreview><div id=MathPreview></div></div></div>");
Viditelnost();
jQuery("#Aeditor").text(answerField.val()); 
var editor = ace.edit('Aeditor');
editor.renderer.setShowGutter(false); 
editor.setTheme("ace/theme/textmate");
editor.getSession().setMode("ace/mode/latex");
editor.setFontSize(15);
editor.setOptions({maxLines: 200, minLines:10});
editor.setOption("wrap", true);
editor.setOption("indentedSoftWrap", false);
var textarea = answerField;
editor.getSession().on("change", function () {
    textarea.val(CheckForAscii(editor.getSession().getValue()));
    input = answerField.val().trim().replace(/\\n *\\n/g, "<p>");
    output = document.getElementById('MathPreview');
    output.innerHTML = input;
    MathJax.typeset();
});
textarea.val(CheckForAscii(editor.getSession().getValue()));
var input = answerField.val().trim().replace(/\\n *\\n/g, "<p>");
output = document.getElementById('MathPreview');
output.innerHTML = input;
MathJax.typeset();
});

});

function CheckForAscii(string){
    if (/^[\\000-\\177 ěščřžýáíéúůťďŠČŘŽÝÁÍÉĎŤŇÚÄÔÓŔĹĽäĺľňŕô]*\$/.test(string))
    { return (string);}
    else
    {return ("Nepovolený znak na vstupu. Zkontrolujte si, že píšete jenom základní ASCII znaky a českou a slovenskou diakritiku. Pokud kopírujete text z webu, zkontrolujte i neviditelné znaky jako různé druhy mezer, různé pomlčky atd.");}
};


function doplnit(mujtext1,mujtext2)
{
  var editor = ace.edit('Aeditor');
  selectedContent = editor.getSelectedText();
  if (selectedContent=="") { selectedContent="XXX" };
  range = editor.selection.getRange();
  editor.session.replace(range,mujtext1+selectedContent+mujtext2);
  editor.focus();
}

function doplnitPred(mujtext1)
{
  ace.edit('Aeditor').insert(mujtext1+" ");
  ace.edit('Aeditor').focus();
}

function doplnitZlomek(mujtext1,mujtext2)
{
  var editor = ace.edit('Aeditor');
  selectedContent = editor.getSelectedText();
  if (selectedContent == "") 
  { citatel="XXX"; jmenovatel="YYY"; }
  else
  {
    var res =  selectedContent.split(/\\/(.+)/);
    if (res.length == 1) 
       {citatel=selectedContent; jmenovatel="YYY";}
    else 
       {citatel=res[0]; jmenovatel=res[1];}
  }
  range = editor.selection.getRange();
  editor.session.replace(range,"\\\\frac{"+citatel+"}{"+jmenovatel+"}");
  editor.focus();
}

jQuery(document).ready(function(){
  jQuery('.AeditorButtons a').tooltip();   
});

</script>

<style>

.Aeditor {
    padding: 10px;
    background-color: white;
    border-color: black;
    border-style: solid;
    border-width: thin;
}

#MathPreview
{
/* background-color: #ffd633; */
padding:10px;
width:100%;
height:100%;
box-sizing: border-box;
display: inline-block;
}


#envelopePreview{display:none; width:50%;}

#AnSwEr0001, #envelopePreview, #Aeditor {vertical-align: top; }

#AnSwEr0001, #envelopePreview, #Aeditor
{
width: 50%;
max-width:100%;
}

#Aeditor
{
height:200px;
display:inline-block;
}

.ace_active-line {background:#888;}

\@media only screen  and (max-width: 1000px) {
  #AnSwEr0001, #envelopePreview, #Aeditor {width:100%;}
}

#AnSwEr0001 {visibility:hidden; display:none;}

.AeditorButtons a {
color: white !important;
}

/* 
.AeditorButtons a {
-webkit-appearance: button;
color: #ffffff;
background-color: #990000;
padding:3px;
margin:3px;
border-radius: 4px;
display:inline-block;
}

.AeditorButtons {margin-bottom:5px; border-top: solid; border-top-width: 5px;border-top-color: #AAA; background: #AAA; }

.AeditorButtons a {box-shadow: 3px 3px 1px grey;}
*/

.tooltip-inner {
  max-width: 200px;
  padding: 8px;
  color: #000;
  text-align: center;
  text-decoration: none;
  background-color: #FFF;
  border-style:solid;
  border-width: 1px;
}

.tooltip.top .tooltip-arrow {
  border-width: 5px 5px 0;
  border-top-color: #FFF;
}


</style>


EOF

