// AL-native HttpClient - compiles cleanly for "target": "Cloud"
procedure GetExchangeRate(CurrencyCode: Code[10]): Text
var
    Client: HttpClient;
    Request: HttpRequestMessage;
    Response: HttpResponseMessage;
    ResponseText: Text;
begin
    Request.Method := 'GET';
    Request.SetRequestUri(StrSubstNo('https://api.example.com/rates/%1', CurrencyCode));

    if not Client.Send(Request, Response) then
        exit('');
    if not Response.IsSuccessStatusCode() then
        exit('');

    Response.Content.ReadAs(ResponseText);
    exit(ResponseText);
end;

// AL-native JsonObject to read the payload - no DotNet
procedure ExtractRate(ResponseText: Text): Decimal
var
    Payload: JsonObject;
    RateToken: JsonToken;
begin
    if not Payload.ReadFrom(ResponseText) then
        exit(0);
    if Payload.Get('rate', RateToken) then
        exit(RateToken.AsValue().AsDecimal());
    exit(0);
end;
