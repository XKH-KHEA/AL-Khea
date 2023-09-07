table 50119 HeadlineT
{
    DataClassification = CustomerContent;
    fields
    {
         field(143; "User Security ID"; Guid)
        {
            Caption = 'User Security ID';
        }
        field(1;"Id.";Integer)
        {
            
        }
        field(13;"Page ID";Integer)
        {
        
        }
        field(12; Caption;Text[250])
        {
            
        }
        field(11; "No."; Code[10])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup."Book Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "headline Text"; Text[200])
        {
           Caption = 'headline Text';
                 
        }
        field(3; "headline hyperlink"; Text[200])
        {
            Caption = 'headline Text';
            DataClassification = CustomerContent;
        }

        field(4; "start date"; Date)
        {
            Caption = 'Start date';
            DataClassification = CustomerContent;
        }
        field(5; "end date"; Date)
        {
            Caption = 'End date';
            DataClassification = CustomerContent;
        }
         field(7; "Due date"; DateTime)
        {
            Caption = 'Due date';
            DataClassification = CustomerContent;
        }
        field(6; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
    begin
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Book Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Book Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;
    
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}