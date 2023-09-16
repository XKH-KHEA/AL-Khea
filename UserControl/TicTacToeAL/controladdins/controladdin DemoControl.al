controladdin DemoControl
{
    Scripts =
        'UserControl/TicTacToeAL/scripts/jquery-2.1.0.min.js',
        'UserControl/TicTacToeAL/scripts/demo.js';
    StartupScript = 'UserControl/TicTacToeAL/scripts/start.js';

    StyleSheets = 'UserControl/TicTacToeAL/stylesheets/demo.css';

    Images = 
        'UserControl/TicTacToeAL/images/o.png',
        'UserControl/TicTacToeAL/images/x.png';

    RequestedHeight = 500;
    RequestedWidth = 500;

    MaximumWidth = 1920;
    MaximumHeight = 1080;
    VerticalShrink = false;
    HorizontalShrink = false;
    VerticalStretch = true;
    HorizontalStretch = true;

    procedure SetName(Name: Text);
    procedure MoveAI(Position: JsonObject);
    event ControlReady();
    event MovePlayer(Position: JsonObject);
}