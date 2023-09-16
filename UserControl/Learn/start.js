
Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Onload',[]);

GetCustomer ();
function createRadioButton()
{

var placeholder = document.getElementById('controlAddIn');

//var webPage = document.createElement('iframe');
var radioButton = document.createElement('input');
radioButton.id = id;
radioButton.type = 'radio';
radioButton.value = value;
radioButton.innerHTML = caption;
//placeholder.appendChild(webPage);
placeholder.appendChild(radioButton);
}
createRadioButton();


