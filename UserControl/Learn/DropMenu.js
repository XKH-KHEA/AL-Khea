
function Createbt()
{
    var placeholder = document.getElementById('controlAddIn'); 
    var BtD = document.createElement('dropdown');
    BtD.id = 'BtD';
    BtD.class = 'dropdown';
    var radioButton = document.createElement("dropbtn");
    // radioButton.type = 'radio';
    // radioButton.id = id;
    // radioButton.value = value;
    radioButton.innerHTML = 'dropdowns';
    placeholder.appendChild(webPage);
    placeholder.append(radioButton);
}
// {/* <div class="dropdown">
//   <button onclick="myFunction()" class="dropbtn">Dropdown</button>
//   <div id="myDropdown" class="dropdown-content">
//     <a href="#home">Home</a>
//     <a href="#about">About</a>
//     <a href="#contact">Contact</a>
//   </div>
// </div> */}

function myFunction() {
    Createbt();
    document.getElementById("myDropdown").classList.toggle("show");
  }
  
  // Close the dropdown if the user clicks outside of it
  window.onclick = function(events) {
    if (!events.target.matches('.dropbtn')) {
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