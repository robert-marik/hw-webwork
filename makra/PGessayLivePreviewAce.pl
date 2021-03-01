
HEADER_TEXT(<<EOF);

<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ace.js"></script>

<script>
var Preview = {
  delay: 150,        // delay after keystroke before updating

  preview: null,     // filled in by Init below
  buffer: null,      // filled in by Init below

  timeout: null,     // store setTimout id
  mjRunning: false,  // true when MathJax is processing
  mjPending: false,  // true when a typeset has been queued
  oldText: null,     // used to check if an update is needed

  //
  //  Get the preview and buffer DIV's
  //
  Init: function () {
    this.preview = document.getElementById("MathPreview");
    this.buffer = document.getElementById("MathBuffer");
  },

  //
  //  Switch the buffer and preview, and display the right one.
  //  (We use visibility:hidden rather than display:none since
  //  the results of running MathJax are more accurate that way.)
  //
  SwapBuffers: function () {
    var buffer = this.preview, preview = this.buffer;
    this.buffer = buffer; this.preview = preview;
    buffer.style.visibility = "hidden"; buffer.style.position = "absolute";
    preview.style.position = ""; preview.style.visibility = "";
    buffer.style.display = "none"; preview.style.display = "inline-block";
  },

  //
  //  This gets called when a key is pressed in the textarea.
  //  We check if there is already a pending update and clear it if so.
  //  Then set up an update to occur after a small delay (so if more keys
  //    are pressed, the update won't occur until after there has been 
  //    a pause in the typing).
  //  The callback function is set up below, after the Preview object is set up.
  //
  Update: function () {
    if (this.timeout) {clearTimeout(this.timeout)}
    this.timeout = setTimeout(this.callback,this.delay);
  },

  //
  //  Creates the preview and runs MathJax on it.
  //  If MathJax is already trying to render the code, return
  //  If the text hasn't changed, return
  //  Otherwise, indicate that MathJax is running, and start the
  //    typesetting.  After it is done, call PreviewDone.
  //  
  CreatePreview: function () {
    Preview.timeout = null;
    if (this.mjPending) return;
    var text = document.getElementById("AnSwEr0001").value;
    text = text.replace(/\\n *\\n/g, "<p>"); 
    text = "<span style='color:red;font-weight:bold'>Náhled:</span><br>"+text;
    if (text === this.oldtext) return;
    if (this.mjRunning) {
      this.mjPending = true;
      MathJax.Hub.Queue(["CreatePreview",this]);
    } else {
      this.buffer.innerHTML = this.oldtext = text;
      this.mjRunning = true;
      MathJax.Hub.Queue(
	["Typeset",MathJax.Hub,this.buffer],
	["PreviewDone",this]
      );
    }
  },

  //
  //  Indicate that MathJax is no longer running,
  //  and swap the buffers to show the results.
  //
  PreviewDone: function () {
    this.mjRunning = this.mjPending = false;
    this.SwapBuffers();
  }

};

//
//  Cache a callback to the CreatePreview action
//
Preview.callback = MathJax.Callback(["CreatePreview",Preview]);
Preview.callback.autoReset = true;  // make sure it can run more than once

function Viditelnost()
{
Preview.Init();
jQuery("#AnSwEr0001").css("box-sizing","border-box");
jQuery("#AnSwEr0001").css("height","200px");
//jQuery("#AnSwEr0001").css("display","inline-block");
Preview.Update();
jQuery("#obalkaPreview").toggle();
jQuery("#obalkaPreview").css("display","inline-block");
jQuery("#AnSwEr0001").css({'height':("200"+'px')});
jQuery("#AnSwEr0001").keyup(function() {Preview.Update();});
}


