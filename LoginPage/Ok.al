controladdin Okay
{
     RequestedHeight = 800;
    MinimumHeight = 800;
    RequestedWidth = 800;
    MinimumWidth = 800;
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
    'https://cdn.jsdelivr.net/npm/simple-keyboard@latest/build/index.js',
    'LoginPage/index.js',
    'LoginPage/tes.js';

    StartupScript = 'LoginPage/start.js';
    StyleSheets =
    'https://cdn.jsdelivr.net/npm/simple-keyboard@latest/build/css/index.css';

    
    // procedure Login();
    procedure onChange();
    procedure onKeyPress();
    procedure Okay();

    event Onload();
}