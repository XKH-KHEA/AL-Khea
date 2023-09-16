HTMLcontainer =document.getElementById("controlAddIn");

update = function(picker)
{
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ColorPicked",[picker.toRGBAString()]);
}
HTMLcontainer.inserAdjacentHTML('beforeend','<input data-jscolor="{onChnage:\'update(this)\',alpha:1.0}">');
jscolor.install();
Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("CotrolReady",[]);