codeunit 60109 "Workflow Response Handling Ext"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        purchase: record PRT;
    begin
        case RecRef.NUMBER of
            Database::PRT:
                begin
                    RecRef.SetTable(purchase);
                    purchase.Status := purchase.Status::Open;
                    purchase.Modify();
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        purchase: record PRT;
    begin
        case RecRef.NUMBER of
            Database::PRT:
                begin
                    RecRef.SetTable(purchase);
                    purchase.Status := purchase.Status::Released;
                    purchase.Modify();
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        purchase: record PRT;
    begin
        case RecRef.NUMBER of
            Database::PRT:
                begin
                    RecRef.SetTable(purchase);
                    purchase.Status := purchase.Status::"Pending Approval";
                    purchase.Modify();
                    IsHandled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowResponeHandling: Codeunit 1521;
        WorkflowEventHandlingCust: Codeunit 60008;
    begin
        case ResponseFunctionName of
            WorkflowResponeHandling.SetStatusToPendingApprovalCode():
                WorkflowResponeHandling.AddResponsePredecessor(WorkflowResponeHandling.SetStatusToPendingApprovalCode,
                WorkflowEventHandlingCust.RunWorkFlowOncancelPurchaseApprovalCode);
            WorkflowResponeHandling.SendApprovalRequestForApprovalCode:
                WorkflowResponeHandling.AddResponsePredecessor(WorkflowResponeHandling.SendApprovalRequestForApprovalCode,
                WorkflowEventHandlingCust.RunWorkflowOnSendPuchaseForApprovalcode);
            WorkflowResponeHandling.OpenDocumentCode:
                WorkflowResponeHandling.AddResponsePredecessor(WorkflowResponeHandling.OpenDocumentCode,
                WorkflowEventHandlingCust.RunWorkFlowOncancelPurchaseApprovalCode);
        end;
    end;
}