table 60001 TempBlobs
{
    // ObsoleteState = Removed;
    // ObsoleteReason = 'Replaced by BLOB Storage Module.';
    // ObsoleteTag = '19.0';
    // ReplicateData = false;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            DataClassification = SystemMetadata;
        }
        field(2; Blob; BLOB)
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    internal procedure WriteAsText(newPRDescription: Text; arg: Variant)
    begin
        Error('Procedure WriteAsText not implemented.');
    end;

    internal procedure ReadAsText(CR: Text[2]; arg: Variant): Text
    begin
        Error('Procedure ReadAsText not implemented.');
    end;
}