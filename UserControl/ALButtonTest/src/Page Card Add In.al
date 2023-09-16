page 50133 "Item Cards"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Temp";
    Editable =true;
    layout
    {
        area(Content)
        {
               usercontrol(Weather; WeatherControlAddIns)
                {
                  Visible =true;
                  ApplicationArea =all;
        
                }     
                usercontrol(ALButtonGroup; ALButtonGroup_DSK)
                {
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnLoad()
                    begin
                        CurrPage.ALButtonGroup.AddButton('Primary', 'Primary style button', 'btn1', 'primary');
                     //   CurrPage.ALButtonGroup.AddButton('radio', 'Normal radio', 'radio', 'radio');
                        CurrPage.ALButtonGroup.AddButton('Info', 'Info style button', 'btn3', 'info');
                    //    CurrPage.ALButtonGroup.AddButton('Danger', 'Danger style button', 'btn4', 'danger');                      
                    end;
                    trigger OnClick(id: Text)
                    begin
                        Message('%1 button was clicked.', id);
                    end;
                }                    
            group(Control)
            {        
                 usercontrol (texbox;Radio)
                {
                    ApplicationArea =all;
                    Visible =true;
                    trigger Onload()
                    begin
                    CurrPage.texbox.TextBox('name','Bill-to Customer Name',Format(rec."Bill-to Customer No."));
                   
                    end;
                }
                 usercontrol (texemail;Radio)
                {
                    ApplicationArea =all;
                    Visible =true;
                    trigger Onload()
                    begin
                  //  CurrPage.Radio.TextBox('input', 'Full Name:','texbox');
                     CurrPage.texemail.TextBox('input','Document no:',Rec."Document no.");
                  //  CurrPage.Radio.TextBox('input','Address:','texbox');
                    end;
                }
                 usercontrol (textAdd;Radio)
                {
                    ApplicationArea =all;
                    Visible =true;
                    trigger Onload()
                    begin
                    // CurrPage.Radio.TextBox('input','Full Name:','texbox');
                    // CurrPage.Radio.TextBox('input','Email:','texbox');
                    CurrPage.textAdd.TextBox('input', 'Description :',rec.Description);
                    end;
                }
        
                usercontrol (Menus;Menu)
                {
                    ApplicationArea =all;
                    Visible =true;
                    trigger ControlReady()
                    begin
                       CurrPage.Menus.dropdownBt(gets,rec."Bill-to Customer Name");
                    end;                  
                     trigger Onclick()
                     var 
                     value:text;
                     item : Record Item;                    
                     begin
                        Rec.Reset();    
                         if Page.RunModal(Page::"Lookup Page", rec) = Action::LookupOK then
                         value := rec."Bill-to Customer Name";  
                         CurrPage.Menus.dropdownBt(gets,value);           
                    end;
                    trigger OnAfterInit()
                      begin
                    EditorReady :=true;
                    if rec."Bill-to Customer Name" <> '' then
                    CurrPage.Menus.Load(rec."Bill-to Customer Name")
                    else
                        CurrPage.Menus.Load(rec."Bill-to Customer Name");
                   CurrPage.Menus.SetReadOnly(not CurrPage.Editable);
                end;
                trigger  ContentChanged()
                begin
                    CurrPage.Menus.RequestSave();
                end;
                trigger SaveRequested(data: Text)
                begin
                    rec."Bill-to Customer Name" := data;
                end;
                  }
                       
                  usercontrol (No;Radio)
                {
                    ApplicationArea =all;
                    Visible =true;                 
                    trigger Onload()
                    begin      
                    CurrPage.No.TextBox('input', 'No.:',rec."No.");
                    end;

                }
                usercontrol (ifam;TextBox)
                {
                    ApplicationArea =all;
                    Visible =true;
                    trigger Onload()
                    begin
                    CurrPage.ifam.radio('radio','Female:','radio');  
                    CurrPage.ifam.radio('radio','Male:','radio');  
                    CurrPage.ifam.radio('radio','Other:','radio');                 
                    end;
                }
                  usercontrol (tex1;Radio)
                {
                    ApplicationArea =all;
                    Visible =true;
                    trigger Onload()
                    begin
                    CurrPage.tex1.TextBox('input', 'Currency Code :',rec."Currency Code");
                    end;
                }
                field(gets;gets)
                {           
                    TableRelation = Item."No.";
                    trigger OnValidate()
                    var
                       itemss : Record Item;

                    begin
                        if itemss.Get(gets) then
                       KKk:=itemss.Description;
                    end;

                }
                  usercontrol (tex2;Radio)
                {
                    ApplicationArea =all;
                    Visible =true;
                    trigger Onload()
                    begin
                    CurrPage.tex2.TextBox('input', 'Line Amount :',Format(rec."Line Amount"));
                    end;
                }
                   usercontrol (tex3;Radio)
                {
                    ApplicationArea =all;
                    Visible =true;
                    trigger Onload()
                    begin
                    CurrPage.tex3.TextBox('input', 'Unit Price :',Format(rec."Unit Price"));
                    end;
                }
                   usercontrol (tex4;Menus)
                {
                    
                    ApplicationArea =all;
                    Visible =true;
                    trigger ControlReady()
                    begin
                    CurrPage.tex4.dropdownBt(rec."Document no.");
                    end;
                    trigger Onclick()
                    begin
                        if Page.RunModal(Page::LooKPages,rec) =Action ::LookupOK then
                         KKk := rec."Document no.";
                         CurrPage.tex4.dropdownBt(KKk);
                    end;
                }
                    usercontrol (Radiod;Radio)
                {
                    ApplicationArea =all;
                    Visible =true;
                    trigger Onload()
                    begin
                    CurrPage.Radiod.myFunction();
                    end;
                }         
                  usercontrol(ALButtonGroups; ALButtonGroup_DSK)
                {
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnLoad()
                    begin
                        CurrPage.ALButtonGroups.AddButton('Primary', 'Primary style button', 'btn1', 'primary');
                     //   CurrPage.ALButtonGroup.AddButton('radio', 'Normal radio', 'radio', 'radio');
                        CurrPage.ALButtonGroups.AddButton('Info', 'Info style button', 'btn3', 'info');
                    //    CurrPage.ALButtonGroup.AddButton('Danger', 'Danger style button', 'btn4', 'danger');                      
                    end;
                    trigger OnClick(id: Text)
                    begin
                        Message('%1 button was clicked.', id);
                    end;
                }                            
                usercontrol("ALButton"; ALButton_DSK)
                {
                    Visible = true;
                    ApplicationArea = All;
                    trigger OnLoad()
                    begin  
                        CurrPage.ALButton.SetOption('caption', 'OK');
                        CurrPage.ALButton.SetOption('title', 'This is a vanilia Javascript Button');       
                        CurrPage.ALButton.SetOption('type', 'Edit');
                    end;
                      trigger OnClick(buttonId: Text)
                    begin
                        Page.Run(50113);
                    end;
                    trigger OnError(message: Text)
                    begin
                        Error('Something happened: %1', message);
                    end;
                }
                // usercontrol("ALButton2"; ALButton_DSK)
                // {
                //     Visible = true;
                //     ApplicationArea = All;
                //     trigger OnLoad()
                //     begin
                //         CurrPage.ALButton2.SetOption('caption', 'Edit');
                //         CurrPage.ALButton2.SetOption('title', 'This is a vanilia Javascript Button');
                //         CurrPage.ALButton2.SetOption('type', 'Edit');
                //     end;
                //     trigger OnClick(buttonId: Text)
                //     begin
                //         Page.Run(50113);
                //     end;
                // }            
            }                   
            usercontrol(EditCtl;Wysiwyg)
            {
                ApplicationArea =all;
                trigger ControlReady()
                begin
                    CurrPage.EditCtl.Init();
                end;
                trigger OnAfterInit()
                begin
                    EditorReady :=true;
                    if Rec.Description <> '' then
                    CurrPage.EditCtl.Load(Rec.Description)
                    else
                        CurrPage.EditCtl.Load(Rec.Description);
                   CurrPage.EditCtl.SetReadOnly(not CurrPage.Editable);
                end;
                trigger  ContentChanged()
                begin
                    CurrPage.EditCtl.RequestSave();
                end;
                trigger SaveRequested(data: Text)
                begin
                   Rec.Description :=data;
                end;
            }         
        }   
        area(factboxes)
        {
        part(TestPages;WeatherCardPart)
        {
            SubPageLink ="No." =field("No.");
            ApplicationArea =all   ;
            Caption ='Current Weather';
        }
        }
    }
    trigger OnOpenPage()
    begin
        
    end;
     trigger OnAfterGetRecord()
     begin
        if EditorReady then 
        begin
            EditorReady :=false;
            CurrPage.EditCtl.Init();
        end;

        if EditorReady then 
        begin
            EditorReady :=false;
            CurrPage.Menus.dropdownBt(gets,lookupValue);
        end;
     end;

     trigger OnInit()
     begin

     end;
      var 
      data : Page "Sales Invoice Query";
      lookupValue :text;
       ItemDs : Record CardItem;
       EditorReady :Boolean;
       GetDat: JsonObject;
       gets : Text;
       Text001: Label 'The MaxStrLen method returns: %1,\\';
       KKk :Text;
}