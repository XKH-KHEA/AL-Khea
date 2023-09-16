table 60107 "Sales Temps"
{
    Caption = 'Sales Temp';
    DataClassification = ToBeClassified;
    TableType = Temporary;
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
        field(5; Type; Enum "Sales Line Type")
        {
            Caption = 'Type';
        }
        field(6; "No."; Text[50])
        {
            CaptionClass = GetCaptionClass(FieldNo("No."));
            Caption = 'No.';
            TableRelation = IF (Type = CONST("G/L Account")) "G/L Account"
            ELSE
            IF (Type = CONST(Item)) Item
            ELSE
            IF (Type = CONST(Resource)) Resource
            ELSE
            IF (Type = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF (Type = CONST("Charge (Item)")) "Item Charge";
        }
        field(14; Description; text[100])
        {

        }
        field(7; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(8; "Unit of Measure"; Text[50])
        {
            Caption = 'Unit of Measure';
        }
        field(9; "Location Code"; Text[30])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
        }
        field(10; "Unit Price"; Decimal)
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
            Editable = false;
            TableRelation = Currency;

        }
        field(13; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            MinValue = 0;
        }
    }
    procedure GetCaptionClass(FieldNumber: Integer): Text[80]
    begin
        GetHeader;
        case FieldNumber of
            FieldNo("No."):
                exit(StrSubstNo('3,%1', GetFieldCaption(FieldNumber)));
            else begin
                if SalesInvoiceHeader."Prices Including VAT" then
                    exit('2,1,' + GetFieldCaption(FieldNumber));
                exit('2,0,' + GetFieldCaption(FieldNumber));
            end
        end;
    end;

    local procedure GetFieldCaption(FieldNumber: Integer): Text[100]
    var
        "Field": Record "Field";
    begin
        Field.Get(DATABASE::"Sales Invoice Line", FieldNumber);
        exit(Field."Field Caption");
    end;

    local procedure GetHeader()
    begin
        if SalesInvoiceHeader."No." = "Document No." then
            exit;
        if not SalesInvoiceHeader.Get("Document No.") then
            SalesInvoiceHeader.Init();

        if SalesInvoiceHeader."Currency Code" = '' then
            Currency.InitRoundingPrecision
        else
            if not Currency.Get(SalesInvoiceHeader."Currency Code") then
                Currency.InitRoundingPrecision;
    end;

    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        Currency: Record Currency;
}
