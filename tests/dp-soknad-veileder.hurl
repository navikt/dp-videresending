# dev
GET http://arbeid.dev.nav.no:8080/arbeid/dagpenger/soknad-veileder

HTTP/1.1 301
[Asserts]
header "Location" == "https://arbeid.dev.nav.no/dagpenger/dialog/soknad"


# prod
GET http://www.nav.no:8080/arbeid/dagpenger/soknad-veileder

HTTP/1.1 301
[Asserts]
header "Location" == "https://www.nav.no/dagpenger/dialog/soknad"
