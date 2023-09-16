report 50013 "Transfer Order Report"
{
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './inventory/TransferOrder.rdl';
    Caption = 'Transfer Order Report(CVH)';
    PreviewMode = PrintLayout;
    dataset
    {
        dataitem("Transfer Header"; "Transfer Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Transfer-from Code", "Transfer-to Code";
            RequestFilterHeading = 'Transfer Order';
            column(No_TransferHdr; "No.")
            {
            }
            column(Transfer_from_Address; "Transfer-from Address")
            { }
            column(Transfer_to_Address; "Transfer-to Address")
            { }
            column(TransferOrderNoCaption; TransferOrderNoCaptionLbl)
            {
            }
            column(Posting_Date; "Posting Date")
            { }
            column(In_Transit_Code; "In-Transit Code")
            { }
            column(Shipment_Date; "Shipment Date")
            { }
            column(picture; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyHomePage; CompanyInfo."Home Page")
            {
            }
            column(CompanyEMail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyBankName; CompanyInfo."Bank Name")
            {
            }
            column(CompanyBankNo; CompanyInfo."Bank Account No.")
            {
            }
            column(CompanyGiroNo; CompanyInfo."Giro No.")
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(CopyCaption; StrSubstNo(Text001, CopyText))
                    {
                    }
                    column(TransferToAddr1; TransferToAddr[1])
                    {
                    }
                    column(TransferFromAddr1; TransferFromAddr[1])
                    {
                    }
                    column(TransferToAddr2; TransferToAddr[2])
                    {
                    }
                    column(TransferFromAddr2; TransferFromAddr[2])
                    {
                    }
                    column(TransferToAddr3; TransferToAddr[3])
                    {
                    }
                    column(TransferFromAddr3; TransferFromAddr[3])
                    {
                    }
                    column(TransferToAddr4; TransferToAddr[4])
                    {
                    }
                    column(TransferFromAddr4; TransferFromAddr[4])
                    {
                    }
                    column(TransferToAddr5; TransferToAddr[5])
                    {
                    }
                    column(TransferToAddr6; TransferToAddr[6])
                    {
                    }
                    column(InTransitCode_TransHdr; "Transfer Header"."In-Transit Code")
                    {
                        IncludeCaption = true;
                    }
                    column(PostingDate_TransHdr; Format("Transfer Header"."Posting Date", 0, 4))
                    {
                    }
                    column(TransferToAddr7; TransferToAddr[7])
                    {
                    }
                    column(TransferToAddr8; TransferToAddr[8])
                    {
                    }
                    column(TransferFromAddr5; TransferFromAddr[5])
                    {
                    }
                    column(TransferFromAddr6; TransferFromAddr[6])
                    {
                    }
                    column(PageCaption; StrSubstNo(Text002, ''))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(ShptMethodDesc; ShipmentMethod.Description)
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Transfer Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(Number_DimensionLoop1; Number)
                        {
                        }
                        column(HdrDimensionsCaption; HdrDimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not DimSetEntry1.FindSet() then
                                    CurrReport.Break();
                            end else
                                if not Continue then
                                    CurrReport.Break();

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 - %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1; %2 - %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimSetEntry1.Next() = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break();
                        end;
                    }
                    dataitem("Transfer Line"; "Transfer Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Transfer Header";
                        DataItemTableView = SORTING("Document No.", "Line No.") WHERE("Derived From Line No." = CONST(0));
                        column(ItemNo_TransLine; "Item No.")
                        {
                            IncludeCaption = true;
                        }
                        column(Desc_TransLine; Description)
                        {
                            IncludeCaption = true;
                        }
                        column(Qty_TransLine; Quantity)
                        {
                            IncludeCaption = true;
                        }
                        column(UOM_TransLine; "Unit of Measure")
                        {
                            IncludeCaption = true;
                        }
                        column(Qty_TransLineShipped; "Quantity Shipped")
                        {
                            IncludeCaption = true;
                        }
                        column(QtyReceived_TransLine; "Quantity Received")
                        {
                            IncludeCaption = true;
                        }
                        column(TransFromBinCode_TransLine; "Transfer-from Bin Code")
                        {
                            IncludeCaption = true;
                        }
                        column(TransToBinCode_TransLine; "Transfer-To Bin Code")
                        {
                            IncludeCaption = true;
                        }
                        column(LineNo_TransLine; "Line No.")
                        {
                        }

                        // column(CompanyRegistrationNumber; CompanyInfo.GetRegistrationNumber)
                        // {
                        // }
                        // column(CompanyRegistrationNumber_Lbl; CompanyInfo.GetRegistrationNumberLbl)
                        // {
                        // }
                        // column(CompanyVATRegNo; CompanyInfo.GetVATRegistrationNumber)
                        // {
                        // }
                        // column(CompanyVATRegNo_Lbl; CompanyInfo.GetVATRegistrationNumberLbl)
                        // {
                        // }
                        // column(CompanyVATRegistrationNo; CompanyInfo.GetVATRegistrationNumber)
                        // {
                        // }
                        // column(CompanyVATRegistrationNo_Lbl; CompanyInfo.GetVATRegistrationNumberLbl)
                        // {
                        // }
                        // column(CompanyLegalOffice; CompanyInfo.GetLegalOffice)
                        // {
                        // }
                        // column(CompanyLegalOffice_Lbl; CompanyInfo.GetLegalOfficeLbl)
                        // {
                        // }
                        // column(CompanyCustomGiro; CompanyInfo.GetCustomGiro)
                        // {
                        // }
                        // column(CompanyCustomGiro_Lbl; CompanyInfo.GetCustomGiroLbl)
                        // {
                        // }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                            column(DimText2; DimText)
                            {
                            }
                            column(Number_DimensionLoop2; Number)
                            {
                            }
                            column(LineDimensionsCaption; LineDimensionsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                CompanyInfo.Get();
                                if Number = 1 then begin
                                    if not DimSetEntry2.FindSet() then
                                        CurrReport.Break();
                                end else
                                    if not Continue then
                                        CurrReport.Break();

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := StrSubstNo('%1 - %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                            '%1; %2 - %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until DimSetEntry2.Next() = 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not ShowInternalInfo then
                                    CurrReport.Break();
                            end;

                        }
                        trigger OnAfterGetRecord()
                        begin
                            DimSetEntry2.SetRange("Dimension Set ID", "Dimension Set ID");
                        end;

                    }
                }

                trigger OnAfterGetRecord()
                begin
                    if Number > 1 then begin
                        CopyText := Text000;
                        OutputNo += 1;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopies) + 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");
                FormatAddr.TransferHeaderTransferFrom(TransferFromAddr, "Transfer Header");
                FormatAddr.TransferHeaderTransferTo(TransferToAddr, "Transfer Header");

                if not ShipmentMethod.Get("Shipment Method Code") then
                    ShipmentMethod.Init();
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Location;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Location;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
        PostingDateCaption = 'Posting Date';
        ShptMethodDescCaption = 'Shipment Method';
    }
    trigger OnInitReport()
    begin
        CompanyInfo.SetAutoCalcFields(Picture);
        CompanyInfo.Get();
        CompanyInfo.VerifyAndSetPaymentInfo;
    end;

    trigger OnPostReport()
    begin
        CompanyInfo.SetAutoCalcFields(Picture);
        CompanyInfo.Get();
        CompanyInfo.VerifyAndSetPaymentInfo;
    end;

    var
        Text000: Label 'COPY';
        Text001: Label 'Transfer Order %1';
        Text002: Label 'Page %1';
        ShipmentMethod: Record "Shipment Method";
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        FormatAddr: Codeunit "Format Address";
        TransferFromAddr: array[8] of Text[100];
        TransferToAddr: array[8] of Text[100];
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        OutputNo: Integer;
        HdrDimensionsCaptionLbl: Label 'Header Dimensions';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        TransferOrderNoCaptionLbl: Label 'Transfer Order No.';
        CompanyInfo: Record "Company Information";
}

