controladdin TextBox
{
    RequestedHeight = 30;
    MinimumHeight = 30;
    MinimumWidth = 84;
    VerticalStretch = false;
    HorizontalStretch = true;
    VerticalShrink = true;
    HorizontalShrink = true;
    // HorizontalStretch = true;
    // VerticalStretch = true;
    // MaximumHeight =100;
    // MaximumWidth=100;
    // MinimumHeight=100;
    // MinimumWidth=100;
    // RequestedWidth =100;
    Scripts =
             'UserControl/Learn/TextBox/Radio.js';
    StartupScript ='UserControl/Learn/TextBox/start.js';
    StyleSheets ='UserControl/Learn/TextBox/Radio.css';
    event Onload();
   // procedure createRadioButton(id:text; caption:text ; value :text);
   // procedure embedHomePage();
    procedure radio("id":Text;"caption":Text;"value":Text);
}