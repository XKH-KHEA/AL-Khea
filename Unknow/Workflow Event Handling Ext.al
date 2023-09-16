codeunit 60008 "Workflow Event Handling Ext"
{
    trigger OnRun()

    begin

    end;

    procedure RunWorkflowOnSendPuchaseForApprovalcode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendPuchaseForApprovalcode'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendPRForApproval', '', true, true)]
    local procedure RunworkflowOnsendPurchaseForApproval(var PRT: Record PRT)
    begin
        WorkFkowmangemant.HandleEvent(RunWorkflowOnSendPuchaseForApprovalcode, PRT);
    end;

    procedure RunWorkFlowOncancelPurchaseApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkFlowOncancelPurchaseApproval'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCanCelPRForApproval', '', true, true)]
    local procedure RunWorkFlowOncancelPurchaseApproval(var PRT: Record PRT)
    begin
        WorkFkowmangemant.HandleEvent(RunWorkFlowOncancelPurchaseApprovalCode, PRT);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPuchaseForApprovalcode, Database::PRT, PurchaseSendforApprovalEventDesctxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkFlowOncancelPurchaseApprovalCode, Database::PRT, PuchaseApprovalRequestCancelEventDescTxt, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkFlowOncancelPurchaseApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkFlowOncancelPurchaseApprovalCode, RunWorkflowOnSendPuchaseForApprovalcode);
            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode:
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendPuchaseForApprovalcode);
        end;
    end;

    var
        WorkFkowmangemant: Codeunit 1501;
        WorkflowEventHandling: Codeunit 1520;
#pragma warning disable AL0424
        PurchaseSendforApprovalEventDesctxt: TextConst ENU = 'The Approval of a puchase document is requested';
#pragma warning restore AL0424
#pragma warning disable AL0424
        PuchaseApprovalRequestCancelEventDescTxt: TextConst ENU = 'The Approval of a purchase document is canceleds';
#pragma warning restore AL0424

}