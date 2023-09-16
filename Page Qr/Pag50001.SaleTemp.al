page 50031 "Sale Temp."
{
    Caption = 'Sale Temp.';
    PageType = CardPart;
    SourceTable = "Sales Temp";
    RefreshOnActivate = true;
    layout
    {
        area(content)
        {
            cuegroup("Intelligent Cloud")
            {
                Caption = 'Intelligent Cloud';
                Visible = false;
                ObsoleteReason = 'Intelligent Cloud Insights is discontinued';
                ObsoleteState = Pending;
                ObsoleteTag = '18.0';
                actions
                {
                    action("Learn More")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Learn More';
                        Image = TileInfo;
                        RunPageMode = View;
                        ToolTip = ' Learn more about the Intelligent Cloud and how it can help your business.';
                        Visible = false;
                        ObsoleteReason = 'Intelligent Cloud Insights is discontinued';
                        ObsoleteState = Pending;
                        ObsoleteTag = '18.0';

                        trigger OnAction()
                        var

                        begin
                            Page.Run(50123);
                        end;
                    }
                    action("Intelligent Cloud Insights")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Intelligent Cloud Insights';
                        Image = TileCloud;
                        RunPageMode = View;
                        ToolTip = 'View your Intelligent Cloud insights.';
                        Visible = false;
                        ObsoleteTag = '18.0';
                        ObsoleteReason = 'Intelligent Cloud Insights is discontinued.';
                        ObsoleteState = Pending;

                        trigger OnAction()
                        var

                        begin
                            Page.Run(50113);
                        end;
                    }
                }
            }
            cuegroup(Control36)
            {
                CueGroupLayout = Wide;
                ShowCaption = false;
                field("Currency Factor "; Rec."Currency Factor")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "SO Import Worksheet";
                    ToolTip = 'Specifies the number of purchase invoices where your payment is late.';
                }
                field("Line Amount "; Rec."Line Amount")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "SO Import Worksheet";
                    Image = Cash;
                    ToolTip = 'Specifies the sum of the accounts that have the cash account category.';

                    trigger OnDrillDown()
                    var
                        ActivitiesMgt: Codeunit "Activities Mgt.";
                    begin
                        ActivitiesMgt.DrillDownCalcCashAccountsBalances();
                    end;
                }
                field("Quantity "; Rec.Quantity)
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "SO Import Worksheet";
                    ToolTip = 'Specifies the number of new incoming documents in the company. The documents are filtered by today''s date.';
                }
            }
            cuegroup(General)
            {
                Caption = 'General';

                field("Bill-to Customer Name"; Rec."Bill-to Customer Name")
                {
                    DrillDownPageId = "SO Page";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-to Customer Name field.';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    DrillDownPageId = "SO Page";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    DrillDownPageId = "SO Page";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                    DrillDownPageId = "SO Page";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Factor field.';
                }
                field(Description; Rec.Description)
                {
                    DrillDownPageId = "SO Page";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document no."; Rec."Document no.")
                {
                    DrillDownPageId = "SO Page";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document no. field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    DrillDownPageId = "SO Page";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    DrillDownPageId = "SO Page";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("No."; Rec."No.")
                {
                    DrillDownPageId = "SO Page";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    DrillDownPageId = "SO Page";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Type"; Rec."Type")
                {
                    DrillDownPageId = "SO Page";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    DrillDownPageId = "SO Page";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    DrillDownPageId = "SO Page";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
            }
        }
    }
}
