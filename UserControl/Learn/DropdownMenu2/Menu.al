controladdin Menus
{
     RequestedHeight = 60;
    MinimumHeight = 60;
    RequestedWidth = 300;
    MinimumWidth = 300;
    VerticalStretch = true;
    HorizontalStretch = true;
    VerticalShrink = true;
    HorizontalShrink = true;
    Scripts =
             'UserControl/Learn/DropdownMenu2/Menu.js';
    StartupScript = 'UserControl/Learn/DropdownMenu2/startup.js';
    StyleSheets = 'UserControl/Learn/DropdownMenu2/Menu.css','UserControl/Learn/Radio.css',
                'UserControl/ALButtonApp/src/Controls/Button/Button.css';

    event Onclick();
    event ControlReady();
    event SaveRequested(data: Text);
    event ContentChanged();
    event OnAfterInit();

    procedure dropdownBt(caption:Text);
    procedure Load(data: Text);
    procedure RequestSave();
    procedure SetReadOnly(readonly: boolean);
}
page 53022 "LooKPages"
{
    Caption = 'LooKPage';
    layout
    {
        area(Content)
        {
            usercontrol(Menud; Menus)
            {
                ApplicationArea = All;
                trigger ControlReady()
                var caption :Text;
                begin
                    CurrPage.Menud.dropdownBt(caption);
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