��             +         �     �  <   �  >   "  �  a               .  S   I     �  %   �     �     �          &  "   <  1   _  
   �     �  F   �     �       &     =   F  T   �  1  �             3   >  r   r  \   �  "   B  J  e     �  9   �  >     �  B     �  #   �  )   	  G   3     {  $   �     �  "   �     �       ,   (  2   U  
   �     �  K   �  (   �       8   %  =   ^  Y   �  �  �     �  3   �  <   �  �     i   �  ,   �                                                                                          
      	                                                

Found a referral to %s.

 
Querying for the IPv4 endpoint %s of a 6to4 IPv6 address.

 
Querying for the IPv4 endpoint %s of a Teredo IPv6 address.

       -m, --method=TYPE     select method TYPE
      -5                    like --method=md5
      -S, --salt=SALT       use the specified SALT
      -R, --rounds=NUMBER   use the specified NUMBER of rounds
      -P, --password-fd=NUM read the password from file descriptor NUM
                            instead of /dev/tty
      -s, --stdin           like --password-fd=0
      -h, --help            display this help and exit
      -V, --version         output version information and exit

If PASSWORD is missing then it is asked interactively.
If no SALT is specified, a random one is generated.
If TYPE is 'help', available methods are printed.

Report bugs to %s.
 %s/tcp: unknown service Available methods:
 Cannot parse this line: %s Catastrophic error: disclaimer text has been changed.
Please upgrade this program.
 Host %s not found. Illegal password character '0x%hhx'.
 Illegal salt character '%c'.
 Interrupted by signal %d... Invalid method '%s'.
 Invalid number '%s'.
 Method not supported by crypt(3).
 No whois server is known for this kind of object. Password:  Query string: "%s"

 This TLD has no whois server, but you can access the whois database at This TLD has no whois server. Timeout. Try '%s --help' for more information.
 Unknown AS number or IP network. Please upgrade this program. Usage: mkpasswd [OPTIONS]... [PASSWORD [SALT]]
Crypts the PASSWORD using crypt(3).

 Usage: whois [OPTION]... OBJECT...

-l                     one level less specific lookup [RPSL only]
-L                     find all Less specific matches
-m                     find first level more specific matches
-M                     find all More specific matches
-c                     find the smallest match containing a mnt-irt attribute
-x                     exact match [RPSL only]
-d                     return DNS reverse delegation objects too [RPSL only]
-i ATTR[,ATTR]...      do an inverse lookup for specified ATTRibutes
-T TYPE[,TYPE]...      only look for objects of TYPE
-K                     only primary keys are returned [RPSL only]
-r                     turn off recursive lookups for contact information
-R                     force to show local copy of the domain object even
                       if it contains referral
-a                     search all databases
-s SOURCE[,SOURCE]...  search the database from SOURCE
-g SOURCE:FIRST-LAST   find updates from SOURCE from serial FIRST to LAST
-t TYPE                request template for object of TYPE ('all' for a list)
-v TYPE                request verbose template for object of TYPE
-q [version|sources|types]  query specified server info [RPSL only]
-F                     fast raw output (implies -r)
-h HOST                connect to server HOST
-p PORT                connect to PORT
-H                     hide legal disclaimers
      --verbose        explain what is being done
      --help           display this help and exit
      --version        output version information and exit
 Using server %s.
 Version %s.

Report bugs to %s.
 Warning: RIPE flags used with a traditional server. Wrong salt length: %d byte when %d <= n <= %d expected.
 Wrong salt length: %d bytes when %d <= n <= %d expected.
 Wrong salt length: %d byte when %d expected.
 Wrong salt length: %d bytes when %d expected.
 standard 56 bit DES-based crypt(3) Project-Id-Version: whois 5.0.1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2010-01-27 13:38+0100
PO-Revision-Date: 2010-01-27 15:31+0100
Last-Translator: Sami Kerola <kerolasa@iki.fi>
Language-Team: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
 

Löytyi viittaus %s.

 
Kysytään IPv4 ulostulona %s IPv6:n IPv4 avaruudesta.

 
Kysytään IPv4 ulostulona %s Teredo IPv6 tunneliosoitetta.

       -m, --method=TYPE     valitse toiminto TYPE
      -5                    sama kuin --method=md5
      -S, --salt=SUOLA      suolan valinta
      -R, --rounds=NUMERO   pyöristä numeroon
      -P, --password-fd=NUM lue salasana avoimesta tiedostosta NUM
                            äläkä terminaalista /dev/tty
      -s, --stdin           sama kuin --password-fd=0
      -h, --help            tulosta tämä ruutu
      -V, --version         tulosta versio

Ellei salasanaa määritetä se kysytään.
Ellei suolaa määritetä käytetään satunnaista.
Jos tyyppi on 'help', tulostetaan toiminnot.

Lähetä bugiraportit osoitteeseen %s.
 %s/tcp: tuntematon palvelu Käytettävissä olevat toiminnot:
 Ohjelma ei kykene tulkitsemaan riviä: %s Katastrofaalinen virhe: lisenssiteksti on muuttunut.
Päivita ohjelma.
 Palvelinta %s ei löydy. Laiton merkki salasanassa '0x%hhx'.
 Suolassa laiton merkki '%c'.
 Ohjelma keskeytyi signaaliin %d... Väärä metodi '%s'.
 Väärä numero '%s'.
 Toiminto ei ole tuettu crypt(3) funktiossa.
 Mikään whois palvelu ei tiedä kysyttyä tietoa. Salasana:  Kysely: "%s"

 Tälla TLD:llä ei ole whois palvelinta, tiedot ovat nakyvissä osoitteessa Tälla TLD:llä ei ole whois palvelinta. Aikakatkaisu. Käytä valitsinta '%s --help' lisätietojen saamiseen.
 Tuntematon AS-numero tai IP-verkko. Päivitä tämä ohjelma. Käyttö: mkpasswd [OPTIO] ... [SALASANA] [SUOLA]]
Salaa salasanan crypt(3) funktiolla.

 Käyttö: whois [OPTIO]... OBJEKTI...

-l                     tasoa epätarkempi osuma [ainoastaan RPSL]
-L                     etsi kaikki epätarkemmat osumat
-m                     etsi yhtä tasoa tarkemmat osumat
-M                     etsi kaikki tarkemmat osumat
-c                     etsi vähäisin, joka vastaa mnt-irt attribuuttia
-x                     täydellinen osuma [ainoastaan RPSL]
-d                     palauta ainoastaan käänteisdomainit [ainoastan RPSL]
-i ATTR[,ATTR]...      käänteiskysely ATTRibuutin perusteella
-T TYPE[,TYPE]...      etsi ainoastaan määritetyn tyyppisiä objekteja
-K                     palauta ainoastan hakuavaimet [ainoastan RPSL]
-r                     älä käytä rekursiivista kontaktietohakua
-R                     pakota käyttämään paikallista kopiota domain
                       objektista, vaikka se sisältäisi viitteitä
-a                     etsi kaikista tietokannoista
-s SOURCE[,SOURCE]...  etsi tietokannoista SOURCE
-g SOURCE:FIRST-LAST   löytö päivittää lähteen SOURCE järjestysnumeron
                       FIRST:stä LAST:iin
-t TYPE                pyydä mallinne TYPE objektille ('all' näyttää tyyppilistan)
-v TYPE                monisanainen mallinne TYPE objektille
-q [version|sources|types]  erityinen palvelintieto [ainostaan RPSL]
-F                     nopea tuloste (sisältää -r valitsimen)
-h HOST                kysy palvelimelta HOST
-p PORT                käytä TCP-porttia PORT
-H                     älä tulosta käyttöehtoja
      --verbose        näytä mitä tapahtuu
      --help           tulosta tämä ruutu
      --version        tulosta versio
 Käytetään palvelinta %s.
 Versio %s.

Lähetä bugiraportit osoitteeseen %s.
 Varoitus: käytät RIPE valitsimia perinteiseen palvelimeen. Väärä suolan pituus: %d tavua, kun %d <= n <= %d odotettiin.
 Väärä suolan pituus: %d tavua, kun %d <= n <= %d odotettiin.
 Väärä suolan pituus: %d tavu, kun %d odotettiin.
 Väärä suolan pituus: %d tavu, kun %d odotettiin.
 Standardi 56 bittinen DES-salaus ks crypt(3) 