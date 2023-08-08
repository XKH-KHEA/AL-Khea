table 60004 PRT
{
    Caption ='PRT';
    fields 
    {
        field(1;"No.";Code[20])
        {
            Caption ='No.';
              trigger OnValidate();
          var
          MarketingSetup : Record 5079;
          NoSeriesManagement:Codeunit NoSeriesManagement;
          begin
            if "No." <> xRec."No." then 
            begin
                MarketingSetup.Get();
                NoSeriesManagement.TestManual(MarketingSetup."Purchase Nos.");
                "No. Series" :='';
            end;
          end;
        }
        field(10;"No. Series";Code[20])
        {
            Caption='No. Series';
            TableRelation = "No. Series";
        }
        field(2;"PR Type";Option)
        {
            Caption ='PR Type';
            OptionCaption = ',Technical,Comercial';
            OptionMembers ="",Technical,Comercial;
        }
        field(3;"PR Description";Blob)
        {
            Caption='PR Description';
        }
        field (4;"Customer No.";Code[20])
        {
            Caption ='Customer No.';
            TableRelation =Customer;
            trigger OnValidate()
            var Customer :Record 18;
            begin
                Customer.get("Customer No.");
                "Customer Name" :=Customer.Name;
                "Customer Phone" := Customer."Phone No.";
            end;
        }
        field (5;"Customer Name";text[50])
        {
            Caption ='Customer Name';
        }
        field (6;"Customer Phone";Text[30])
        {
            Caption ='Customer phone';
        }
        field (7;"PR date";Date)
        {
            Caption= 'Date';
        }
        field(8;"SalesPerson Code";Code[10])
        {
            Caption ='SalesPerson Codde';
            TableRelation = "Salesperson/Purchaser";
        }
        field(9;"Status";Option)
        {
            DataClassification =ToBeClassified;
            Caption ='Status';
            OptionMembers= Open,"Pending Approval",Released;
            OptionCaption ='Open,Pending Approval,Released';
        }
    }
       keys
       {
        key(PK;"No.")
        {        
        }
       }
    trigger OnInsert()
    var 
    MarketingSetup: Record 5079;
    NoSeriesManagement :Codeunit NoSeriesManagement;
    begin
        if "No." = '' then
        begin
            MarketingSetup.Get();
            MarketingSetup.TestField("Purchase Nos.");
            NoSeriesManagement.InitSeries(MarketingSetup."Purchase Nos.",xRec."No. Series",0D,"No.","No. Series");
        end;
    end;
    trigger OnModify()
    begin   

    end;
    trigger OnDelete()
    begin

    end;
    trigger OnRename()
    begin
        
    end;
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
       procedure SetPRDescription(newPRDescription :Text)
       var 
#pragma warning disable AL0433
       TempBlob: Record 60001 temporary;
#pragma warning restore AL0433
       begin
        Clear("PR Description");
        If newPRDescription = '' then
        exit;
        TempBlob.Blob:="PR Description";
        TempBlob.WriteAsText(newPRDescription,TextEncoding::Windows);
        "PR Description" := TempBlob.Blob;
        Modify();
       end;
       procedure GetPRDescription():Text 
       Var 
       CR:Text  [2];
#pragma warning disable AL0433
       TempBlob:Record 60001 temporary;
#pragma warning restore AL0433
       begin
        CalcFields("PR Description");
        if not "PR Description".HasValue() then 
        exit('');
        CR[1]:=10;
        TempBlob.Blob :="PR Description";
        exit(TempBlob.ReadAsText(CR,TextEncoding::Windows));
       end;

}
