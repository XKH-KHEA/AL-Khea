controladdin Menu
{
     RequestedHeight = 100;
    MinimumHeight = 100;
    RequestedWidth = 120;
    MinimumWidth = 120;
    VerticalStretch = true;
    HorizontalStretch = true;
    VerticalShrink = true;
    HorizontalShrink = true;
    Scripts = 'UserControl/Learn/DropdownMenu/ifram.js',
             'UserControl/Learn/DropdownMenu/Menu.js';
    StartupScript = 'UserControl/Learn/DropdownMenu/startup.js';
    StyleSheets = 'UserControl/Learn/DropdownMenu/Menu.css','UserControl/Learn/Radio.css',
                'UserControl/ALButtonApp/src/Controls/Button/Button.css';

    event Onclick();
    event ControlReady();
    event SaveRequested(data: Text);
    event ContentChanged();
    event OnAfterInit();

    procedure dropdownBt(Name:Text;caption:Text);
    procedure ifram();
    procedure Load(data: Text);
    procedure RequestSave();
    procedure SetReadOnly(readonly: boolean);
}
page 52022 "LooKPage"
{
    Caption = 'LooKPage';
    layout
    {
        area(Content)
        {
            usercontrol(Menud; Menu)
            {
                ApplicationArea = All;
                trigger ControlReady()
                var caption :Text;
                name:Text;
                begin
                    CurrPage.Menud.dropdownBt(name,caption);
                    CurrPage.Menud.Load('This is a <strong>BOLD</strong> statement!');
                end;

                trigger SaveRequested(data: Text)
                begin
                    Message(data);
                end;
            }
        }
    }
    actions
    {
        area(Creation)
        {
            action(Save)
            {
                trigger OnAction()
                begin
                    CurrPage.Menud.RequestSave();
                end;

            }
        }
    }
}