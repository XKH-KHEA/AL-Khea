

function Login() {
    var placeholder = document.getElementById("controlAddIn"); 
    placeholder.innerHTML = "";

    var image = document.createElement("img");
    image.src = "https://w7.pngwing.com/pngs/623/978/png-transparent-brand-mode-of-transport-sky-header-blue-electronics-cloud.png";
    document.body.appendChild(image);

    var ifram = document.createElement("iframe");
    ifram.style="height=200px ;width=300px";
    ifram.id='iframe';
    ifram.title= "Iframe Example";

    // var text = document.createElement("text");
    // text.id = 'input';
    // text.type = 'text'+ "<br>";
    // // text.value = 'Khea' + "<br>";
    // text.innerHTML =  'User Name:' + "<br>";
    // document.body.appendChild(text); 
    
   

    // var text = document.createElement("text");
    // text.id = 'texts';
    // text.type = 'texts'+ "<br>";
    // // text.value = 'Khea' + "<br>";
    // text.innerHTML =  'Passwrod:' + "<br>";
    // document.body.appendChild(text);  

    var inputs = document.createElement("input");
    inputs.setAttribute("type", "text");
    inputs.setAttribute("placeholder", "Enter User Name here...");
    inputs.type = 'inputs';
    inputs.className = 'icons';
    inputs.id = 'inputs';
    inputs.innerHTML =  'User Name:' + "<br>";
    document.body.appendChild(inputs);

    var inputs = document.createElement("input");
    inputs.setAttribute("type", "text");
    inputs.setAttribute("placeholder", "Enter Passwoord: here...");
    inputs.type = 'password';
    inputs.className = 'icon';
    inputs.id = 'pwd';
    inputs.name='pwd';
    inputs.minlength="8";
    inputs.innerHTML =  'Passwoord:' + "<br>";
    document.body.appendChild(inputs);
 
 
    var inputp = document.createElement("button");
    //inputp.setAttribute("type", "text");
    //inputp.setAttribute("placeholder", "Enter Pass here...");
    inputp.type = 'buttond';
    inputp.id = 'buttond';
    inputp.className = 'loginbtn';
    inputp.innerHTML =  'Okay' + "<br>";
    document.body.appendChild(inputp);

    var inputp = document.createElement("button");
    //inputp.setAttribute("type", "text");
    //inputp.setAttribute("placeholder", "Enter Pass here...");
    inputp.type = 'buttons';
    inputp.id = 'buttons';
    inputp.innerHTML =  'Cancel' + "<br>";
    document.body.appendChild(inputp);

    // placeholder.appendChild(text);
    placeholder.appendChild(ifram);
    placeholder.appendChild(inputs);
    placeholder.appendChild(inputp);
    placeholder.appendChild(image);


    inputp.addEventListener("click", (function (e) {
      Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnClick", []);

  }).bind(this));
  
  }
  function ifram(){
     
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
