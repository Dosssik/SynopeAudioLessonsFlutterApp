import 'package:audio_service/audio_service.dart';

// MOCK DATA
List<MediaItem> getFirstBookItems() {
  return <MediaItem>[
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/01.mp3",
        album: "På vej til dansk",
        title: "Lydfil 01 - Præsentation 1",
        duration: Duration(seconds: 58)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/02.mp3",
        album: "På vej til dansk",
        title: "Lydfil 02 - Alfabetet",
        duration: Duration(seconds: 71)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/03.mp3",
        album: "På vej til dansk",
        title: "Lydfil 03 - Dialog 2",
        duration: Duration(seconds: 56)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/04.mp3",
        album: "På vej til dansk",
        title: "Lydfil 04 - At præsentere andre",
        duration: Duration(seconds: 51)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/05.mp3",
        album: "På vej til dansk",
        title: "Lydfil 05 - Land, nationalitet og sprog",
        duration: Duration(seconds: 44)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/06.mp3",
        album: "På vej til dansk",
        title: "Lydfil 06 - Øvelse med tryk",
        duration: Duration(seconds: 80)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/07.mp3",
        album: "På vej til dansk",
        title: "Lydfil 07 - Mængdetal",
        duration: Duration(seconds: 130)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/08.mp3",
        album: "På vej til dansk",
        title: "Lydfil 08 - Dialog 1 og 2",
        duration: Duration(seconds: 116)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/09.mp3",
        album: "På vej til dansk",
        title: "Lydfil 09 - Sheng",
        duration: Duration(seconds: 77)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/10.mp3",
        album: "På vej til dansk",
        title: "Lydfil 10 - Lytteøvelse - Claudine",
        duration: Duration(seconds: 94)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/11.mp3",
        album: "På vej til dansk",
        title: "Lydfil 11 - Dialog 1-4",
        duration: Duration(seconds: 123)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/12.mp3",
        album: "På vej til dansk",
        title: "Lydfil 12 - Ordliste",
        duration: Duration(seconds: 57)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/13.mp3",
        album: "På vej til dansk",
        title: "Lydfil 13 - Ordliste 2",
        duration: Duration(seconds: 77)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/14.mp3",
        album: "På vej til dansk",
        title: "Lydfil 14 - Hvis er det",
        duration: Duration(seconds: 111)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/15.mp3",
        album: "På vej til dansk",
        title: "Lydfil 15 - Fredag i klassen",
        duration: Duration(seconds: 75)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/16.mp3",
        album: "På vej til dansk",
        title: "Lydfil 16 - Udtaleøvelse - er og ere",
        duration: Duration(seconds: 76)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/17.mp3",
        album: "På vej til dansk",
        title: "Lydfil 17 - Maria med pauser",
        duration: Duration(seconds: 102)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/18.mp3",
        album: "På vej til dansk",
        title: "Lydfil 18 - Dialog 1 og 2, hvor længe har du ...",
        duration: Duration(seconds: 93)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/19.mp3",
        album: "På vej til dansk",
        title: "Lydfil 19 - Priya",
        duration: Duration(seconds: 109)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/20.mp3",
        album: "På vej til dansk",
        title: "Lydfil 20 - Dialog 1,2 og 3 - hvad laver du",
        duration: Duration(seconds: 144)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/21.mp3",
        album: "På vej til dansk",
        title: "Lydfil 21 - Udtale af t",
        duration: Duration(seconds: 45)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/22.mp3",
        album: "På vej til dansk",
        title: "Lydfil 22 - Lytteøvelse - Anna og Miguel",
        duration: Duration(seconds: 104)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/23.mp3",
        album: "På vej til dansk",
        title: "Lydfil 23 - Familierelationer 1",
        duration: Duration(seconds: 85)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/24.mp3",
        album: "På vej til dansk",
        title: "Lydfil 24 - Uffes familie",
        duration: Duration(seconds: 241)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/25.mp3",
        album: "På vej til dansk",
        title: "Lydfil 25 - Ordtryk 1",
        duration: Duration(seconds: 59)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/26.mp3",
        album: "På vej til dansk",
        title: "Lydfil 26 - Klokken",
        duration: Duration(seconds: 69)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/27.mp3",
        album: "På vej til dansk",
        title: "Lydfil 27 - Morgenrytme",
        duration: Duration(seconds: 114)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/28.mp3",
        album: "På vej til dansk",
        title: "Lydfil 28 - Thomas morgen",
        duration: Duration(seconds: 169)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/29.mp3",
        album: "På vej til dansk",
        title: "Lydfil 29 - Andre aktiviteter",
        duration: Duration(seconds: 168)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/30.mp3",
        album: "På vej til dansk",
        title: "Lydfil 30 - Mette og Imram har travlt",
        duration: Duration(seconds: 332)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/31.mp3",
        album: "På vej til dansk",
        title: "Lydfil 31 - Ordtryk 2",
        duration: Duration(seconds: 56)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/32.mp3",
        album: "På vej til dansk",
        title: "Lydfil 32 - Lytteøvelse",
        duration: Duration(seconds: 119)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/33.mp3",
        album: "På vej til dansk",
        title: "Lydfil 33 - 4 dialoger",
        duration: Duration(seconds: 87)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/34.mp3",
        album: "På vej til dansk",
        title: "Lydfil 34 - E-assimilation 1",
        duration: Duration(seconds: 142)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/35.mp3",
        album: "På vej til dansk",
        title: "Lydfil 35 - Fremtid - dialog 1-3",
        duration: Duration(seconds: 92)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/36.mp3",
        album: "På vej til dansk",
        title: "Lydfil 36 - Alex og Olga skal have gæster",
        duration: Duration(seconds: 187)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/37.mp3",
        album: "På vej til dansk",
        title: "Lydfil 37 - Ordtryk 3",
        duration: Duration(seconds: 73)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/38.mp3",
        album: "På vej til dansk",
        title: "Lydfil 38 - Datidsdialoger 1 og 2",
        duration: Duration(seconds: 67)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/39.mp3",
        album: "På vej til dansk",
        title: "Lydfil 39 - Datid - verber",
        duration: Duration(seconds: 231)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/40.mp3",
        album: "På vej til dansk",
        title: "Lydfil 40 - Datidsdialoger 3 og 4",
        duration: Duration(seconds: 60)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/41.mp3",
        album: "På vej til dansk",
        title: "Lydfil 41 - Tenzin tager bussen",
        duration: Duration(seconds: 204)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/42.mp3",
        album: "På vej til dansk",
        title: "Lydfil 42 - Mads Knudsen",
        duration: Duration(seconds: 231)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/43.mp3",
        album: "På vej til dansk",
        title: "Lydfil 43 - Madvarer",
        duration: Duration(seconds: 261)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/44.mp3",
        album: "På vej til dansk",
        title: "Lydfil 44 - Lyt og indsæt verber",
        duration: Duration(seconds: 69)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/45.mp3",
        album: "På vej til dansk",
        title: "Lydfil 45 - Dialog 1-5 - smag og behag",
        duration: Duration(seconds: 111)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/46.mp3",
        album: "På vej til dansk",
        title: "Lydfil 46 - Ordtryk 4",
        duration: Duration(seconds: 61)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/47.mp3",
        album: "På vej til dansk",
        title: "Lydfil 47 - Ying fra Kina",
        duration: Duration(seconds: 225)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/48.mp3",
        album: "På vej til dansk",
        title: "Lydfil 48 - Lytteøvelse - Yoko og Issey",
        duration: Duration(seconds: 102)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/49.mp3",
        album: "På vej til dansk",
        title: "Lydfil 49 - Andre mængder",
        duration: Duration(seconds: 113)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/50.mp3",
        album: "På vej til dansk",
        title: "Lydfil 50 - Dialog - penge og priser",
        duration: Duration(seconds: 29)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/51.mp3",
        album: "På vej til dansk",
        title: "Lydfil 51 - Indkøbsdialoger 1-3",
        duration: Duration(seconds: 174)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/52.mp3",
        album: "På vej til dansk",
        title: "Lydfil 52 - Hos bageren",
        duration: Duration(seconds: 162)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/53.mp3",
        album: "På vej til dansk",
        title: "Lydfil 53 - Reduktion",
        duration: Duration(seconds: 75)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/54.mp3",
        album: "På vej til dansk",
        title: "Lydfil 54 - Charlotte lever sundt",
        duration: Duration(seconds: 252)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/55.mp3",
        album: "På vej til dansk",
        title: "Lydfil 55 - Ordtryk 5",
        duration: Duration(seconds: 52)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/56.mp3",
        album: "På vej til dansk",
        title: "Lydfil 56 - Lytteøvelse - Johnny",
        duration: Duration(seconds: 162)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/57.mp3",
        album: "På vej til dansk",
        title: "Lydfil 57 - Boligen",
        duration: Duration(seconds: 110)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/58.mp3",
        album: "På vej til dansk",
        title: "Lydfil 58 - Lytteøvelse",
        duration: Duration(seconds: 99)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/59.mp3",
        album: "På vej til dansk",
        title: "Lydfil 59 - Lytteøvelse - køkkenet",
        duration: Duration(seconds: 129)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/60.mp3",
        album: "På vej til dansk",
        title: "Lydfil 60 - Lytteøvelse - endelser",
        duration: Duration(seconds: 86)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/61.mp3",
        album: "På vej til dansk",
        title: "Lydfil 61 - Per og Randi",
        duration: Duration(seconds: 110)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/62.mp3",
        album: "På vej til dansk",
        title: "Lydfil 62 - Farver",
        duration: Duration(seconds: 275)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/63.mp3",
        album: "På vej til dansk",
        title: "Lydfil 63 - Soveværelset",
        duration: Duration(seconds: 71)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/64.mp3",
        album: "På vej til dansk",
        title: "Lydfil 64 - Lytteøvelse - Stig og Mette",
        duration: Duration(seconds: 184)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/65.mp3",
        album: "På vej til dansk",
        title: "Lydfil 65 - En lejlighed i Valby",
        duration: Duration(seconds: 312)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/66.mp3",
        album: "På vej til dansk",
        title: "Lydfil 66 - Ordtryk 6",
        duration: Duration(seconds: 88)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/67.mp3",
        album: "På vej til dansk",
        title: "Lydfil 67 - Lytteøvelse - Minna og Ole",
        duration: Duration(seconds: 167)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/68.mp3",
        album: "På vej til dansk",
        title: "Lydfil 68 - Jamal lærer dansk",
        duration: Duration(seconds: 370)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/69.mp3",
        album: "På vej til dansk",
        title: "Lydfil 69 - Lytteøvelse - Michalina",
        duration: Duration(seconds: 116)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/70.mp3",
        album: "På vej til dansk",
        title: "Lydfil 70 - Anna",
        duration: Duration(seconds: 60)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/71.mp3",
        album: "På vej til dansk",
        title: "Lydfil 71 - Reza",
        duration: Duration(seconds: 233)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/72.mp3",
        album: "På vej til dansk",
        title: "Lydfil 72 - Manu og Thao",
        duration: Duration(seconds: 187)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/73.mp3",
        album: "På vej til dansk",
        title: "Lydfil 73 - Ordtryk 7",
        duration: Duration(seconds: 102)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/74.mp3",
        album: "På vej til dansk",
        title: "Lydfil 74 - Lytteøvelse - Marc",
        duration: Duration(seconds: 152)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/75.mp3",
        album: "På vej til dansk",
        title: "Lydfil 75 - Byer i Danmark",
        duration: Duration(seconds: 58)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/76.mp3",
        album: "På vej til dansk",
        title: "Lydfil 76 - Vejr og temperatur",
        duration: Duration(seconds: 249)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/77.mp3",
        album: "På vej til dansk",
        title: "Lydfil 77 - Danmark",
        duration: Duration(seconds: 296)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/77-2.mp3",
        album: "På vej til dansk",
        title: "Lydfil 77 (2) - Danmark (5. udg, 8+. oplag)",
        duration: Duration(seconds: 296)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/78.mp3",
        album: "På vej til dansk",
        title: "Lydfil 78 - Familierelationer 2",
        duration: Duration(seconds: 100)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/79.mp3",
        album: "På vej til dansk",
        title: "Lydfil 79 - Dialog 1,2 og 3",
        duration: Duration(seconds: 104)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/80.mp3",
        album: "På vej til dansk",
        title: "Lydfil 80 - Måneder og datoer",
        duration: Duration(seconds: 136)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/81.mp3",
        album: "På vej til dansk",
        title: "Lydfil 81 - Kroppen",
        duration: Duration(seconds: 119)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/82.mp3",
        album: "På vej til dansk",
        title: "Lydfil 82 - Tøj",
        duration: Duration(seconds: 113)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/83.mp3",
        album: "På vej til dansk",
        title: "Lydfil 83 - Vokalskema",
        duration: Duration(seconds: 47)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/84.mp3",
        album: "På vej til dansk",
        title: "Lydfil 84 - Udtale af d",
        duration: Duration(seconds: 77)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/85.mp3",
        album: "På vej til dansk",
        title: "Lydfil 85 - Udtale af r",
        duration: Duration(seconds: 91)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/86.mp3",
        album: "På vej til dansk",
        title: "Lydfil 86 - Udtale af p, t og k",
        duration: Duration(seconds: 49)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/87.mp3",
        album: "På vej til dansk",
        title: "Lydfil 87 - Længde",
        duration: Duration(seconds: 97)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/88.mp3",
        album: "På vej til dansk",
        title: "Lydfil 88 - Vokalsænkning 1 i",
        duration: Duration(seconds: 53)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/89.mp3",
        album: "På vej til dansk",
        title: "Lydfil 89 - Vokalsænkning 1 e",
        duration: Duration(seconds: 53)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/90.mp3",
        album: "På vej til dansk",
        title: "Lydfil 90 - Vokalsænkning 1 æ",
        duration: Duration(seconds: 54)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/91.mp3",
        album: "På vej til dansk",
        title: "Lydfil 91 - Vokalsænkning 2 a",
        duration: Duration(seconds: 85)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/92.mp3",
        album: "På vej til dansk",
        title: "Lydfil 92 - Vokalsænkning 3 y",
        duration: Duration(seconds: 62)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/93.mp3",
        album: "På vej til dansk",
        title: "Lydfil 93 - Vokalsænkning 4 ø",
        duration: Duration(seconds: 96)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/94.mp3",
        album: "På vej til dansk",
        title: "Lydfil 94 - Vokalsænkning 5 u",
        duration: Duration(seconds: 50)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/95.mp3",
        album: "På vej til dansk",
        title: "Lydfil 95 - Vokalsænkning 6 o",
        duration: Duration(seconds: 60)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/96.mp3",
        album: "På vej til dansk",
        title: "Lydfil 96 - Vokalsænkning 7 å",
        duration: Duration(seconds: 59)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/97.mp3",
        album: "På vej til dansk",
        title: "Lydfil 97 - Assimilation 3",
        duration: Duration(seconds: 115)),
    MediaItem(
        id: "https://www.synope.dk/mp3/pv/98.mp3",
        album: "På vej til dansk",
        title: "Lydfil 98 - Vokaler, konsonanter og halvvokaler",
        duration: Duration(seconds: 158)),
  ];
}
