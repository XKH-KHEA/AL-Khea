page 60003 PRL
{
    Caption = 'PRL';
    PageType = List;
    CardPageId = PRC;
    SourceTable = PRT;
    ApplicationArea = all;
    UsageCategory = Lists;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    Caption = 'No.';
                }
                field("PR Type"; Rec."PR Type")
                {
                    ApplicationArea = all;
                    Caption = 'PR Type';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = all;
                    Caption = 'Customer Name';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = all;
                    Caption = 'Customer No."';
                }
                field("Customer Phone"; Rec."Customer Phone")
                {
                    ApplicationArea = all;
                    Caption = 'Customer Phone';
                }
                field("PRDescription"; Rec."PR Description")
                {
                    ApplicationArea = all;
                    Caption = 'PRDescription';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    Caption = 'Status';
                }
                field("PR date"; Rec."PR date")
                {
                    ApplicationArea = all;
                    Caption = 'PR date';
                }
                field("SalesPerson Code"; Rec."SalesPerson Code")
                {
                    ApplicationArea = all;
                    Caption = 'SalesPerson Code';
                }
            }
        }
    }

}
