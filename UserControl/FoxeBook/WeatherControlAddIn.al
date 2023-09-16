controladdin WeatherControlAddIn
{
    Scripts='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.js';
    StartupScript = 'UserControl/FoxeBook/JsScript/start.js';
    HorizontalStretch = true;
    VerticalStretch = true;
    RequestedHeight = 300;
    MinimumHeight=300;
    MaximumHeight=300;
    MinimumWidth =700;
    MaximumWidth=700;
    StyleSheets='UserControl/FoxeBook/StyleSheet/StyleSheet.css';
    Images='UserControl/Images/Kheas.jpg';
    procedure GetCustomer(Customer :JsonObject);
   // procedure GetRadio(Caption:Text;"id": Text; "type": Text);
}