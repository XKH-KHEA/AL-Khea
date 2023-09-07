query 50101 "Sales Query"
{

    Caption = 'Sales Query';
    OrderBy = Descending(Bill_to_Customer_No_);
    elements
    {
        dataitem(SaleIn_Header; "Sales Invoice Header")
        {
          column(Bill_to_Customer_No_;"Bill-to Customer No.")
          {
     
          }
            column(Currency_Code; "Currency Code")
            {
            }
            column(Bill_to_Name;"Bill-to Name")
            {

            }
            column(Amount_Including_VAT; "Amount Including VAT")
            {
            }
            column(Currency_Factor;"Currency Factor")
            {
                
            }
            dataitem(Sale_Line; "Sales Invoice Line")
            {
                DataItemLink = "Bill-to Customer No." = SaleIn_Header."Bill-to Customer No.",
                "No." = SaleIn_Header."No.";
                column(Document_No_;"Document No.")
                {
                }
                column(Type;Type)
                {
                }
                column(No_;"No.")
                {
                }
                column(Description;Description)
                {
                }
                column(Quantity;Quantity)
                {

                }
                column(Unit_of_Measure;"Unit of Measure")
                {

                }
                column(Location_Code;"Location Code")
                {

                }
                column(Unit_Price;"Unit Price")
                {

                }
                column(Line_Amount;"Line Amount")
                {

                }

            }
        }
    }
}