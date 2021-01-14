
HEADER_TEXT(<<EOF);

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
jQuery("#AnSwEr0001").css("width","100%");
jQuery("#AnSwEr0001").css("box-sizing","border-box");
jQuery("#AnSwEr0001").css("height","200px");
jQuery("#AnSwEr0001").css("display","inline-block");
jQuery("#AnSwEr0001").css("width","50%");
jQuery("#obalkaPreview").css("width","50%");
Preview.Update();
jQuery("#obalkaPreview").toggle();
jQuery("#obalkaPreview").css("display","inline-block");
//alert(jQuery("#obalkaPreview").height());
jQuery("#AnSwEr0001").css({'height':("200"+'px')});
//jQuery("#obalkaPreview").draggable().resizable();
jQuery("#AnSwEr0001").keyup(function() {Preview.Update();});
}


jQuery( function() {
jQuery("#AnSwEr0001").after("<div id=obalkaPreview><div id=MathPreview></div><div id=MathBuffer></div></div>");
Viditelnost();

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


#obalkaPreview{display:none; overflow:hidden; width:50%;}

#AnSwEr0001, #obalkaPreview {vertical-align: top; }
</style>


EOF

