GET http://nginx:8080/arbeid/dagpenger/soknad-innsending
Host: arbeid.intern.dev.nav.no

HTTP/1.1 301
[Asserts]
header "Location" == "https://arbeid.intern.dev.nav.no/dagpenger/dialog/generell-innsending"


GET http://nginx:8080/arbeid/dagpenger/soknad-innsending
Host: www.nav.no

HTTP/1.1 301
[Asserts]
header "Location" == "https://www.nav.no/dagpenger/dialog/generell-innsending"
