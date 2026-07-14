procedure ProcessApiCall()
var
    ResponseText: Text;
begin
    if not TryCallExternalApi(ResponseText) then begin
        // EMPTY - the failure is swallowed; the user never learns it failed
    end;
    ProcessResponse(ResponseText); // proceeds on empty/invalid data
end;

// Unwrapped external call - a failure aborts the entire transaction
procedure CallExternalApi(): Text
var
    Client: HttpClient;
    Response: HttpResponseMessage;
    ResponseText: Text;
begin
    Client.Get('https://api.example.com/credit', Response);
    Response.Content.ReadAs(ResponseText);
    exit(ResponseText);
end;
