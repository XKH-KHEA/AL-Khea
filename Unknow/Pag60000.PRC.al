page 60001 PRC
{
    Caption = 'PRC';
    PageType = Document;
    SourceTable = PRT;
    PromotedActionCategories = 'New,Process,Report,Approve,Release,Posting,Prepare,Order,Request Approval,History,Print/Send,Navigate';
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    Caption = 'No.';
                }
                field("PR Type"; Rec."PR Type")
                {
                    ApplicationArea = all;
                    Caption = 'PR Type';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = all;
                    Caption = 'Customer Name';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = all;
                    Caption = 'Customer No."';
                }
                field("Customer Phone"; Rec."Customer Phone")
                {
                    ApplicationArea = all;
                    Caption = 'Customer Phone';
                }
                field("PRDescription"; Rec."PR Description")
                {
                    ApplicationArea = all;
                    Caption = 'PRDescription';
                }
                field("PR date"; Rec."PR date")
                {
                    ApplicationArea = all;
                    Caption = 'PR date';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Suite;
                    Importance = Promoted;
                    StyleExpr = StatusStyleTxt;
                    QuickEntry = false;
                    Caption = 'Status';
                }
                field("SalesPerson Code"; Rec."SalesPerson Code")
                {
                    ApplicationArea = all;
                    Caption = 'SalesPerson Code';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                // action(ActionName)
                // {
                //     ApplicationArea = all;
                //     Visible = OpenApprovalEntriesExistForCurrUser;
                //     Image = Approval;
                //     Promoted = true;
                //     Caption = 'Send A&pproval Request';
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;
                //     PromotedOnly = true;
                //     trigger OnAction()
                //     begin
                //         ApprovalsMgmt.ApproveRecordApprovalRequest(RecordID);
                //     end;

                // }
            }
            group(Appoval)
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if ApprovalsMgmtCut.CheckPurchaseApprovalsWorkEnable(Rec) then
                            ApprovalsMgmtCut.OnSendPRForApproval(Rec);
                    end;
                }
                // action("Send A&ppoval Request")
                // {
                //     ApplicationArea = Basic, Suite;
                //    // Visible = not OpenApprovalEntriesExist And CanCancelApprovalForFlow;
                //     Image = SendApprovalRequest;
                //     Caption = 'Approvals';
                //     Promoted = true;
                //     PromotedCategory = Category4;
                //     PromotedOnly = true;
                //     trigger OnAction()
                //     begin
                //         IF ApprovalsMgmtCut.CheckPurchaseApprovalsWorkEnable(Rec) then
                //             ApprovalsMgmtCut.OnSendPRForApproval(Rec);
                //     end;
                // }
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = Basic, Suite;
                    //  Visible = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    Caption = 'Cancel';
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    trigger OnAction()
                    begin
                        ApprovalsMgmtCut.OnCanCelPRForApproval(Rec);
                    end;
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."PR date" := WorkDate();
    end;

    trigger OnAfterGetCurrRecord()
    var
        SalesHeader: Record PRT;
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
        CustCheckCrLimit: Codeunit "Cust-Check Cr. Limit";
    begin
        DynamicEditable := CurrPage.Editable;

        CRMIsCoupledToRecord := CRMIntegrationEnabled;
        if CRMIsCoupledToRecord then
            CRMIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId);
        UpdatePaymentService();
        if CallNotificationCheck then begin
            SalesHeader := Rec;
            CallNotificationCheck := false;
        end;
    end;

    protected procedure UpdatePaymentService()
    var
        PaymentServiceSetup: Record "Payment Service Setup";
    begin
        PaymentServiceVisible := PaymentServiceSetup.IsPaymentServiceVisible;
        PaymentServiceEnabled := PaymentServiceSetup.CanChangePaymentService(Rec);
    end;

    trigger OnAfterGetRecord()
    var
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordID);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordID);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordID, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;

    var
        PaymentServiceEnabled: Boolean;
        CallNotificationCheck: Boolean;
        PaymentServiceVisible: Boolean;
        ShowWorkflowStatus: Boolean;
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
        DynamicEditable: Boolean;
        StatusStyleTxt: Text;
        PurchaseDescription: Text;
        ApprovalsMgmt: Codeunit 1535;
        ApprovalsMgmtCut: Codeunit 60014;
        WorkflowWebhookMgt: Codeunit 1543;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanCancelApprovalForFlow: Boolean;
        CanRequestApprovalForFlow: Boolean;
}
