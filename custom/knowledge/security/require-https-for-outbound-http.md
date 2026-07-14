---
bc-version: [14..]
domain: security
keywords: [https, tls, httpclient, outbound-request, endpoint-validation, transport-security]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Require HTTPS for every outbound HttpClient call

## Description

An `HttpClient` request sent to an `http://` endpoint travels unencrypted, so credentials, customer data, and business payloads can be read or altered in transit by anyone on the network path. In a SaaS extension the target endpoint is often configuration-driven, which means a mistyped or tampered `http://` URL silently downgrades the connection. Enforcing TLS on the client side closes that gap before the request leaves the service.

## Best Practice

Before issuing the request, confirm the endpoint uses TLS — check that it starts with `https://` (case-insensitively) and raise an `Error` otherwise. Apply the guard wherever the URL enters the code: on the parameter passed to the call, and when persisting a URL to a setup field, so an insecure value cannot be stored in the first place.

See sample: `require-https-for-outbound-http.good.al`.

## Anti Pattern

Calling `HttpClient.Get(Endpoint, Response)` or `HttpClient.Post(...)` with an endpoint that was never checked for a scheme, so an `http://` URL is accepted and sent in clear text. Detection signal: an `HttpClient.Get`/`Post`/`Send` whose URL argument is a parameter or setup field with no preceding `StartsWith('https://')` (or equivalent scheme) check. Add the TLS guard before the call.

See sample: `require-https-for-outbound-http.bad.al`.
