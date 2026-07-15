---
bc-version: [14..]
domain: architecture
keywords: [external-api, httpclient, facade, integration, interface, retry, gateway]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Route every external integration through one facade codeunit

## Description

All calls to an external system should go through a single dedicated **integration facade** codeunit that exposes business-language methods (`GetCustomerBalance`, `SyncOrder`) and hides the `HttpClient`, authentication, retry/backoff, and error translation inside. Scattering raw `HttpClient` calls through business logic couples the whole app to the API's wire shape, spreads auth/error handling everywhere, and makes failures and testing unmanageable. Back the facade with an interface so the HTTP layer can be substituted with a mock in tests.

## Best Practice

One gateway codeunit per external system: business methods out, technical detail in (token caching, retry with backoff, translating transport errors into business-meaningful messages). Expose it through an interface for test substitution, and read URLs/keys from setup or secure storage - never hardcoded.

See sample: `wrap-external-integrations-behind-a-facade.good.al`.

## Anti Pattern

`HttpClient` calls sprinkled across business codeunits, with raw HTTP status codes surfacing in business logic. Detection signal: `HttpClient`/`HttpRequestMessage` used outside a dedicated integration codeunit, or several call sites each building their own request to the same API.

See sample: `wrap-external-integrations-behind-a-facade.bad.al`.