jQuery( function() {
jQuery("#AnSwEr0001").after("<div class=tlacitka><a onclick=\\"doplnit('\\\\\\\\\\\\[','\\\\\\\\\\\\]');\\" title=\'Doplní matematické prostředí umístěné na samostatném řádku buď okolo vybraného úseku textu nebo na místo kurzoru. Ve druhém případě předvyplní textem se třemi X. Ve druhém případě předvyplní textem se třemi X. \'>\\\\&ZeroWidthSpace;[XXX\\\\&ZeroWidthSpace;]</a>"+
"<a onclick=\\"doplnit('\\\\\\\\\\\\(','\\\\\\\\\\\\)');\\" title=\'Funguje stejně jako vedlejší tlačítko, ale matematický výraz zůstává na řádku s textem.\'>\\\\&ZeroWidthSpace;(XXX\\\\&ZeroWidthSpace;)</a>"+
"<a onclick=\\"doplnit(\'^{\',\'}\');\\" title=\'Okolo vybraného textu doplní příkazy, které text přesunou do horního indexu. Pokud není vybraný žádný text, vloži na dané místo značku pro horní index se třemi X. Pozor, každý objekt může mít jenom jeden dolní a jeden horní index.\'>^{XXX}</a>"+
"<a onclick=\\"doplnit(\'_{\',\'}\');\\" title=\'Okolo vybraného textu doplní příkazy, které text přesunou do dolního indexu. Pokud není vybraný žádný text, vloži na dané místo značku pro dolní index se třemi X. Pozor, každý objekt může mít jenom jeden dolní a jeden horní index.\'>_{XXX}</a>"+
"<a onclick=\\"doplnitZlomek();\\" title=\'Vloží zlomek s předepsaným čitatelem a jmenovatelem na místo kurzoru. Pokud je vybrán nějaký text obsahující lomítko, použije se do čitatele výraz před prvním lomítkem a do jmenovatele výraz za tímto lomítkem. Pokud lomítko ve vybraném textu není, umístí se celý text do čitatele.\'>\\\\frac{XXX}{YYY}</a>"+
"<a onclick=\\"doplnit('\\\\\\\\left(','\\\\\\\\right)');\\" title=\'Přidá natahovací závorky okolo vybraného textu. Pokud žádný text není vybrán, vloží se konstrukce na místo kurzoru a dovnitř se vloží tři X.\'>\\\\left(XXX\\\\right)</a>"+
"<a onclick=\\"doplnit('{','}');\\" title=\'Přidá složené závorky okolo vybraného textu. Používá se pro rozšíření obsahu působnosti příkazů (do složených závorek se píšou víceznakové indexy, čitatel, jmenovatel, argument odmocniny a další). Pokud žádný text není vybrán, vloží se konstrukce na místo kurzoru a dovnitř se vloží tři X.\'>{XXX}</a>"+
"<a onclick=doplnitPred('\\\\\\\\mathrm');>\\\\mathrm </a>"+
"<a onclick=doplnitPred('\\\\\\\\partial');>\\\\partial </a>"+
"<a onclick=doplnitPred('\\\\\\\\int');>\\\\int </a>"+
"<a onclick=ace.edit('Aeditor').undo();>Undo</a>"+
"<a onclick=ace.edit('Aeditor').redo();>Redo</a>"+
"</div><div id=Aeditor></div><div id=obalkaPreview><div id=MathPreview></div><div id=MathBuffer></div></div>");
Viditelnost();
jQuery("#Aeditor").text(jQuery("#AnSwEr0001").val()); 
var editor = ace.edit('Aeditor');
editor.renderer.setShowGutter(false); 
editor.setTheme("ace/theme/textmate");
editor.getSession().setMode("ace/mode/latex");
editor.setFontSize(15);
editor.setOptions({maxLines: 200, minLines:10});
editor.setOption("wrap", true);
editor.setOption("indentedSoftWrap", false);
var textarea = jQuery('textarea[name="AnSwEr0001"]');
editor.getSession().on("change", function () {
    textarea.val(CheckForAscii(editor.getSession().getValue()));
    //textarea.val(editor.getSession().getValue());
    Preview.Update();
});
});

function CheckForAscii(string){
    if (/^[\\000-\\177 ěščřžýáíéúůťďŠČŘŽÝÁÍÉĎŤŇÚÄÔÓŔĹĽäĺľňŕô]*\$/.test(string))
    { return (string);}
    else
    {return ("Nepovolený znak na vstupu. Zkontrolujte si, že píšete jenom základní ASCII znaky a českou a slovenskou diakritiku. Pokud kopírujete text z webu, zkontolujte i neviditelné znaky jako různé druhy mezer, různé pomlčky atd.");}
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
  jQuery('.tlacitka a').tooltip();   
});

</script>

<style>
#MathPreview, #MathBuffer  
{
background-color: #ffd633;
padding:10px;
width:100%;
height:100%;
box-sizing: border-box;
display: inline-block;
}


#obalkaPreview{display:none; width:50%;}

#AnSwEr0001, #obalkaPreview, #Aeditor {vertical-align: top; }

#AnSwEr0001, #obalkaPreview, #Aeditor
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
  #AnSwEr0001, #obalkaPreview, #Aeditor {width:100%;}
}

#AnSwEr0001 {visibility:hidden; display:none;}

.tlacitka a {
-webkit-appearance: button;
color: #ffffff;
background-color: #990000;
padding:3px;
margin:3px;
border-radius: 4px;
display:inline-block;
}

.tlacitka {margin-bottom:5px; border-top: solid; border-top-width: 5px;border-top-color: #AAA; background: #AAA; }

.tlacitka a {box-shadow: 3px 3px 1px grey;}


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

