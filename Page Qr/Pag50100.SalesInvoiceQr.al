page 50122 "Sales Invoice Qr"
{
    ApplicationArea = All;
    Caption = 'Sales Invoice Qr';
    PageType = List;
    SourceTable = "Sales Temp";
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';
                }
                field("Bill-to Customer Name"; Rec."Bill-to Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-to Customer Name field.';
                }
                field("Document no."; Rec."Document no.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document no. field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                  field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description;Rec.Description)
                {
                     ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
              
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Factor field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        "Sales In Qr": Query "Sales Query";
    begin
        if "Sales In Qr".Open() then begin
            while "Sales In Qr".Read() do begin
                Rec.Init();
                Rec."Bill-to Customer No." := Rec."Bill-to Customer No." + Rec.Count +1;
                Rec."Bill-to Customer Name" := "Sales In Qr".Bill_to_Name;
                Rec."Document no." := "Sales In Qr".Document_No_;
                Rec."Currency Code" := "Sales In Qr".Currency_Code;
                Rec.Type := "Sales In Qr".Type;           
                Rec."No." := "Sales In Qr".No_;
                Rec.Description := "Sales In Qr".Description;
                Rec.Quantity := "Sales In Qr".Quantity;
                Rec."Unit of Measure" := "Sales In Qr".Unit_of_Measure;
                Rec."Location Code" := "Sales In Qr".Location_Code;
                Rec."Unit Price" :="Sales In Qr" .Unit_Price;
                Rec."Line Amount" :="Sales In Qr".Line_Amount;
                Rec."Currency Code" := "Sales In Qr".Currency_Code;
                Rec."Currency Factor" := "Sales In Qr" .Currency_Factor;
                Rec.Insert();
            end;
            "Sales In Qr".Close();
        end;
    end;
}
