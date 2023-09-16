codeunit 60127 "Page Management Ext"
{
    trigger OnRun()
    begin

    end;

    local procedure GetConditionalCardpageID(RecordRef: RecordRef): Integer
    begin
        case RecordRef.Number OF
            DATABASE::PRT:
                exit(Page::PRC);
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnAfterGetPageID', '', true, true)]
    local procedure OnAfterGetPageID(RecordRef: RecordRef; var PageID: Integer)
    begin
        if PageID = 0 then
            PageID := GetConditionalCardpageID(RecordRef);

    end;
}