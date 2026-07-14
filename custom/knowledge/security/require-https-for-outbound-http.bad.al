// No scheme check - an http:// endpoint is sent unencrypted
procedure CallApi(Endpoint: Text): Text
var
    Client: HttpClient;
    Response: HttpResponseMessage;
    ResponseText: Text;
begin
    Client.Get(Endpoint, Response);
    Response.Content.ReadAs(ResponseText);
    exit(ResponseText);
end;

// Posting a payload to an unvalidated, configuration-driven URL
procedure PushPayload(CallbackUrl: Text; Payload: Text)
var
    Client: HttpClient;
    Content: HttpContent;
    Response: HttpResponseMessage;
begin
    Content.WriteFrom(Payload);
    Client.Post(CallbackUrl, Content, Response);
end;
