pageextension 52001 "Payment Journal Ext." extends "Payment Journal"
{
    actions
    {
        addfirst(processing)
        {   
            
            action(Print)
            {
                Caption = 'Print';
                Promoted =true;
                PromotedCategory=Process;
                PromotedIsBig =true;
                PromotedOnly=true;
                ApplicationArea =all;
                Image = Print;
                trigger OnAction()
                var 
                    GenJournalLine : Record "Gen. Journal Line";
                    Khmer : Integer;
                begin
                    GenJournalLine.Reset();
                    GenJournalLine.SetRange("Journal Template Name",Rec."Journal Template Name");
                    GenJournalLine.SetRange("Journal Batch Name",rec."Journal Batch Name");
                    if rec.Find() then
                    Message('%1',GenJournalLine.Count());
                    // CurrPage.SetSelectionFilter(GenJournalLine);
                    // Report.Run(Report::"Standard Sales - Order Conf.", true, true, GenJournalLine);
                end;
                 

            }
        }
    }
    var
     ReportPrint: Codeunit "Test Report-Print";
}
// // pageextension 50105 SalesOrderListExt extends "Sales Order List"
// {
//     actions
//     {
//         addafter("Print Confirmation")
//         {
//             action(PrintSelectedLayout)
//             {
//                 Caption = 'Print Selected Layout';
//                 Ellipsis = true;
//                 Image = Print;
//                 Promoted = true;
//                 PromotedCategory = Category8;
//                 trigger OnAction()
//                 var
//                     ReportLayoutSelection: Record "Report Layout Selection";
//                     SalesHeader: Record "Sales Header";
//                     ZYLayouts: Label 'ZY Test Layout 01,ZY Test Layout 02,ZY Test Layout 03';
//                     Selection: Integer;
//                 begin
//                     SalesHeader.Reset();
//                     CurrPage.SetSelectionFilter(SalesHeader);
//                     Selection := StrMenu(ZYLayouts);
//                     case Selection of
//                         1:
//                             ReportLayoutSelection.SetTempLayoutSelected('1305-000002');
//                         2:
//                             ReportLayoutSelection.SetTempLayoutSelected('1305-000004');
//                         3:
//                             ReportLayoutSelection.SetTempLayoutSelected('1305-000003');
//                         else
//                             exit;
//                     end;
//                     Report.Run(Report::"Standard Sales - Order Conf.", true, true, SalesHeader);
//                 end;
//             }
//         }
//     }
//  }