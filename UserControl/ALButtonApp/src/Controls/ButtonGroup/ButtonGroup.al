controladdin ALButtonGroup_DSK
{
    RequestedHeight = 60;
    MinimumHeight = 60;
    RequestedWidth = 600;
    MinimumWidth = 600;
    VerticalStretch = true;
    HorizontalStretch = true;
    VerticalShrink = true;
    HorizontalShrink = true;

    Scripts =
        'UserControl/ALButtonApp/src/Controls/BaseControl.js',
        'UserControl/ALButtonApp/src/Controls/Button/Button.js',
        'UserControl/ALButtonApp/src/Controls/ButtonGroup/ButtonGroup.js';
    StyleSheets =
        'UserControl/ALButtonApp/src/Controls/BaseControl.css',
        'UserControl/ALButtonApp/src/Controls/Button/Button.css',
        'UserControl/ALButtonApp/src/Controls/ButtonGroup/ButtonGroup.css';
    StartupScript =
        'UserControl/ALButtonApp/src/Controls/ButtonGroup/startup.js';

    //#region Base Events

    event OnLoad();

    event OnError(message: Text);
    event labels(Test: Text);

    //#endregion

    event OnClick(id: Text);

    procedure AddButton(caption: Text; title: Text; id: Text; "type": Text);
    //procedure Label(caption: Text; title: Text; id: Text; "type": Text);
    procedure AddRadio (id: Text; "type": Text);
    procedure RemoveButton(id: Text);

}