report 51003 "Sale Credit Memos Report"
{
    ApplicationArea =all;
    UsageCategory=ReportsAndAnalysis;
    Caption = 'Sale Credit Memos Report';
    RDLCLayout = './layouts Report Purchase/CreditMemos.rdl';  
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
            column(Sell_to_Customer_Name;"Sell-to Customer Name")
            {

            }
            column(Bill_to_Address;"Bill-to Address")
            {}
            column(Quote_No_;"Quote No.")
            {

            }
            column(Shipment_Date;"Shipment Date")
            {

            }
            column(Payment_Terms_Code;"Payment Terms Code")
            {

            }
            column(Payment_Method_Code;"Payment Method Code")
            {

            }
            column(VAT_Registration_No_;"VAT Registration No.")
            {}
            column(Company_Bank_Account_Code;"Company Bank Account Code")
            {

            }
            column(SelltoPhoneNo; "Sell-to Phone No.")
            {
            }
            column(Invoice; Invoice)
            {
            }

            column(SalespersonCode; "Salesperson Code")
            {
            }
            column(DocumentDate; "Document Date")
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
            column(No_;"No.")
            {
                
            }
            column(Description; Description)
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(Unit_of_Measure; "Unit of Measure")
            {

            }
          
            column(Unit_Price; "Unit Price")
            {

            } 
             column(Line_Discount__; "Line Discount %")
            { }
            column (Allow_Invoice_Disc_;"Allow Invoice Disc.")
            {

            }
            column(VAT_Identifier;"VAT Identifier")
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
