page 50119 "HeadlinePage"
{
    PageType = HeadlinePart;
    SourceTable = HeadlineT;
    ApplicationArea = all;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {

            group(Control1)
            {
                field("headline Text";StrSubstNo(Rec.Caption,Rec."headline Text"))
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    trigger OnDrillDown()
                    begin
                        Page.Run(Rec."Page ID");
                    end;
                }
                
            }
            group(control3)
            {
                ShowCaption=false;
                field(Customer;StrSubstNo(Rec."headline hyperlink",GetCustomer))
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    trigger OnDrillDown()
                    begin
                        Page.Run(22);
                    end;
                }
                group(ew)
                {
                field (balanes;StrSubstNo(gg,GetNoactiveUser()))
                {
                   ApplicationArea = Basic, Suite;
                   Editable =false;
                   DrillDown = true;
                   trigger OnDrillDown() 
                   begin
                    Page.Run(Page::"Concurrent Session List");
                   end;
                }
                group(jd)
                {
                field(headlinrText;StrSubstNo(balanes,Rec."headline Text"))
                {
                   ApplicationArea = Basic, Suite;
                   Editable =false;
                     DrillDown = true;
                   trigger OnDrillDown() 
                   begin
                    Hyperlink(Rec."headline hyperlink");
                   end;
                }
                }
                }
            }
            group(control2)
            {
                field("headlineText"; DocumentationText2)
                {

                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    trigger OnDrillDown()
                    begin
                        Page.Run(50108);
                    end;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
      //  filterDate();
       filters(time);
       //headlineTable.NameKh(Page::HeadlinePage);
        DocumentationText2 := 'Do you want to <emphasize>Change Headline?</emphasize>';
    end;
    local procedure GetNoactiveUser(): Integer
    var 
     Activetion : Record "Active Session";
    begin
        Activetion.Reset();
        Activetion.SetRange("Client Type",Activetion."Client Type"::"Web Client");
        exit(Activetion.Count());
    end;
    local procedure GetCustomer(): Integer
    var 
     Customer : Record Customer;
    begin
        Customer.Reset();
        Customer.SetRange(Address);
        exit(Customer.Count());
    end;
    procedure filterDate(): Text
    var user : Record User;
    begin
        if user.Get(UserSecurityId()) then;
       //exit(filters(Rec."headline Text",time()));
    end;
    procedure GetSumName(): Text
    begin
        exit(filters(time()));
    end;

    procedure filters(CurrentTimeOfDay: time):Text
    var test :text;
    begin
        case CurrentTimeOfDay of
            000000T .. 105959T:            
            Rec.SetFilter("Id.", '1');
            110000T .. 135959T:
            Rec.SetFilter("Id.", '2');
            140000T .. 185959T:
            Rec.SetFilter("Id.", '3');
            190000T .. 235959T:
            Rec.SetFilter("Id.", '4');
        end;
    end;
    var
        DocumentationText2: text;
        headlinrText: Label '<qualifier>Ok!</qualifier><payload>The site <emphasize>%1</emphasize></payload>';
       // headlineTable: Page 50124;
        [InDataSet]
        HeadlineLink: Text;
        customers: Record Customer;
        
        balanes: Label '<qualifier>new!</qualifier><payload>The first item is <emphasize>%1</emphasize></payload>';
        gg : Label 'Web Client <emphasize>%1</emphasize>';
}