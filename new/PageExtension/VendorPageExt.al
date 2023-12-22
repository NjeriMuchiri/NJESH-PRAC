pageextension 50102 VendorPageExt extends "Vendor Card"
{
    layout
    {
        addafter(City)
        {
            field("Vendor County"; Rec."Vendor County")
            {
            }
        }
    }
    
    var
        myInt: Integer;
}
