
var Editor

function dropdownBt(caption)
{
 var div = document.getElementById("controlAddIn");
 div.style = "max-height: 800px;min-height: 800px;";
 div.innerHTML = "";
 div.class="dropdown-content";
//  var InputArea = document.createElement("input");
//  InputArea.setAttribute("type", "text");
//  InputArea.setAttribute("placeholder", "Enter Name here...");
//  InputArea.value = caption;
//  InputArea.id="demo";
//  document.body.appendChild(InputArea);

//  var webPage = document.createElement('text');
//  webPage.innerHTML = 'Name Customer:'+ "<br>";


var dropdown = document.createElement("select");
var options =[caption];
dropdown.value = caption;


for (var option of options) {
 var opt = document.createElement("option");
 opt.textContent = option;
 opt.value = caption;
 dropdown.appendChild(opt);
}
document.body.appendChild(dropdown);
// div.appendChild(webPage);
// div.appendChild(InputArea);
// document.body.appendChild(text);
div.appendChild(dropdown);
opt.addEventListener("click", (function (e) {
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
