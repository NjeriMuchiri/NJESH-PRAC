report 50108 AgeReport
{
    dataset
    {
        dataitem(Member; "Member")
        {
            fields
            {
                field(Member."Name"; "Name")
                {
                    caption = 'Name';
                    DataItemLink = Member;
                }
                field(Member."DateOfBirth"; "Date of Birth")
                {
                    caption = "Date of Birth";
                    DataItemLink = Member;
                }
                field(AgeCalculation.CalculateAge(Member."Date of Birth"); "Age")
                {
                    dataitemquery(Member)
                    {
                        column(CalculateAge(DateOfBirth); "Age")
                    }
                }
            }
        }
    }
}
