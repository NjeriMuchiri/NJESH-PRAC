tableextension 50101 SalesSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Booking Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
    }
    
    keys
    {
        // Add changes to keys here
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
}
table 50104 Booking
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Booking No."; code[10])
        {
            Editable = false;
            trigger OnValidate()
            begin
                if "Booking No." <> xRec."Booking No." then begin
                      SalesSetup.Get();
                      NoSeriesMgt.TestManual(SalesSetup."Booking Nos.");
                      "No. Series" := '';
                end;
            end;
        }
        field(2; "Customer"; code[20]){TableRelation=Customer;}
        field(3; "Customer Name"; text[100])
        {
            Editable = false;
        }
        field(4; "DateTime Created"; DateTime)
        {
            Editable = false;
        }
        field(5; "Created By"; code[20]){DataClassification = ToBeClassified;}
        field(6; "No. Series"; code[10]){TableRelation = "No. Series";}
        field(7; "Amount"; Decimal){ }
        field(8; "Status"; option)
        {
            OptionMembers =  Open, Pending, Approved, Rejected, Posted;
        }        
    }
    
    keys
    {
        key(Key1; "Booking No.")
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    
    trigger OnInsert()
    begin
        
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
    
}