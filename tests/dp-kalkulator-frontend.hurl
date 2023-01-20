# dev
GET http://arbeid.dev.nav.no:8080/arbeid/dagpenger/kalkulator

HTTP/1.1 301
[Asserts]
header "Location" == "https://www.nav.no/arbeid/arbeidsledig#hvor-mye-kan-du-fa-i-dagpenger"


# prod
GET http://www.nav.no:8080/arbeid/dagpenger/kalkulator

HTTP/1.1 301
[Asserts]
header "Location" == "https://www.nav.no/arbeid/arbeidsledig#hvor-mye-kan-du-fa-i-dagpenger"
