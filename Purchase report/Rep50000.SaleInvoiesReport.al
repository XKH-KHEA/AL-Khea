report 51000 "Sale Invoies Report"
{
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Sale Invoies Report';
    RDLCLayout = './layouts Report Purchase/MyOrderConf.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem("SalesInvoiceHeader"; "Sales Invoice Header")
        {
            PrintOnlyIfDetail = true;
            RequestFilterHeading = 'Sale Invoies Report';
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Bill-to Contact No.", "Sell-to Customer Name";
            column(No_; "No.")
            { }
            column(BilltoCustomerNo; "Bill-to Customer No.")
            {
            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {

            }
            column(SelltoPhoneNo; "Sell-to Phone No.")
            {
            }

            column(Invoice_Discount_Amount; "Invoice Discount Amount")
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
            column(Salesperson_Code; "Salesperson Code")
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(Payment_Discount__; "Payment Discount %")
            {

            }


        }
        dataitem(Contact; Contact)
        {
            column(Picture; Image)
            { }
            column(Phone_No_; "Phone No.")
            {

            }
            column(E_Mail; "E-Mail")
            {

            }
        }
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            DataItemLink = "Document No." = FIELD("No.");
            DataItemLinkReference = SalesInvoiceHeader;
            DataItemTableView = SORTING("Line No.");
            column(Document_No_; "Document No.")
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
            column(Line_Discount__; "Line Discount %")
            { }
            column(Unit_Price; "Unit Price")
            {

            }
            column(Amount; Amount)
            {

            }
            trigger OnPreDataItem()
            begin
                SetRange("Sales Invoice Line"."No.", fiter);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Option)
                {
                    field(fiter; fiter)
                    {
                        TableRelation = "Sales Invoice Header";
                        ApplicationArea = all;
                        Caption = 'Filter';

                    }
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
    var
        fiter: Code[20];
}
