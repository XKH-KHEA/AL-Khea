controladdin ALButton_DSK
{
    RequestedHeight = 60;
    MinimumHeight = 60;
    RequestedWidth =70;
    MinimumWidth = 70;
    VerticalStretch = true;
    HorizontalStretch = true;
    VerticalShrink = true;
    HorizontalShrink = true;
    Scripts =
        'UserControl/ALButtonApp/src/Controls/BaseControl.js',
        'UserControl/ALButtonApp/src/Controls/Button/Button.js',
          'UserControl/Learn/TextBox/Radio.js',
          'UserControl/Learn/Radio.js';
    StyleSheets =
         'UserControl/ALButtonApp/src/Controls/BaseControl.css',
        'UserControl/ALButtonApp/src/Controls/Button/Button.css',
        'UserControl/Learn/TextBox/Radio.css',
    'UserControl/Learn/Radio.css';
    StartupScript =
        'UserControl/ALButtonApp/src/Controls/Button/startup.js';

   // procedure createRadioButton(id:text; caption:text ; value :text);
   // procedure embedHomePage();
    procedure radio();
    procedure TextBox();
    //#region Base Events

    event OnLoad();
      event OnLoads();

    event OnError(message: Text);

    //#endregion

    event OnClick(buttonId: Text);

    procedure SetOption("key": Text; "value": Text);
}