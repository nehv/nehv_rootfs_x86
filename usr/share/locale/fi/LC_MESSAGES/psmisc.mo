��    S      �  q   L        Q    `   c
  b   �
  0   '  p   X  k   �  #   5     Y     v     �  )   �  	   �  3   �       �   '      �  ,   �  $        )  #   >      b     �     �  #   �  !   �            <   5  <   r  <   �  %   �           3     R     m     �     �     �     �     �     �  �     &   �     �          2  �   I  d   ,     �  $   �  u   �  C   C  =   �     �  &   �       )        @  g  Z  H   �  (     E  4  �   z  �   s  -  /  .   ]  F   �  "   �  -   �     $   
   D      O      b      i      }      �      �      �      �      �      �      �   �  �      �"  j   �&  f   :'  )   �'  �   �'  �   q(  %   �(     #)     @)     ^)  4   q)     �)  S   �)  )   *  �   1*  -   �*  D   +  #   V+     z+  4   �+  *   �+  2   �+  !   ),  7   K,  .   �,  (   �,  4   �,  :   -  :   K-  :   �-  $   �-     �-  2   .  '   9.     a.     ~.     �.  +   �.  ]   �.  ,   5/  &   b/  �   �/  &   F0  %   m0     �0     �0  �   �0  f   �1     2  9   2  �   Y2  K   �2  K   =3  Z   �3  2   �3     4  ?   64  $   v4  F  �4  T   �8  -   79  �  e9  $  ;  �   3<  }  �<  C   t@  M   �@  ;   A  F   BA  +   �A     �A     �A  
   �A     �A     �A     B     B  #   %B     IB     UB  
   aB     lB     2                '       3   7       ?       1       .   9      L   <          4                    :          @   J   D           (      Q   8           S   5       I       M       $          ;      &   B   =   "   A   H                         0       E   #             N      	      %   R   F      *   G   )      
   ,         +           P   -   O      /       !   >                               C   K          6           killall -l, --list
       killall -V, --version

  -e,--exact          require exact match for very long names
  -I,--ignore-case    case insensitive process name match
  -g,--process-group  kill process group instead of process
  -y,--younger-than   kill processes younger than TIME
  -o,--older-than     kill processes older than TIME
  -i,--interactive    ask for confirmation before killing
  -l,--list           list all known signal names
  -q,--quiet          don't print complaints
  -r,--regexp         interpret NAME as an extended regular expression
  -s,--signal SIGNAL  send this signal instead of SIGTERM
  -u,--user USER      kill only process(es) running as USER
  -v,--verbose        report if the signal was successfully sent
  -V,--version        display version information
  -w,--wait           wait for processes to die
   -                     reset options

  udp/tcp names: [local_port][,[rmt_host][,[rmt_port]]]

   -4,--ipv4             search IPv4 sockets only
  -6,--ipv6             search IPv6 sockets only
   -Z     show         SELinux security contexts
   -Z,--context REGEXP kill only process(es) having context
                      (must precede other arguments)
   PID    start at this PID; default is 1 (init)
  USER   show only trees rooted at processes of this user

 %*s USER        PID ACCESS COMMAND
 %s is empty (not mounted ?)
 %s: Invalid option %s
 %s: no process found
 %s: unknown signal; %s -l lists signals.
 (unknown) /proc is not mounted, cannot stat /proc/self/stat.
 Bad regular expression: %s
 CPU Times
  This Process    (user system guest blkio): %6.2f %6.2f %6.2f %6.2f
  Child processes (user system guest):       %6.2f %6.2f %6.2f
 Can't get terminal capabilities
 Cannot allocate memory for matched proc: %s
 Cannot find socket's device number.
 Cannot find user %s
 Cannot get UID from process status
 Cannot open /proc directory: %s
 Cannot open /proc/net/unix: %s
 Cannot open a network socket.
 Cannot open protocol file "%s": %s
 Cannot resolve local port %s: %s
 Cannot stat %s: %s
 Cannot stat file %s: %s
 Copyright (C) 1993-2005 Werner Almesberger and Craig Small

 Copyright (C) 1993-2009 Werner Almesberger and Craig Small

 Copyright (C) 1993-2010 Werner Almesberger and Craig Small

 Copyright (C) 2007 Trent Waddington

 Copyright (C) 2009 Craig Small

 Could not kill process %d: %s
 Error attaching to pid %i
 Invalid namespace name Invalid option Invalid time format Kill %s(%s%d) ? (y/N)  Kill process %d ? (y/N)  Killed %s(%s%d) with signal %d
 Maximum number of names is %d
 Memory
  Vsize:       %-10s
  RSS:         %-10s 		 RSS Limit: %s
  Code Start:  %#-10lx		 Code Stop:  %#-10lx
  Stack Start: %#-10lx
  Stack Pointer (ESP): %#10lx	 Inst Pointer (EIP): %#10lx
 Namespace option requires an argument. No process specification given No processes found.
 No such user name: %s
 PSmisc comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it under
the terms of the GNU General Public License.
For more information about these matters, see the files named COPYING.
 Page Faults
  This Process    (minor major): %8lu  %8lu
  Child Processes (minor major): %8lu  %8lu
 Press return to close
 Process with pid %d does not exist.
 Process, Group and Session IDs
  Process ID: %d		  Parent ID: %d
    Group ID: %d		 Session ID: %d
  T Group ID: %d

 Process: %-14s		State: %c (%s)
  CPU#:  %-3d		TTY: %s	Threads: %ld
 Scheduling
  Policy: %s
  Nice:   %ld 		 RT Priority: %ld %s
 Signal %s(%s%d) ? (y/N)  Specified filename %s does not exist.
 TERM is not set
 Unable to open stat file for pid %d (%s)
 Unknown local port AF %d
 Usage: fuser [-fMuv] [-a|-s] [-4|-6] [-c|-m|-n SPACE] [-k [-i] [-SIGNAL]] NAME...
       fuser -l
       fuser -V
Show which processes use the named files, sockets, or filesystems.

  -a,--all              display unused files too
  -i,--interactive      ask before killing (ignored without -k)
  -k,--kill             kill processes accessing the named file
  -l,--list-signals     list available signal names
  -m,--mount            show all processes using the named filesystems or block device
  -M,--ismountpoint     fulfill request only if NAME is a mount point
  -n,--namespace SPACE  search in this name space (file, udp, or tcp)
  -s,--silent           silent operation
  -SIGNAL               send this signal instead of SIGKILL
  -u,--user             display user IDs
  -v,--verbose          verbose output
  -V,--version          display version information
 Usage: killall [-Z CONTEXT] [-u USER] [ -eIgiqrvw ] [ -SIGNAL ] NAME...
 Usage: killall [OPTION]... [--] NAME...
 Usage: peekfd [-8] [-n] [-c] [-d] [-V] [-h] <pid> [<fd> ..]
    -8 output 8 bit clean streams.
    -n don't display read/write from fd headers.
    -c peek at any new child processes too.
    -d remove duplicate read/writes from the output.
    -V prints version info.
    -h prints this help.

  Press CTRL-C to end output.
 Usage: pidof [ -eg ] NAME...
       pidof -V

    -e      require exact match for very long names;
            skip if the command line is unavailable
    -g      show process group ID instead of process ID
    -V      display version information

 Usage: prtstat [options] PID ...
       prtstat -V
Print information about a process
    -r,--raw       Raw display of information
    -V,--version   Display version information and exit
 Usage: pstree [ -a ] [ -c ] [ -h | -H PID ] [ -l ] [ -n ] [ -p ] [ -u ]
              [ -A | -G | -U ] [ PID | USER ]
       pstree -V
Display a tree of processes.

  -a, --arguments     show command line arguments
  -A, --ascii         use ASCII line drawing characters
  -c, --compact       don't compact identical subtrees
  -h, --highlight-all highlight current process and its ancestors
  -H PID,
  --highlight-pid=PID highlight this process and its ancestors
  -G, --vt100         use VT100 line drawing characters
  -l, --long          don't truncate long lines
  -n, --numeric-sort  sort output by PID
  -p, --show-pids     show PIDs; implies -c
  -u, --uid-changes   show uid transitions
  -U, --unicode       use UTF-8 (Unicode) line drawing characters
  -V, --version       display version information
 You can only use files with mountpoint options You cannot search for only IPv4 and only IPv6 sockets at the same time You must provide at least one PID. all option cannot be used with silent option. asprintf in print_stat failed.
 disk sleep fuser (PSmisc) %s
 paging peekfd (PSmisc) %s
 prtstat (PSmisc) %s
 pstree (PSmisc) %s
 running skipping partial match %s(%d)
 sleeping traced unknown zombie Project-Id-Version: psmisc 22.11-pre1
Report-Msgid-Bugs-To: csmall@small.dropbear.id.au
POT-Creation-Date: 2010-03-28 18:17+1100
PO-Revision-Date: 2010-04-05 09:56+0200
Last-Translator: Jorma Karvonen <karvonen.jorma@gmail.com>
Language-Team: Finnish <translation-team-fi@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
X-Poedit-Language: Finnish
X-Poedit-Country: FINLAND
        killall -l, --list
       killall -V, --version

  -e,--exact           vaatii täsmällisen vastaavuuden hyvin pitkille nimille
  -I,--ignore-case     merkkikoosta riippumaton prosessinimi täsmää
  -g,--process-group   lähetä signaali kill-käskyllä prosessiryhmälle prosessin sijasta
  -y,--younger-than    tapa prosessit, jotka ovat nuorempia kuin TIME
  -o,--older-than      tapa prosessit, jotka ovat vanhempia kuin TIME
  -i,--interactive     kysy vahvistusta ennen kill-käskyä
  -l,--list            luettele kaikki tunnetut signaalinimet
  -q,--quiet           älä tulosta valituksia
  -r,--regexp          tulkitse NIMI laajennettuna säännöllisenä lausekkeena
  -s,--signal SIGNAALI lähetä tämä SIGNAALI eikä SIGTERM
  -u,--user KÄYTTÄJÄ   lähetä signaali kill-käskyllä vain prosesseille, joita suoritetaan KÄYTTÄJÄnä
  -v,--verbose         ilmoita, jos signaalin lähetys onnistui
  -V,--version         näytä versiotiedot
  -w,--wait            odota prosessien loppumista
   -                     nollaa valitsimet

  ”udp/tcp”-nimet: [local_port][,[rmt_host][,[rmt_port]]]

   -4,--ipv4             etsi vain IPv4-pistokkeita
  -6,--ipv6             etsi vain IPv6-pistokkeita
   -Z     näytä SELinux-turvakontekstit
   -Z,--context REGEXP lähetä signaali kill-käskyllä vain prosesseille, joilla on konteksti
                      (tämän on oltava muiden argumenttien edellä)
   PID    aloita tällä PID-prosessitunnisteella; oletus on 1 (init)
  USER   näytä vain puita, jotka alkavat käyttäjän omistuksessa

 %*s KÄYTTÄJÄ    PID ACCESS KÄSKY
 %s on tyhjä (ei liitetty?)
 %s: Virheellinen valitsin %s
 %s: ei prosesseja
 %s: tuntematon signaali; %s -l luettelee signaalit.
 (tuntematon) /proc ei ole liitetty, ei voi suorittaa stat-käskyä tiedostolle /proc/self/stat.
 Virheellinen säännöllinen lauseke: %s
 Suoritinajat
  Tämä prosessi    (käyttäjä järjestelmä vieras blkio): %6.2f %6.2f %6.2f %6.2f
  Lapsiprosessit (käyttäjä järjestelmä vieras blkio): %6.2f %6.2f %6.2f
 Päätteen ominaisuudet eivät ole selvillä
 Ei voida varata muistia täsmäävälle ”proc”-hakemistolle: %s
 Pistokkeen laitenumeroa ei löydy.
 Ei löydy käyttäjää %s
 Ei saada UID-käyttäjätunnistetta prosessitilasta
 Ei voida avata ”/proc”-hakemistoa: %s
 Ei voida avata tiedostoa ”/proc/net/unix”: %s
 Ei voida avata verkkopistoketta.
 Ei voida avata yhteyskäytäntötiedostoa ”%s”: %s
 Ei voida ratkaista paikallista porttia %s: %s
 Ei voida suorittaa stat-käskyä %s: %s
 Ei voida suorittaa stat-käskyä tiedostolle %s: %s
 Copyright © 1993-2005 Werner Almesberger ja Craig Small

 Copyright © 1993-2009 Werner Almesberger ja Craig Small

 Copyright © 1993-2010 Werner Almesberger ja Craig Small

 Copyright © 2007 Trent Waddington

 Copyright © 2009 Craig Small

 Ei voitu lähettää signaalia prosessille %d: %s
 Virhe liityttäessä pid-tunnukseen %i
 Virheellinen nimiavaruusnimi Virheellinen valitsin Virheellinen aikamuoto Lopeta prosessi %s(%s%d)? (y=kyllä, N=ei)  Lähetä signaali prosessille %d? (y=kyllä, N=ei, ”kyllä” yleensä lopettaa prosessin)  Prosessille %s(%s%d) lähetetty signaali %d
 Suurin sallittu määrä nimiä on %d
 Muisti
  Vsize:       %-10s
  RSS:         %-10s 		 RSS-raja: %s
  Koodialku:  %#-10lx		 Koodiloppu:  %#-10lx
  Pinoalku: %#-10lx
  Pino-osoitin (ESP): %#10lx	 Käskyosoitin (EIP): %#10lx
 Nimiavaruusvalitsin vaatii argumentin. Prosessimäärittelyä ei ole annettu Prosesseja ei löydy.
 Käyttäjätunnus puuttuu: %s
 PSmisc-ohjelmistolla EI EHDOTTOMASTI OLE MITÄÄN TAKUUTA.
Tämä on vapaa ohjelmisto ja saat kopioida ja levittää sitä GNU General Public
License -lisenssin mukaisesti. Tiedostossa COPYING on tarkemmat tiedot.
 Sivuvirheet
  Tämä Prosessi    (minor major): %8lu  %8lu
  Lapsiprosessit (minor major): %8lu  %8lu
 Enter-näppäin sulkee
 Ei ole olemassa prosessia, jonka prosessitunniste on %d.
 Prosessi-, ryhmä- ja istuntotunnisteet
  Prosessitunniste: %d		  Emotunniste: %d
    Ryhmätunniste: %d		 Istuntotunniste: %d
  T-ryhmätunniste: %d

 Prosessi: %-14s		Tila: %c (%s)
  Suoritinnro:  %-3d		TTY: %s	Säikeet: %ld
 Vuorottaminen
  Menettelytapa: %s
  Nice:   %ld 		 RT Prioriteetti: %ld %s
 Signaali prosessille %s(%s%d)? (y=kyllä, N=ei, ”kyllä” yleensä lopettaa prosessin)  Määriteltyä tiedostonimeä %s ei ole olemassa.
 TERM-signaali ei ole asetettu
 Ei kyetä avaamaan stat-tiedostoa prosessitunnisteelle %d (%s)
 Tuntematon paikallinen portti AF %d
 Käyttö: fuser [-fMuv] [-a|-s] [-4|-6] [-c|-m|-n SPACE] [-k [-i] [-SIGNAL]] NIMI ...
        fuser -l
        fuser -V
Näytä mitkä prosessit käyttävät nimettyjä tiedostoja, pistokkeita tai tiedostojärjestelmiä.

  -a,--all              näytä myös käyttämättömät tiedostot
  -i,--interactive      kysy ennen kill-komennon käyttämistä (ei merkitystä ilman valitsinta -k)
  -i,--interactive      kysy ennen signaalin lähetystä kill-käskyllä (ei merkitystä ilman ”-k”-valitsinta)
  -k,--kill             lähetä signaali kill-käskyllä prosesseille, jotka käyttävät tiedostoa
  -l,--list-signals     näytä signaalinimien luettelo
  -m,--mount            näytä kaikki nimettyjä tiedostojärjestelmiä tai lohkolaitteita käyttävät prosessit
  -n,--namespace SPACE  etsi tästä SPACE-nimiavaruudesta (file, udp, tai tcp)
  -s,--silent           vaimennettu toiminta
  -SIGNAL               lähetä muu signaali kuin SIGKILL
  -u,--user             näytä käyttäjätunnukset
  -v,--verbose          laveasti
  -V,--version          näytä versiotiedot
 Käyttö: killall [-Z KONTEKSTI] [-u KÄYTTÄJÄ] [ -eIgiqrvw ] [ -SIGNAL ] NIMI...
 Käyttö: killall [VALITSIN]... [--] NIMI...
 Käyttö: peekfd [-8] [-n] [-c] [-d] [-V] [-h] <pid> [<fd> ..]
    -8 tuloste puhtaina 8-bittisinä virtoina.
    -n älä näytä lukemisia ja kirjoittamisia fd-otsakkeista.
    -c kurkista myös kaikkien tytärprosessien aikana.
    -d poista tulosteesta lukemis- ja kirjoittamistoimintojen kaksoiskappaleet.
    -V tulostaa versiotiedot.
    -h tulostaa tämän ohjeen.

  Lopeta tulostus painamalla näppäimiä CTRL-C.
 Käyttö: pidof [ -eg ] NIMI...
       pidof -V

    -e      vaatii hyvin pitkien nimien täsmällistä vastaavuutta;
            ohita, jos komentorivi ei ole käytettävissä.
    -g      näyttää prosessin ryhmätunnisteen prosessitunnisteen sijasta
    -V      näyttää versiotiedot

 Käyttö: prtstat [valitsimet] PID-prosessitunniste ...
       prtstat -V
Tulosta tiedot prosesseista
    -r,--raw       Tietojen raakanäyttö
    -V,--version   Näytä versiotiedot ja poistu
 Käyttö: pstree [ -a ] [ -c ] [ -h | -H PID ] [ -l ] [ -n ] [ -p ] [ -u ]
              [ -A | -G | -U ] [ PID | KÄYTTÄJÄ ]
       pstree -V
Näytä prosessien puu.

  -a, --arguments     näytä komentoriviargumentit
  -A, --ascii         käytä ASCII-pseudografiikkamerkkejä
  -c, --compact       älä tiivistä identtisiä alipuita
  -h, --highlight-all korosta nykyinen prosessi ja sen periytymislähteet
  -H PID,
  --highlight-pid=PID korosta tämä prosessi ja sen periytymislähteet
  -G, --vt100         käytä VT100-pseudografiikkamerkkejä
  -l, --long          älä typistä pitkiä riviä
  -n, --numeric-sort  lajittele tulostus PID-tunnuksen mukaan
  -p, --show-pids     näytä PID-tunnukset; epäsuorasti -c
  -u, --uid-changes   näytä uid-siirtymät
  -U, --unicode       käytä UTF-8 (Unicode)-pseudografiikkamerkkejä
  -V, --version       näytä versiotiedot
 Voit käyttää tiedostoja vain ”mountpoint”-valitsimien kanssa Ei voida etsiä ”vain IPv4”- ja ”vain IPv6”-pistokkeita samaan aikaan Sinun on tarjottava vähintään yksi PID-prosessitunniste. ”all”-valitsinta ei voi käyttää ”silent”-valitsimen kanssa. asprintf kutsussa print_stat epäonnistui.
 levylepo fuser (PSmisc) %s
 sivutetaan peekfd (PSmisc) %s
 prtstat (PSmisc) %s
 pstree (PSmisc) %s
 suoritetaan ohitetaan osittain vastaava %s(%d)
 levätään jäljitetty tuntematon zombi 