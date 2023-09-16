page 50066 DataStore
{
    ApplicationArea =all;
    UsageCategory = Lists;
    SourceTable = CardItem;
    Caption = 'DataStore';
    CardPageId = 50066;
    PageType = List;
    layout
    {
        area(Content)
        {
            repeater(General)
            {

            field(ItemDs;Rec.ItemDs)
             {
                ApplicationArea =all;
             }
             field(Desction;Rec.Desction)
             {
                ApplicationArea =all;
             }
            }
        }
    }
}