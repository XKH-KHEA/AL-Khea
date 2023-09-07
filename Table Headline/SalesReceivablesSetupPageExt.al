pageextension 50108 SalesReceivablesSetupPageExt extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Customer Nos.")
        {
            field("Book Nos.";Rec."Book Nos.")
            {
                Caption = 'Headline Nos.';
                ApplicationArea = All;
            }
        }
    }
}