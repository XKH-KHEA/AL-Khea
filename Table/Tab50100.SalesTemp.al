table 50107 "Sales Temp"
{
    Caption = 'Sales Temp';
    DataClassification = ToBeClassified;
    fields
    {
        field(2; "Bill-to Customer No."; Integer)
        {
            Caption = 'Bill-to Customer No.';
            NotBlank = true;
        }
        field(3; "Bill-to Customer Name"; Code[200])
         {
            Caption = 'Bill-to Customer Name';
        }
        field(4; "Document no."; Code[20])
        {
            Caption = 'Document no.';
            NotBlank = true;
            TableRelation = Customer;
        }
        field(5;Type;Enum "Sales Line Type")
        {
            Caption = 'Type';
        }
        field(6; "No."; Text[50])
        {
            Caption = 'No.';
        }
        field(14;Description;text[100])
        {

        }
        field(7; "Quantity"; Decimal)
        {
           Caption='Quantity';
        }
        field(8; "Unit of Measure"; Text[50])
        {
           Caption='Unit of Measure';
        }
        field(9; "Location Code"; Text[30])
        {
            Caption = 'Location Code';
            TableRelation = "Post Code".City;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(10; "Unit Price";Decimal)
        {
            Caption = 'Unit Price';
        }
        field(11; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
        }	
        field(12; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            
        }
        field(13; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
        }

    }
}
