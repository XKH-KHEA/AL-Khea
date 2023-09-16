// startup.js
// var controlAddin = Document.getElementById('controlAddIn');
// controlAddIn.innerHTML = '<div style="height :100%;width :100%;backgroun-color:black;"></div>';
var controlAddIn,nameDiv,cityDiv , tempDiv,imageDiv,image;
controlAddIn =$('#controlAddIn');

nameDiv =$("<div />",{id :"nameDiv"});
cityDiv =$("<div />",{id :"cityDiv"});
tempDiv =$("<div />",{id :"tempDiv"});
imageDiv =$("<div />",{id :"imageDiv"});
image = $("<img/>",
{src :Microsoft.Dynamics.NAV.GetImageResource("Objects/Images/IMG_8553.JPG")});
imageDiv.append(image);
controlAddIn.append(imageDiv);
controlAddIn.append(nameDiv);
controlAddIn.append(cityDiv);
controlAddIn.append(tempDiv);
window.GetCustomer = function(Customer)
{
    nameDiv.html("Customer Name :" + Customer.name);
    cityDiv.html("City is :" + Customer.city);
    tempDiv.html("Current Temperature is :" + Customer.temp);
}

