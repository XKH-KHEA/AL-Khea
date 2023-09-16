
page 54133 "POS Login Page"
{

    Caption = 'Point of Sale';
    PageType = Card;
   // SourceTable = "Post";
    //PageType = Document;
    UsageCategory = Tasks;
    ApplicationArea = All;
    layout
    {
        area(Content)
         {
               
              usercontrol(TextBos;Keyboard)
              {
                   ApplicationArea =all;
                    Visible = true; 
                    trigger Onload()
                    begin
                    CurrPage.TextBos.myFunction();
                    end;
                    trigger OnClick()
                    begin
                       CurrPage.TextBos.myFunction();
                    end;
               }
          //        usercontrol(Okay;Okay)
          //     {
          //          ApplicationArea =all;
          //           Visible = true; 
          //           trigger Onload()
          //           begin
          //           CurrPage.Okay.onChange();
          //           CurrPage.Okay.Okay();
          //           CurrPage.Okay.onKeyPress();
          //           end;
          //      }
         }
    }
    var 
     EditorReady : Boolean;
     


}
