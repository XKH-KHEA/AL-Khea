page 50119 "HeadlinePage"
{
    PageType = HeadlinePart;
    SourceTable = HeadlineT;
    ApplicationArea = all;
    UsageCategory = Lists;
    Caption = 'HeadlinePage';
    layout
    {
        area(content)
        {
            group(Control10)
            {
                field("Good"; StrSubstNo(Good.GetGreetingText()))
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    // trigger OnDrillDown()
                    // begin
                    //     Page.Run(Rec."Page ID");
                    // end;
                }

            }
            group(Control1)
            {
                field("headline Text"; StrSubstNo(Rec.Caption, GetSOData))
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    trigger OnDrillDown()
                    begin
                        Page.Run(Rec."Page ID");
                    end;
                }

            }
            group(control3)
            {
                ShowCaption = false;
                field(Customer; StrSubstNo(Rec."headline hyperlink", GetCustomer, Rec."headline Text"))
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    trigger OnDrillDown()
                    begin
                        Page.Run(22);
                    end;
                }
                group(ew)
                {
                    field(balanes; StrSubstNo(gg, GetNoactiveUser()))
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = false;
                        DrillDown = true;
                        trigger OnDrillDown()
                        begin
                            Page.Run(Page::"Concurrent Session List");
                        end;
                    }
                }
            }
            group(control2)
            {
                field("headlineText"; Good.GetGreetingText())
                {

                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    trigger OnDrillDown()
                    begin
                        Page.Run(50108);
                    end;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        //filterDate();
        filters(time);
        // Day1();
        // Day2();
        // Day3();
        // Day4();
        Good.HeadlineOnOpenPage(Page::"HeadlinePage");
        DocumentationText2 := 'Do you want to <emphasize>Change Headline?</emphasize>';
    end;

    local procedure GetNoactiveUser(): Integer
    var
        Activetion: Record "Active Session";
    begin
        Activetion.Reset();
        Activetion.SetRange("Client Type", Activetion."Client Type"::"Web Client");
        exit(Activetion.Count());
    end;

    procedure GetSOData() Amount: Decimal
    begin
        SOTTable.CalcSums("Unit Price");
        Amount := SOTTable."Unit Price";
    end;

    procedure GetCustomer() Amounts: Text
    var
        ss: text;
    begin
        SaleInQr.CalcSums("Currency Factor");
        Amounts := Format(SaleInQr."Currency Factor", 10);
        // ss := '>'+Format(Amounts,40)+'<';
    end;

    local procedure SetFilterForCalcSalesThisMonthAmount(CustLedgerEntry: Record "Cust. Ledger Entry"; CalledFromWebService: Boolean)
    begin
        Error('Procedure SetFilterForCalcSalesThisMonthAmount not implemented.');
    end;

    procedure Day1(): Date
    var
        Date1: Date;
    begin
        Rec.SetFilter("start date", '< %1', WorkDate());
        Date1 := Rec."start date";
        Message(Format(Date1));
    end;

    procedure Day2(): Date
    var
        Date1: Date;
    begin
        Rec.FindFirst();
        Date1 := Rec."end date";
        Message(Format(Date1));
    end;

    procedure Day3(): Date
    var
        Date1: Date;
    begin
        Rec.FindLast();
        Date1 := Rec."start date";
        Message(Format(Date1));
    end;

    procedure Day4(): Date
    var
        Date1: Date;
    begin
        Rec.FindLast();
        Date1 := Rec."end date";
        Message(Format(Date1));
    end;

    procedure filterDate(): Text
    var

        Day5: Date;
        Day6: Date;
        Day7: Date;
        Day8: Date;
    begin
        Day5 := Rec."start date";
        Day7 := Rec."start date";
        Day6 := Rec."end date";
        Day8 := Rec."end date";
        case System.Today of
            Day1 .. Day2:
                Rec.SetFilter("Id.", '1');
            Day3 .. Day4:
                Rec.SetFilter("Id.", '2');
        // Day5 .. Day6:
        //     Rec.SetFilter("Id.", '3');
        // Day7 .. Day8:
        //     Rec.SetFilter("Id.", '4');
        end;
    end;

    procedure filters(CurrentTimeOfDay: time): Text
    var
        test: text;
    begin
        case CurrentTimeOfDay of
            000000T .. 105959T:
                Rec.SetFilter("Id.", '1');
            110000T .. 135959T:
                Rec.SetFilter("Id.", '2');
            140000T .. 185959T:
                Rec.SetFilter("Id.", '3');
            190000T .. 235959T:
                Rec.SetFilter("Id.", '4');
        end;
    end;

    var
        DocumentationText2: text;
        headlinrText: Label '<qualifier>Ok!</qualifier><payload>The site <emphasize>%1</emphasize></payload>';
        // headlineTable: Page 50124;
        [InDataSet]
        HeadlineLink: Text;
        SaleInQr: Record "Sales Temp";
        User: Record User;
        balanes: Label '<qualifier>new!</qualifier><payload>The first item is <emphasize>%1</emphasize></payload>';
        gg: Label 'Web Client <emphasize>%1</emphasize>';
        Good: Codeunit "RC Headlines Page Common";
        SOTTable: Record "SO Import Buffer";
}