# dp-videresending

Videresender ting med Nginx.

## Konfigurasjon

Du må både legge til ingresser appen skal håndtere og nginx-config for å håndtere redirect-reglene.

1. Legg til ingress i `.nais/[cluster]/ingresses.yaml`
2. Legg til config i `.nais/[cluster]/nginx.yaml`

### Eksempel Nginx-config

Regler må gruppes per ingress i en `server` blokk med matchende `server_name`.

```nginx configuration
server {
  listen       8080;
  server_name  app1.dev.intern.nav.no;

  return 301 $scheme://nytt-navn.dev.intern.nav.no$request_uri;
}

server {
  listen       8080;
  server_name  app2.dev.intern.nav.no;

  return 301 $scheme://annet.navn.dev.intern.nav.no$request_uri;
}
```