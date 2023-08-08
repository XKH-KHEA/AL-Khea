codeunit 60129 "Workflow Setup Ext"
{
    trigger OnRun()
    begin

    end;

    local procedure InsertClaimApprovalWorkflowTemplate()
    var
        Workflow: Record 1501;
    begin
        WorkflowSetup.InsertWorkflowTemplate(Workflow, PurchaseApprovalWorkflowCodeTxt, PurchaseApprovalWorkfowDescTxt, PurchaseWorkflowCategoryTxt);
        InsertClaimApprovalWorkflowDetails(Workflow);
        WorkflowSetup.MarkWorkflowAsTemplate(Workflow);
    end;

    local procedure InsertClaimApprovalWorkflowDetails(var Workflow: Record 1501)
    var
        WorkflowStepArgument: Record 1523;
        BlankDateFormula: DateFormula;
        WorkflowEventHandlingCust: Codeunit 60008;
        WorkflowResponseHandling: Codeunit 1521;
        Purchase: Record PRT;
    begin
#pragma warning disable AL0432
        WorkflowSetup.PopulateWorkflowStepArgument(WorkflowStepArgument,
#pragma warning restore AL0432
#pragma warning disable AL0603
        WorkflowStepArgument."Approver Type"::Approver, WorkflowStepArgument."Approver Limit Type"::"Direct Approver",
#pragma warning restore AL0603
        0, '', BlankDateFormula, true);

        WorkflowSetup.InsertDocApprovalWorkflowSteps(Workflow,
        BuildClaimTypeCoditions(Purchase.Status::Open),
        WorkflowEventHandlingCust.RunWorkflowOnSendPuchaseForApprovalcode,
        BuildClaimTypeCoditions(Purchase.Status::"Pending Approval"),
        WorkflowEventHandlingCust.RunWorkFlowOncancelPurchaseApprovalCode,
        WorkflowStepArgument,
        true);
    end;

    local procedure BuildClaimTypeCoditions(ApprovalStatus: Integer): Text
    var
        Purchase: Record PRT;
    begin
        Purchase.SetRange(Status, ApprovalStatus);
        exit(StrSubstNo(PurchaseTypeCondTxt, WorkflowSetup.Encode(Purchase.GetView(false))));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAddWorkflowCategoriesToLibrary', '', true, true)]
    local procedure OnAddWorkflowCategoriesToLibrary()
    begin
        WorkFlowSetup.InsertWorkflowCategory(PurchaseWorkflowCategoryDescTxt, PurchaseWorkflowCategoryDescTxt);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAfterInsertApprovalsTableRelations', '', true, true)]
    local procedure OnAfterInsertApprovalsTableRelations()
    var
        ApprovalEntry: Record 454;
    begin
        WorkflowSetup.InsertTableRelation(Database::PRT, 0, Database::"Approval Entry", ApprovalEntry.FieldNo("Record ID to Approve"));

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnInsertWorkflowTemplates', '', true, true)]
    local procedure OnInsertWorkflowTemplates()
    begin
        InsertClaimApprovalWorkflowTemplate();
    end;

    var
        WorkflowSetup: Codeunit 1502;
#pragma warning disable AL0424
        PurchaseWorkflowCategoryTxt: TextConst ENU = 'CDW';
#pragma warning restore AL0424

#pragma warning disable AL0424
        PurchaseWorkflowCategoryDescTxt: TextConst ENU = 'PuchaseKHEA Document';
#pragma warning restore AL0424

#pragma warning disable AL0424
        PurchaseApprovalWorkflowCodeTxt: TextConst ENU = 'CAPW';
#pragma warning restore AL0424

#pragma warning disable AL0424
        PurchaseApprovalWorkfowDescTxt: TextConst ENU = 'PucahaseKHEA Approval Workflow';
#pragma warning restore AL0424

#pragma warning disable AL0424
        PurchaseTypeCondTxt: TextConst ENU = '<?xml version = "1.0" encoding="utf-8" standalone="yes"?><ReportParameters><DataItems><DataItem name="Claim">%1</DataItem></DataItems></ReportParameters>';
#pragma warning restore AL0424

}