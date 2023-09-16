controladdin Radio
{
    RequestedHeight = 60;
    MinimumHeight = 60;
    RequestedWidth = 100;
    MinimumWidth = 100;
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
             'UserControl/Learn/Radio.js';
    StartupScript = 'UserControl/Learn/start.js';
    StyleSheets = 'UserControl/Learn/Radio.css';
    event Onload();
    procedure TextBox("id": Text; "caption": Text; "value": Text);
    procedure myFunction();
    procedure Value ("value": Text);
    event OnClick();
    procedure Buttond("id": text; "caption": text)
    procedure dropdownBt();

    event ControlReady();
    event SaveRequested(data: Text);
    event ContentChanged();
    event OnAfterInit();

    procedure Init();
    procedure Load(data: Text);
    procedure RequestSave();
    procedure SetReadOnly(readonly: boolean);
}