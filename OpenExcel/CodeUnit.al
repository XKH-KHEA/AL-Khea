codeunit 50112 MyCodeunit
{
#pragma warning disable AL0666
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Edit in Excel", 'OnEditInExcel', '', false, false)]
#pragma warning restore AL0666
    local procedure OnEditInExcel();
    begin
        Error('You can not use Edit in Excel!!!');
    end;
}