tableextension 50102 VendorTableExt extends Vendor
{
    fields
    {
        field(50102; "Vendor County"; Enum vendorCounties)
        {
            DataClassification = ToBeClassified;
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