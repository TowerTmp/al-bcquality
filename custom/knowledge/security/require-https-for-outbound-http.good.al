// Reject non-TLS endpoints before the request leaves the service
procedure CallSecureApi(Endpoint: Text): Text
var
    Client: HttpClient;
    Response: HttpResponseMessage;
    ResponseText: Text;
begin
    if not Endpoint.ToLower().StartsWith('https://') then
        Error('Only HTTPS endpoints are allowed.');

    if Client.Get(Endpoint, Response) then
        Response.Content.ReadAs(ResponseText);
    exit(ResponseText);
end;

// Enforce TLS when the URL is stored, so an insecure value is never persisted
procedure SetServiceUrl(NewUrl: Text)
var
    Setup: Record "Integration Setup";
begin
    if not NewUrl.ToLower().StartsWith('https://') then
        Error('Service URL must use HTTPS.');
    Setup.Get();
    Setup."Service URL" := CopyStr(NewUrl, 1, MaxStrLen(Setup."Service URL"));
    Setup.Modify(true);
end;
