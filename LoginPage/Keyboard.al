controladdin Keyboard
{
     RequestedHeight = 250;
    MinimumHeight = 250;
    RequestedWidth = 400;
    MinimumWidth = 400;
    VerticalStretch = true;
    HorizontalStretch = true;
    VerticalShrink = true;
    HorizontalShrink = true;
    // HorizontalStretch = true;
    // VerticalStretch = true;
    // MaximumHeight =300;
    // MaximumWidth=300;
    // MinimumHeight=300;
    // MinimumWidth=300;
    // RequestedWidth =300;
    Scripts =
             'LoginPage/Radio.js',
              'LoginPage/Keyboard.js';
    StartupScript = 'LoginPage/start.js';
    StyleSheets =
     'LoginPage/Radio.css',
                 'LoginPage/Keyboad.css',
                 'https://fonts.googleapis.com/icon?family=Material+Icons';
    
    // procedure Login();
    procedure iframSS();
    procedure open();
    procedure close(Visible: Boolean);
    procedure myFunction();

    event Onload();
    event OnClick();
}