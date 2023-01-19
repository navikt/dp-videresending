GET http://nginx:8080/
Host: dagpenger-regel-ui.nais.preprod.local

HTTP/1.1 301
[Asserts]
header "Location" == "http://dagpenger-regel-ui.dev.intern.nav.no/"
