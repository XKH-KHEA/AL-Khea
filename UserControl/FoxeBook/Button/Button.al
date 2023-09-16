controladdin ALButton
{
    RequestedHeight = 36;
    MinimumHeight = 32;
    MinimumWidth = 84;
    VerticalStretch = false;
    HorizontalStretch = true;
    VerticalShrink = true;
    HorizontalShrink = true;

    Scripts =
        'UserControl/ALButtonApp/src/Controls/BaseControl.js',
        'UserControl/Foxebook/Button/Button.js',
        'UserControl/Learn/Radio.js';
    StyleSheets =
         'UserControl/ALButtonApp/src/Controls/BaseControl.css',
         'UserControl/Foxebook/Button/Button.css',
         'UserControl/Learn/Radio.css';
    StartupScript =
         'UserControl/Foxebook/Button/startup.js';
    //#region Base Events

    event OnLoad();

    event OnError(message: Text);

    //#endregion

    event OnClick(buttonId: Text);

    procedure SetOption("key": Text; "value": Text);
}