report 51002 "Sale Confirmation Report"
{
    ApplicationArea =all;
    UsageCategory=ReportsAndAnalysis;
    Caption = 'Sale Confirmation Report';
    RDLCLayout = './layouts Report Purchase/Confirmation.rdl';  
    DefaultLayout = RDLC; 
    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
             DataItemTableView = SORTING("Bill-to Customer No.");
             RequestFilterFields ="No.","Bill-to Contact No.","Bill-to Customer No.","Sell-to Customer Name","Sell-to Address";
            column(BilltoCustomerNo; "Bill-to Customer No.")
            {
            }
            column(No_;"No.")
            {}
            column(Sell_to_Customer_Name;"Sell-to Customer Name")
            {

            }
            column(SelltoPhoneNo; "Sell-to Phone No.")
            {
            }
            column(Invoice; Invoice)
            {
            }
            column(ExternalDocumentNo; "External Document No.")
            {
            }
            column(SalespersonCode; "Salesperson Code")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(OrderDate; "Order Date")
            {
            }
            column(BilltoName; "Bill-to Name")
            {
            }
            column(BilltoAddress; "Bill-to Address")
            {
            }
            column(PostingDescription; "Posting Description")
            {
            }
            column(Salesperson_Code;"Salesperson Code")
            {
                
            }
            column (Document_Date;"Document Date")
            {

            }
            column(Payment_Discount__;"Payment Discount %")
            {

            }
        }
        dataitem(Contact;Contact)
        {
            column(Picture;Image)
            {}
            column (Phone_No_;"Phone No.")
            {

            }
            column(E_Mail;"E-Mail")
             {

             }
        }
        dataitem("Sales Line"; "Sales Line")
        {
            RequestFilterFields = "No.";
            column(Description; Description)
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(Unit_of_Measure; "Unit of Measure")
            {

            }
            column(Line_Discount__; "Line Discount %")
            { }
            column(Unit_Price; "Unit Price")
            {

            }
            column(Amount; Amount)
            {

            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
