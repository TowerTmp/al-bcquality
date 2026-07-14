// DotNet HTTP and XML types - none of these compile with "target": "Cloud"
procedure GetExchangeRate(CurrencyCode: Code[10]): Text
var
    WebClient: DotNet WebClient;          // blocked on Cloud target
    Request: DotNet HttpWebRequest;       // blocked on Cloud target
    ResponseText: Text;
begin
    WebClient := WebClient.WebClient();
    ResponseText := WebClient.DownloadString(
        StrSubstNo('https://api.example.com/rates/%1', CurrencyCode));
    exit(ResponseText);
end;

// DotNet XmlDocument likewise fails the Cloud build - use the AL XmlDocument data type instead
procedure ParseRate(ResponseText: Text): Decimal
var
    XmlDoc: DotNet XmlDocument;            // blocked on Cloud target
begin
    XmlDoc := XmlDoc.XmlDocument();
    XmlDoc.LoadXml(ResponseText);
    exit(0);
end;
