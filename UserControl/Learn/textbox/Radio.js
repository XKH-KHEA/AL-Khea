
function createRadioButtons(id, caption, value) {
    var placeholder = document.getElementById('controlAddIn'); 

    var radioButton = document.createElement("input");
    radioButton.type = 'radio';
    radioButton.id = id;
    radioButton.value = value;
    radioButton.checked =true;
    radioButton.innerHTML = caption;
    placeholder.append(radioButton);
    var webPage = document.createElement('radio');
    webPage.innerHTML = caption;
   placeholder.appendChild(webPage);
 //   Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("CreateRadioButtons", [radioButton]);
 
  }
  // function embedHomePage(homePage)

  // {
  
  // var webPage = document.getElementById('webPage');
  
  // webPage.src = homePage;
  
  // }
  function radio(id, caption, value)
  {
    createRadioButtons(id, caption, value);
   var radioButton = document.getElementById('radioButton');
    radioButton.addEventListener("click",function(){
      document.getElementById(id).checked = false;
    });
  }