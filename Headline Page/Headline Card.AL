page 50108 "Headline Card"
{
    Caption = 'Headline Card';
    PageType = Card;
    SourceTable = HeadlineT;
    UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No.";Rec."No.")
                {
                    Caption ='Headline No.';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Id.";Rec."Id.")
                {
                    ApplicationArea =all;
                    Caption='Id.';
                }
                 field(Caption;Rec.Caption)
                 {
                     ApplicationArea = All;
                 }
                    field(Page;Rec."Page ID")
                    {
                          ApplicationArea = All;
                    }
                field("headline Text";Rec."headline Text")
                {
                    ApplicationArea = All;
                }
                  field("headline hyperlink";Rec."headline hyperlink")
                {
                    Caption='headline hyperlink';
                    ApplicationArea = All;
                }
            }
            group(Details)
            {
                field("start date";Rec."start date")
                {
                    ApplicationArea = All;
                    // trigger OnValidate()
                    // begin
                    // if Rec."start date" >= Rec."end date" then
                    //    Error('Start date must be less than End Date');
                    // end;
                }
                field("end date";Rec."end date")
                {
                    ApplicationArea = All;
                    // trigger OnValidate()
                    // begin
                    // if  Rec."end date" <= Rec."start date" then
                    //    Error('End date must be Than Start Date');
                    // end;
                }
                field("Due date";Rec."Due date")
                {
                      ApplicationArea = All;
                    // trigger OnValidate()
                    // begin
                    // if  Rec."Due date" <= CurrentDateTime then
                    //    Error('End date must be Than Start Date');
                    // end;
                }
            }
        }
    }
    actions{
         
        area(Processing){
            action(filter){
                Caption ='filter';
                Promoted=true;
                PromotedCategory =Process;
                PromotedIsBig =true;
                PromotedOnly=true;

                    trigger OnAction()
                    begin
                  CurrPage.SetSelectionFilter(headline);
                  Message('Filtter =%1,count=%2',headline.GetFilters(),headline.Count());
                  headline.FindFirst();
                  headline.Mark(true);
                  headline.Next();
                  headline.Mark(true);
                  headline.MarkedOnly(true);
                    end;
            }
        }
    }
    var 
    headline :Record HeadlineT;
}