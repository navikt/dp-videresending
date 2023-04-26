# dev
GET http://arbeid.dev.nav.no:8080/arbeid/dagpenger/kalkulator

HTTP/1.1 301
[Asserts]
header "Location" == "https://nav.no/dagpenger#hvor-mye"


# prod
GET http://www.nav.no:8080/arbeid/dagpenger/kalkulator

HTTP/1.1 301
[Asserts]
header "Location" == "https://nav.no/dagpenger#hvor-mye"
