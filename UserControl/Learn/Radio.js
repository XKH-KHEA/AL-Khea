

function createRadioButton(id, caption, value) {
    var placeholder = document.getElementById('controlAddIn'); 
    var webPage = document.createElement('text');
    webPage.id = id + "<br>";
    webPage.type = 'text'+ "<br>";
    //webPage.value = 'Khea' + "<br>";
    webPage.innerHTML =  caption + "<br>";
    var radioButton = document.createElement("input");
    radioButton.setAttribute("type", "text");
    radioButton.setAttribute("placeholder", "Enter Data here...");
    // radioButton.type = 'radio';
    // radioButton.id = id;
     radioButton.value = value;
    // radioButton.innerHTML = caption;
    placeholder.appendChild(webPage);
    placeholder.append(radioButton);
    radioButton.addEventListener("click", (function (e) {
      Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnClick", []);
      radioButton.value = value;
  }).bind(this));

  
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
  function TextBox(id, caption, value)
  {
    createRadioButton(id, caption, value);
    var radioButton = document.getElementById('radioButton');
      // radioButton.addEventListener("click",function(){
      // document.getElementById("demo").innerHTML = "Hello World!"
    // });
  }