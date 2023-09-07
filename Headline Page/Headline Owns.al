page 50123 "Headline Owns"
{
    ApplicationArea = All;
    Caption = 'Headline Owns', Comment = 'Use same translation as ''Profile Description'' (if applicable)';
    PageType = RoleCenter;
    UsageCategory = Lists;

    layout
    {
        area(rolecenter)
        {
          part(Control71; "HeadlinePage")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Controlq; "Sale Temp.")
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }
    actions{
        area(Creation)
        {
            action(newUser)
            {
                Caption='user';
                RunObject=page "User Card";
                ApplicationArea =all;
            }
            action(Newworkflow)
            {
                Caption ='Newworkflow';
                RunObject = page Workflow;
                ApplicationArea=all;
            }
        }
        area(Processing)
        {
            action(Newjournal)
            {
                Caption ='journal';
                RunObject = page "Payment Reconciliation Journal";
                ApplicationArea = all;
            }
        }
        area(Reporting)
        {
             action(GLregister)
            {
                Caption ='GLregister';
                RunObject = Report "Delete Empty G/L Registers";
                ApplicationArea = all;
            }
        }
        area(Sections)
        {
            group("control3")
            {
            Caption ='Users';
            action(User)
            {
                RunObject = page Users;
                ApplicationArea =all;
            }
            action ("User time Registers")
            {
                RunObject =page "User Time Registers";
                ApplicationArea =all;
            }
            action ("SO Page")
            {
                RunObject =page "SO Page";
                ApplicationArea =all;
            }
             action ("Headline Data")
            {
                RunObject =page "HeadlineDaTa";
                ApplicationArea =all;
            }
              action ("Sale in Query")
            {
                RunObject =page "Sales Invoice Qr";
                ApplicationArea =all;
            }
              action ("Sale In Data")
            {
                RunObject =page "Sales Invoice Query";
                ApplicationArea =all;
            }
            }
           
        }
    }
}