// Raw HttpClient in a business codeunit - coupled to the API, unmockable, auth duplicated.
codeunit 50120 "CDV Order Processing"
{
    procedure Process(var Order: Record "Sales Header")
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
    begin
        Client.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + GetTokenSomehow());
        Client.Get('https://api.example.com/balance/' + Order."Sell-to Customer No.", Response);
        // status codes and JSON parsing leak straight into business logic
    end;
}
