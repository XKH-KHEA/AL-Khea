function ifram()
{
    var div = document.getElementById("controlAddIn");
    div.innerHTML = "";
    div.class="center";
    var ifram = document.createElement("iframe");
    ifram.id='iframe';
    ifram.title= "Iframe Example";
    div.appendChild(ifram);
} 