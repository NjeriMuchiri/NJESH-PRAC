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
        field(2; "Customer"; code[20])
        {
            TableRelation=Customer;
            trigger OnValidate()
            var
            Cust: Record Customer;
            begin
                Cust.get(Customer);
                "Customer Name" := Cust.Name;
            end;
        }
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
        if "Booking No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Booking Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Booking Nos.", xRec."No. Series", 0D, "Booking No.", "No. Series");
        end;
        "Created By" := UserId;
        "DateTime Created" := CurrentDateTime;
        
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
enumextension 50102 ResourceTypeExt extends "Resource Type"
{
    value(50100; Room)
    {
    }
}
table 50103 BookingLine
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;LineNo; Integer)
        {
            Editable = false;
        }
          field(2;BookingNo; code[10])
        {
            Editable = false;
        }
           field(3; HouseNo; code[20])
        {
            TableRelation = Resource where (Type = const(Room));
            ValidateTableRelation = true;
            trigger OnValidate()
            var
               Room: Record Resource;
            begin
                Room.Get(HouseNo);
                Room.TestField(Name);
                Room.TestField("Unit Price");
                HouseName := Room.Name;
                CostPerUnit := Room."Unit Price";
            end;
        }
           field(4; HouseName; Text[100])
        {
            Editable = false;
        }
           field(5; CostPerUnit; Decimal)
        {
            Editable = false;
        }
           field(6; LineTotal; Decimal)
           {
            Editable = false;
           }
    }
    
    keys
    {
        key(pk; BookingNo, LineNo)
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
    
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