page 50111 HeadlineDaTa
{
    Caption = 'HeadlineDaTa';
    PageType = List;
    CardPageId = 50108;
    SourceTable = HeadlineT;
    ModifyAllowed = false;
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(content)
        {

            repeater(General)
            {

                field("No."; Rec."No.")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the headline no. field.';
                }
                field("Id."; Rec."Id.")
                {
                    ApplicationArea = all;
                    Caption = 'Id.';
                }
                field(Caption; Rec.Caption)
                {
                    ApplicationArea = All;
                }
                field(Page; Rec."Page ID")
                {
                    ApplicationArea = All;
                }
                field("headline Text"; Rec."headline Text")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the headline Text field.';
                }
                field("headline hyperlink"; Rec."headline hyperlink")
                {
                    Caption = 'headline hyperlink';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the headline hyperlink field.';
                }
                field("start date"; Rec."start date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the start date field.';
                }
                field("end date"; Rec."end date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the end date field.';
                }
            }
        }
    }
    actions
    {

        area(Processing)
        {
            action(filter)
            {
                ApplicationArea = all;
                Caption = 'filter';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(headline);
                    Message('Filtter =%1,count=%2', headline.GetFilters(), headline.Count());
                    headline.FindFirst();
                    headline.Mark(true);
                    headline.Next();
                    headline.Mark(true);
                    headline.MarkedOnly(true);
                    // headline.run();
                end;
            }
        }
    }
    var
        headline: Record HeadlineT;
}
