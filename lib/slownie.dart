library slownie;

final List<List<String>> slowa = [
  ['minus'],
  [
    'zero',
    'jeden',
    'dwa',
    'trzy',
    'cztery',
    'pięć',
    'sześć',
    'siedem',
    'osiem',
    'dziewięć'
  ],
  [
    'dziesięć',
    'jedenaście',
    'dwanaście',
    'trzynaście',
    'czternaście',
    'piętnaście',
    'szesnaście',
    'siedemnaście',
    'osiemnaście',
    'dziewiętnaście'
  ],
  [
    'dziesięć',
    'dwadzieścia',
    'trzydzieści',
    'czterdzieści',
    'pięćdziesiąt',
    'sześćdziesiąt',
    'siedemdziesiąt',
    'osiemdziesiąt',
    'dziewięćdziesiąt'
  ],
  [
    'sto',
    'dwieście',
    'trzysta',
    'czterysta',
    'pięćset',
    'sześćset',
    'siedemset',
    'osiemset',
    'dziewięćset'
  ],
  ['tysiąc', 'tysiące', 'tysięcy'],
  ['milion', 'miliony', 'milionów'],
  ['miliard', 'miliardy', 'miliardów'],
  ['bilion', 'biliony', 'bilionów'],
  ['biliard', 'biliardy', 'biliardów'],
  ['trylion', 'tryliony', 'trylionów'],
  ['tryliard', 'tryliardy', 'tryliardów'],
  ['kwadrylion', 'kwadryliony', 'kwadrylionów'],
  ['kwintylion', 'kwintyliony', 'kwintylionów'],
  ['sekstylion', 'sekstyliony', 'sekstylionów'],
  ['septylion', 'septyliony', 'septylionów'],
  ['oktylion', 'oktyliony', 'oktylionów'],
  ['nonylion', 'nonyliony', 'nonylionów'],
  ['decylion', 'decyliony', 'decylionów']
];
/// convert input number [wej] to polish number in words
String liczba_na_tekst_do_tysiaca(int wej) {
  String wynik = '';
  var j = wej.abs();

  if (j == 0) return slowa[1][0].toString();

  int jednosci = j % 10;

  int dziesiatki = (j % 100 - jednosci) ~/ 10;

  int setki = (j - dziesiatki * 10 - jednosci) ~/ 100;

  if (setki > 0) wynik += slowa[4][setki - 1].toString() + " ";

  if (dziesiatki > 0) {
    if (dziesiatki == 1) {
      wynik += slowa[2][jednosci].toString() + " ";
    } else {
      wynik += slowa[3][dziesiatki - 1].toString() + " ";
    }
  }

  if (jednosci > 0 && dziesiatki != 1)
    wynik += slowa[1][jednosci].toString() + " ";
  return wynik;
}
/// convert input text [liczba] with arabic numerals in text to polish number in words
String slownie(String liczba) {
  String wej = liczba.trim();
  String wyj = '';

  if (wej.startsWith("-")) {
    wej = wej.substring(1, wej.length);
    wyj += slowa[0][0].toString() + " ";
  }
  if (wej == '0') {
    wyj = slowa[1][0].toString();
  } else {
    int z = wej.length - 1;
    List input = new List();
    int c = 0;
    String cs = '';
    while (z >= 0) {
      if (c == 0) cs = '';
      cs = wej[z] + cs;
      z--;
      c++;
      if (c == 3) {
        input.add(cs);
        c = 0;
        if (z < 0) cs = '';
      }
    }
    if (cs != '') {
      input.add(cs);
    }

    for (var i = input.length - 1; i >= 0; i--) {
      int liczba = int.parse(input[i]);

      if (liczba > 0) if (i == 0) {
        wyj += liczba_na_tekst_do_tysiaca(liczba);
      } else {
        wyj += (liczba > 1 ? liczba_na_tekst_do_tysiaca(liczba) : '') +
            odmiana(slowa[4 + i], liczba) +
            ' ';
      }
    }
  }

  return wyj.trim();
}

String odmiana(List odmiany, int liczba) {
  var txt = odmiany[2];
  if (liczba == 1) txt = odmiany[0];
  var liczbaTekst = liczba.toString();
  num jednosci = int.parse(liczbaTekst[liczbaTekst.length - 1]);
  num reszta = liczba % 100;
  if ((jednosci > 1 && jednosci < 5) && !(reszta > 10 && reszta < 20))
    txt = odmiany[1];
  return txt;
}
