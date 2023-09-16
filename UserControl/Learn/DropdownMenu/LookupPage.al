page 57113 "Lookup Page"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Sales Temp";
    UsageCategory = Lists;
    Editable = false;
    layout
    {
        area(content)
        {         
           
            repeater(General)
            {
                field("Bill-to Customer Name";Rec."Bill-to Customer Name")
                {
                     ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';
                }
                field("Document no.";Rec."Document no.")
                {
                     ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';
                }
                field("Location Code";Rec."Location Code")
                {
                     ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';
                }
            }
        }
    }
}