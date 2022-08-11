# dp-videresending

Videresender ting.

## Verdt å vite

- Query string blir alltid med videre
- Redirects er 301 Moved Permanently

## Konfigurasjon

Konfigueres via miljøvariabelen `REDIRECTS`. Den skal være ett array med objekter med en eller flere krav til URL og
`target` for hvor trafikken skal sendes.

Støtter matching på `hostname`, `method` i tillegg til alt annet
som [URLPatterns](https://developer.mozilla.org/en-US/docs/Web/API/URLPattern) støtter.

### Eksempel
```
[
  {
    hostname: "hostname.com",
    method: "GET",
    pathname: "/hello/*",
    target: "https://new-host.com/foobar"
  }
]
```