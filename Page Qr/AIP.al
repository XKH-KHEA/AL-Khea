page 60120 MyCustomerApis
{
    PageType = API;
    Caption = 'My Sales Temp API';
    APIPublisher = 'contoso';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'SalesTemp';
    EntitySetName = 'SalesTemps';
    SourceTable = "Sales Temp";
    DelayedInsert = true;
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("1"; Rec."Bill-to Customer No.")
                {
                    Caption = 'ID';
                }
                field("2"; Rec."Bill-to Customer Name")
                {
                    Caption = 'Name';
                }
            }
        }
    }
}