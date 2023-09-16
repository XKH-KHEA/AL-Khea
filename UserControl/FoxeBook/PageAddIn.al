page 50143 WeatherCardPart
{
    PageType = CardPart;
    // ApplicationArea =all;
    // UsageCategory =Lists;
    SourceTable = "Sales Temp";
    // Editable = false;

    layout
    {
        area(Content)
        {
            usercontrol(Weather; WeatherControlAddIn)
            {
                ApplicationArea = all;
                Visible =true;
                //CurrPage.Weather.GetRadio('True','radio','radio');        
                
            }
            usercontrol(Button; ALButton)
            {
                ApplicationArea = all;
                Visible =true;
                trigger OnLoad()
                begin
                        CurrPage.Button.SetOption('caption', 'Edit');
                        CurrPage.Button.SetOption('title', 'This is a vanilia Javascript Button');
                        CurrPage.Button.SetOption('type', 'Radio');
                end;
            }
           
        }
    }
    trigger OnAfterGetRecord()
    begin
        GetCustomer();
    end;
  
    local procedure GetCustomer()
    var
        CustData: JsonObject;
    begin
        CustData.Add('name', rec."Bill-to Customer Name");
        CustData.Add('city', rec."Location Code");
        CustData.Add('temp', QueryTempOfCity(Rec.Description));
        //CurrPage.Weather.GetRadio('True','radio','radio');
        CurrPage.Weather.GetCustomer(CustData);
    end;

    local procedure QueryTempOfCity(City: text): Text
    var
        httpclient: HttpClient;
        ResponeMessage: HttpResponseMessage;
        JSonToken: JsonToken;
        JsonValue: JsonValue;
        JsonObject: JsonObject;
        JsonText: Text;
        i: Integer;
        temp: Decimal;
        country: Text;
        tmpText: text;
        degree: Char;
    begin
        degree := 0176;
        if not httpclient.Get('http://api.openweathermap.org/data/2.5/weather?q=' + City +
            '&units=metric&APPID=16ea4cf53127aa3baa74d4072381ba62', ResponeMessage) then
            Error('Web service call failed for openweather api');

        // if not ResponeMessage.IsSuccessStatusCode() then
        //     Error('Web service error detail:\Status Code :1% \Description: %2',
        //             ResponeMessage.HttpStatusCode(),
        //             ResponeMessage.ReasonPhrase());

        ResponeMessage.Content().ReadAs(JsonText);
        if not JsonObject.ReadFrom(JsonText) then
            Error('Error... Not an Json object -invalid respone');

        // temp := SelectJSonToken(JsonObject, '$.main.temp').AsValue.AsDecimal();
        // //    country := SelectJSonToken(JsonObject,'$.sys.county').AsValue.AsText();
        //City := GetJSonToken(JsonObject, 'name').AsValue().AsText();

        tmpText := Format(temp) + Format(degree);
        exit(tmpText);


    end;

    // local procedure GetJSonToken(JsonObject: JsonObject; Tokenkey: Text) jsontoken: JsonToken
    // begin
    //     if not JsonObject.Get(Tokenkey, jsontoken) then
    //         Error('Token not found for key :%1' + Tokenkey);
    // end;

    local procedure SelectJSonToken(JsonObject: JsonObject; Path: Text) jsontoken: JsonToken
    begin
        if not JsonObject.SelectToken(Path, jsontoken) then
            Error('Token not found for Path :%1' + Path);
    end;

}