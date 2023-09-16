// https://dev.azure.com/businesscentralapps/HelloWorld

codeunit 50104 "ALButtonTestInstaller_DSK"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        
    end;
    // var
    //     ALTestSuite: Record "AL Test Suite";
    //     TestSuiteMgt: Codeunit "Test Suite Mgt.";
    //     SuiteName: Code[10];
    // begin
    //     SuiteName := 'DEFAULT';
    //     if ALTestSuite.Get(SuiteName) then
    //         ALTestSuite.DELETE(true);

    //     TestSuiteMgt.CreateTestSuite(SuiteName);
    //     Commit();
    //     ALTestSuite.Get(SuiteName);
    //     TestSuiteMgt.SelectTestMethodsByRange(ALTestSuite, '50100..50149');
    // end;
}