tableextension 60005 MarketingSetupExt extends "Marketing Setup"
{
    fields
    {
        field(5777;"Purchase Nos.";Code[10])
        {
            Caption ='Purchase Nos.';
            TableRelation = "No. Series";
        }
    }
}
pageextension 60005 MarketingSetupExt extends "Marketing Setup"
{
    layout {
        addafter("Opportunity Nos.")
        {
            field ("Purchase Nos.";Rec."Purchase Nos.")
            {
                Caption = 'Purchase Nos.';
            }
        }
    }
}