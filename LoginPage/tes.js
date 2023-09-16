function Okay()
{
  var placeholder = document.getElementById("controlAddIn"); 
  placeholder.innerHTML = "";

  var div = document.createElement("div");
  div.className ="simple-keyboard";
  
  var input = document.createElement("input");
  input.setAttribute("type", "text");
  input.setAttribute("placeholder", "Enter User Name here...");
  input.type = 'inputs';
  input.className = 'icons';
  input.id = 'inputs';
  input.innerHTML =  'User Name:' + "<br>";
  document.body.appendChild(input);

  div.appendChild(inputs);
  placeholder.appendChild(div);

  inputs.addEventListener("click", (function (e) {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("onKeyPress", []);
    
}
));
}