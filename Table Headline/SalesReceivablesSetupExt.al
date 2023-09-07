tableextension 50108 SalesReceivablesSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50108; "Book Nos."; Code[20])
        {
            Caption = 'Headline Nos.';
            TableRelation = "No. Series";
        }
    }
}