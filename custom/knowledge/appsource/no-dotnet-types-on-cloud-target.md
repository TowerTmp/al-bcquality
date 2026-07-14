---
bc-version: [14..]
domain: appsource
keywords: [cloud, saas, appsource, dotnet, httpclient, target-cloud, dotnet-interop, al-native]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Use AL-native types, not DotNet, on a Cloud target

## Description

AppSource and cloud PTE extensions compile with `"target": "Cloud"`, and the Cloud compiler rejects every `DotNet` variable declaration outright. Code written against `WebClient`, `HttpWebRequest`, `WebRequest`, or `XmlDocument` compiles on-prem but fails to build for the cloud, so it can never ship to AppSource. AL provides managed equivalents for these needs, and they behave identically across environments.

## Best Practice

Reach for AL-native types from the start: `HttpClient`, `HttpRequestMessage`, `HttpResponseMessage`, `HttpHeaders`, and `HttpContent` for HTTP; `JsonObject`/`JsonArray`/`JsonToken` for JSON; `XmlDocument`/`XmlElement` (the AL data types, not the DotNet ones) for XML. These compile cleanly for Cloud and need no `DotNet` declaration or add-in.

See sample: `no-dotnet-types-on-cloud-target.good.al`.

## Anti Pattern

Declaring `DotNet` HTTP or XML types in an extension that targets Cloud, e.g. `Client: DotNet WebClient;` or `Request: DotNet HttpWebRequest;`. Detection signal: any `DotNet` variable declaration in a project whose `app.json` has `"target": "Cloud"` (the build fails), or such usage where the app is intended for AppSource. Replace each DotNet type with its AL-native counterpart.

See sample: `no-dotnet-types-on-cloud-target.bad.al`.
