# dp-videresending

Videresender ting med Nginx.

## Konfigurasjon

Du må både legge til ingresser appen skal håndtere og nginx-config for å håndtere redirect-reglene.

1. Legg til ingress i `.nais/[cluster]/ingresses.yaml`
2. Legg til config i `.nais/[cluster]/nginx.conf.d/[ingress].conf`

### Eksempel Nginx-config

Regler for ingresser på samme server må grupperes i en `server` blokk med matchende `server_name`.

```nginx configuration
server {
  listen       8080;
  server_name  www.nav.no;

  location /arbeid/dagpenger/gammel-tjeneste1 {
    return 301 $scheme://www.nav.no/dagpenger/ny-tjeneste1;
  }

  location /arbeid/dagpenger/gammel-tjeneste2 {
    return 301 $scheme://www.nav.no/dagpenger/ny-tjeneste2;
  }
}
```