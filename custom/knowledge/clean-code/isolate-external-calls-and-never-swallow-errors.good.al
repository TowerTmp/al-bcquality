[TryFunction]
local procedure TryCallExternalApi(var ResponseText: Text)
var
    Client: HttpClient;
    Response: HttpResponseMessage;
begin
    Client.Get('https://api.example.com/credit', Response);
    Response.Content.ReadAs(ResponseText);
end;

procedure ProcessApiCall()
var
    ResponseText: Text;
begin
    if not TryCallExternalApi(ResponseText) then begin
        Session.LogMessage('ENR-0001', GetLastErrorText(), Verbosity::Error,
            DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, 'category', 'creditapi');
        exit; // surfaced, then stop - not silently ignored
    end;
    ProcessResponse(ResponseText);
end;
