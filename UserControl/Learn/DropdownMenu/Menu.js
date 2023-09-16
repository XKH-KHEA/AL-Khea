
var Editor

function dropdownBt(Name,caption)
{
 var div = document.getElementById("controlAddIn");
 //div.style="padding:400px;background-color:lightgray";
 div.innerHTML = "";
 div.class="center";
 //<iframe src="demo_iframe.htm" height="200" width="300" title="Iframe Example"></iframe>
// var ifram = document.createElement("iframe");
//     ifram.style="height=200px ;width=300px";
//     ifram.id='iframe';
//     ifram.title= "Iframe Example";

 var InputArea = document.createElement("input");
 InputArea.setAttribute("type", "text");
 InputArea.setAttribute("placeholder",caption);
 InputArea.value = caption;
 InputArea.id="demo";
 document.body.appendChild(InputArea);

 var InputAreaq = document.createElement("input");
 InputAreaq.setAttribute("type", "text");
 InputAreaq.setAttribute("placeholder",caption);
 InputAreaq.value = caption;
 InputAreaq.id="kk";
 document.body.appendChild(InputAreaq);

 var webPage = document.createElement('text');
 webPage.innerHTML = Name+ "<br>";
var dropdown = document.createElement("select");
var options =[caption];
//dropdown.value = caption;

for (var option of options) {
  var opt = document.createElement("option");
 // opt.textContent = option;
 // opt.value = caption;
  dropdown.appendChild(opt);
}
//document.body.appendChild(dropdown);
div.appendChild(webPage);
div.appendChild(InputArea);
div.appendChild(ifram);
div.appendChild(InputAreaq);
// document.body.appendChild(text);
// div.appendChild(text);
//dropdown.appendChild(opt);
InputArea.addEventListener("click", (function (e) {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnClick", []);
}).bind(this));

    ClassicEditor
        .create(document.querySelector('#demo'))
        .then(editor => {
            Editor = editor;
            editor.model.document.on( 'change:data', () => {
                Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ContentChanged",[]);    
            } );
        })
        .catch(error => {
            console.error(error);
        });
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnAfterInit",[]);
}
function Load(data) {
  Editor.setData(data);
}

function RequestSave() {
  Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("SaveRequested",[Editor.getData()]);
}
function SetReadOnly(readonly)
{
  Editor.isReadOnly = readonly;
}

  // Close the dropdown if the user clicks outside of it
  window.OnClick = function(event) {
    if (!event.target.matches('.select')) {
      var dropdowns = document.getElementsByClassName("dropdown-content");
      var i;
      for (i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  }
