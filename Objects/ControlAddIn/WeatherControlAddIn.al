controladdin WeatherControlAddInss
{
    Scripts='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.js';
    StartupScript = 'Objects/JsScript/start.js';
    HorizontalStretch = true;
    VerticalStretch = true;
    RequestedHeight = 300;
    MinimumHeight=300;
    MaximumHeight=300;
    MinimumWidth =700;
    MaximumWidth=700;
    StyleSheets='Objects/StyleSheet/StyleSheet.css';
    Images='Objects/Images/IMG_8553.JPG';
    procedure GetCustomer(Customer :JsonObject);
}