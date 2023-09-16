controladdin WeatherControlAddIns
{
    Scripts='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.js',
            'UserControl/ALButtonApp/src/Controls/label/label.js';
    StartupScript = 'UserControl/ALButtonApp/src/Controls/label/startup.js';
    VerticalStretch = true;
    HorizontalStretch = true;
    VerticalShrink = true;
    HorizontalShrink = true;
    RequestedHeight = 70;
    MinimumHeight=70;
    MaximumHeight=70;
    MinimumWidth =450;
    MaximumWidth=450;
    StyleSheets='UserControl/AlbuttonApp/src/controls/label/label.css';
    Images='UserControl/Images/Khea.jpg';
    procedure GetCustomer(Customer :JsonObject);
    procedure SetOption("key": Text; "value": Text);
}