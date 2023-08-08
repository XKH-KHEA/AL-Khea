Codeunit  60014 "Approval Mgmt. Ext"
{
    
     procedure CheckPurchaseApprovalsWorkEnable(var Purchased:Record PRT):Boolean
    begin
        if NOT IsPurchaseApprovalsWorkflowEnable(Purchased) then
        Error(NoWorkflowEnabledErr);
        exit (true);
    end;
    procedure IsPurchaseApprovalsWorkflowEnable(var Purchase: Record "PRT"):Boolean
    begin
        if Purchase.Status <> Purchase.Status ::Open then
        EXit (WorkflowManagement.CanExecuteWorkflow(Purchase,WorkflowEvenHandlingCust.RunWorkflowOnSendPuchaseForApprovalcode));
    end;

    [EventSubscriber(ObjectType:: Codeunit, Codeunit ::"Approvals Mgmt.",'OnPopulateApprovalEntryArgument','',true,true )]
    local procedure OnPopulateApprovalEntryArguments(var RecRef :RecordRef;var ApprovalEntryArgument:Record "Approval Entry";
    WorkflowStepInstance: Record "Workflow Step Instance")
    var 
      purchase: record "PRT";
    begin
        case RecRef.NUMBER of
        Database::PRT:
        begin
            RecRef.SetTable(purchase);
            ApprovalEntryArgument."Document No." := purchase."No.";
        end;
        end;
    end;
    var
        WorkflowManagement:Codeunit 1501;
        WorkflowEvenHandlingCust: Codeunit 60008;
        NoWorkflowEnabledErr: Label 'No approval workflow for this record type is enabled.';
        UserIdNotInSetupErr: Label 'User ID %1 does not exist in the Approval User Setup window.', Comment = 'User ID NAVUser does not exist in the Approval User Setup window.';
        ApproverUserIdNotInSetupErr: Label 'You must set up an approver for user ID %1 in the Approval User Setup window.', Comment = 'You must set up an approver for user ID NAVUser in the Approval User Setup window.';
        WFUserGroupNotInSetupErr: Label 'The workflow user group member with user ID %1 does not exist in the Approval User Setup window.', Comment = 'The workflow user group member with user ID NAVUser does not exist in the Approval User Setup window.';
        SubstituteNotFoundErr: Label 'There is no substitute, direct approver, or approval administrator for user ID %1 in the Approval User Setup window.', Comment = 'There is no substitute for user ID NAVUser in the Approval User Setup window.';
        NoSuitableApproverFoundErr: Label 'No qualified approver was found.';
        DelegateOnlyOpenRequestsErr: Label 'You can only delegate open approval requests.';
        ApproveOnlyOpenRequestsErr: Label 'You can only approve open approval requests.';
        RejectOnlyOpenRequestsErr: Label 'You can only reject open approval entries.';
        ApprovalsDelegatedMsg: Label 'The selected approval requests have been delegated.';
        NoReqToApproveErr: Label 'There is no approval request to approve.';
        NoReqToRejectErr: Label 'There is no approval request to reject.';
        NoReqToDelegateErr: Label 'There is no approval request to delegate.';
        PendingApprovalMsg: Label 'An approval request has been sent.';
    trigger OnRun()
    begin

    end;
    [IntegrationEvent(false,false)]
    procedure OnSendPRForApproval(Var PRT :Record PRT)
    begin

    end;
     [IntegrationEvent(false,false)]
    procedure OnCanCelPRForApproval(Var PRT :Record PRT)
    begin
        
    end;
     procedure ApproveRecordApprovalRequest(RecordID: RecordID)
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        if not FindOpenApprovalEntryForCurrUser(ApprovalEntry, RecordID) then
            Error(NoReqToApproveErr);

        ApprovalEntry.SetRecFilter;
        ApproveApprovalRequests(ApprovalEntry);
    end;
     procedure ApproveApprovalRequests(var ApprovalEntry: Record "Approval Entry")
    var
        ApprovalEntryToUpdate: Record "Approval Entry";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeApproveApprovalRequests(ApprovalEntry, IsHandled);
        if IsHandled then
            exit;

        if ApprovalEntry.FindSet() then
            repeat
                ApprovalEntryToUpdate := ApprovalEntry;
                ApproveSelectedApprovalRequest(ApprovalEntryToUpdate);
            until ApprovalEntry.Next() = 0;
    end;
       local procedure OnBeforeApproveApprovalRequests(var ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)
    begin
    end;
    
    local procedure ApproveSelectedApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeApproveSelectedApprovalRequest(ApprovalEntry, IsHandled);
        if IsHandled then
            exit;
        CheckOpenStatus(ApprovalEntry, "Approval Action"::Approve, ApproveOnlyOpenRequestsErr);

        if ApprovalEntry."Approver ID" <> UserId then
            CheckUserAsApprovalAdministrator(ApprovalEntry);

        ApprovalEntry.Validate(Status, ApprovalEntry.Status::Approved);
        ApprovalEntry.Modify(true);
        OnApproveApprovalRequest(ApprovalEntry);
    end;
       local procedure CheckOpenStatus(ApprovalEntry: Record "Approval Entry"; ApprovalAction: Enum "Approval Action"; ErrorMessage: Text)
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCheckStatus(ApprovalEntry, ApprovalAction, IsHandled);
        if IsHandled then
            exit;

        if ApprovalEntry.Status <> ApprovalEntry.Status::Open then
            Error(ErrorMessage);
    end;
       local procedure OnBeforeCheckStatus(var ApprovalEntry: Record "Approval Entry"; ApprovalAction: Enum "Approval Action"; var IsHandled: Boolean)
    begin
    end;
    local procedure OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    begin
    end;

     local procedure OnBeforeApproveSelectedApprovalRequest(var ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)
    begin
    end;
      procedure FindOpenApprovalEntryForCurrUser(var ApprovalEntry: Record "Approval Entry"; RecordID: RecordID): Boolean
    begin
        ApprovalEntry.SetRange("Table ID", RecordID.TableNo);
        ApprovalEntry.SetRange("Record ID to Approve", RecordID);
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
        ApprovalEntry.SetRange("Approver ID", UserId);
        ApprovalEntry.SetRange("Related to Change", false);
        OnFindOpenApprovalEntryForCurrUserOnAfterApprovalEntrySetFilters(ApprovalEntry);

        exit(ApprovalEntry.FindFirst);
    end;
     local procedure OnFindOpenApprovalEntryForCurrUserOnAfterApprovalEntrySetFilters(var ApprovalEntry: Record "Approval Entry")
    begin
    end;
     local procedure CheckUserAsApprovalAdministrator(ApprovalEntry: Record "Approval Entry")
    var
        UserSetup: Record "User Setup";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCheckUserAsApprovalAdministrator(ApprovalEntry, IsHandled);
        if IsHandled then
            exit;

        UserSetup.Get(UserId);
        UserSetup.TestField("Approval Administrator");
    end;
       local procedure OnBeforeCheckUserAsApprovalAdministrator(ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)
    begin
    end;
}