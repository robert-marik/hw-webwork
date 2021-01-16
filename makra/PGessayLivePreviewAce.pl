
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
jQuery("#AnSwEr0001").after("<div class=tlacitka><a onclick=doplnit('\\\\\\\\\\\\[','\\\\\\\\\\\\]');>\\\\&ZeroWidthSpace;[XXX\\\\&ZeroWidthSpace;]</a>"+
"<a onclick=doplnit('\\\\\\\\\\\\(','\\\\\\\\\\\\)');>\\\\&ZeroWidthSpace;(XXX\\\\&ZeroWidthSpace;)</a>"+
"<a onclick=doplnit('^{','}');>^{XXX}</a><a onclick=doplnit('_{','}');>_{XXX}</a>"+
"<a onclick=doplnitZlomek();>\\\\frac{XXX}{YYY}</a>"+
"<a onclick=doplnit('\\\\\\\\left(','\\\\\\\\right)');>\\\\left(XXX\\\\right)</a>"+
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
editor.setOption("indentedSoftWrap", false);
var textarea = jQuery('textarea[name="AnSwEr0001"]');
editor.getSession().on("change", function () {
    textarea.val(editor.getSession().getValue());
    Preview.Update();
});
});


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


#obalkaPreview{display:none; overflow:hidden; width:50%;}

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

</style>


EOF

