controladdin Wysiwyg
{
    RequestedHeight = 500;
    MinimumHeight = 500;
    MaximumHeight = 500;
    VerticalStretch = true;
    HorizontalStretch = true;
    Scripts = 'UserControl/ItemCard/Editor/Scripts/ckeditor.js', 'UserControl/ItemCard/Editor/Scripts/MainScript.js';
    StartupScript = 'UserControl/ItemCard/Editor/Scripts/startupScript.js';
    RecreateScript = 'UserControl/ItemCard/Editor/Scripts/recreateScript.js';
    StyleSheets = 'UserControl/ItemCard/Editor/Stylesheet/styles.css';
    RefreshScript = 'UserControl/ItemCard/Editor/Scripts/refreshScript.js';

    event ControlReady();
    event SaveRequested(data: Text);
    event ContentChanged();
    event OnAfterInit();

    procedure Init();
    procedure Load(data: Text);
    procedure RequestSave();
    procedure SetReadOnly(readonly: boolean);
}

page 50022 "Test Wysiwyg"
{
    Caption = 'Test Wysiwyg';
    layout
    {
        area(Content)
        {
            usercontrol(Test; Wysiwyg)
            {
                ApplicationArea = All;
                trigger ControlReady()
                begin
                    CurrPage.Test.Init();
                    CurrPage.Test.Load('This is a <strong>BOLD</strong> statement!');
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
                    CurrPage.Test.RequestSave();
                end;

            }
        }
    }
}