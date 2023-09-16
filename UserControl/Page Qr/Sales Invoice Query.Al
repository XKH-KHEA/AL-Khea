page 50113 "Sales Invoice Query"
{
    ApplicationArea = All;
    Caption = 'Sales Invoice Query';
    PageType = List;
    SourceTable = "Sales Temp";
    UsageCategory = Lists;
    CardPageId = 50133;
    layout
    {
        area(content)
        {         
           
            repeater(General)
            {
                field(Datas;Datas)
                {
                     ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';
                }
                    field ("Bill-to Customer Name";Rec."Bill-to Customer Name")
                    {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document no. field.';
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
                field(Description; Rec.Description)
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
     procedure filters(): Text
    var
        test: text;
    begin       
     rec.SetRange("Bill-to Customer No.",1 ,6);
    end;
    trigger OnAfterGetRecord()
    begin
       Data();
    end;
    trigger OnOpenPage()
    begin
      // filters();
        Data();
    end;
    procedure Data():Text
    begin
         Datas := Rec."Bill-to Customer Name";        
        exit(Datas);
    end;
    var Datas:Text;
}