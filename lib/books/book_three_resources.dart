import 'package:audio_service/audio_service.dart';

List<MediaItem> getThirdBookItems() {
  return <MediaItem>[
    // Kapitel 1
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/1_2_diktat.mp3",
        album: "Så kan du lære det",
        title: "1.2 DIKTAT",
        duration: Duration(seconds: 38)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/1_3_en_oplevelse_jeg_aldrig_vil_glemme.mp3",
        album: "Så kan du lære det",
        title: "1.3 EN OPLEVELSE JEG ALDRIG VIL GLEMME",
        duration: Duration(seconds: 193)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/1_8_med_rambo_i_junglen_ambience.mp3",
        album: "Så kan du lære det",
        title: "1.8 MED RAMBO I JUNGLEN",
        duration: Duration(seconds: 188)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/1_17_hej_john.mp3",
        album: "Så kan du lære det",
        title: "1.17 HEJ JOHN",
        duration: Duration(seconds: 122)),

    // Kapitel 2
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/2_7_tak_for_kaffe.mp3",
        album: "Så kan du lære det",
        title: "2.7 TAK FOR KAFFE",
        duration: Duration(seconds: 282)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/2_8_diktat.mp3",
        album: "Så kan du lære det",
        title: "2.8 DIKTAT",
        duration: Duration(seconds: 23)),

    // Kapitel 3
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/3_2_diktat_ny.mp3",
        album: "Så kan du lære det",
        title: "3.2 DIKTAT",
        duration: Duration(seconds: 28)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/3_2_et_helt_nyt_liv.mp3",
        album: "Så kan du lære det",
        title: "3.2 ET HELT NYT LIV",
        duration: Duration(seconds: 220)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/3_9_jeg_har_ikke_nogen_mand_at_vaere_skuffter_over.mp3",
        album: "Så kan du lære det",
        title: "3.9 JEG HAR IKKE NOGEN MAND AT VÆRE SKUFFET OVER",
        duration: Duration(seconds: 191)),

    // Kapitel 4
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/4_1_hvad_laver_du.mp3",
        album: "Så kan du lære det",
        title: "4.1 HVAD LAVER DU?",
        duration: Duration(seconds: 266)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/4_6_diktat.mp3",
        album: "Så kan du lære det",
        title: "4.6 DIKTAT",
        duration: Duration(seconds: 20)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/4_13_at_arbejde_i_dk.mp3",
        album: "Så kan du lære det",
        title: "4.13 AT ARBEJDE I DANMARK",
        duration: Duration(seconds: 152)),

    // Kapitel 5
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/5_1_sportsgrene_og_motion.mp3",
        album: "Så kan du lære det",
        title: "5.1 SPORTSGRENE OG MOTIONSFORMER",
        duration: Duration(seconds: 268)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/5_2_diktat.mp3",
        album: "Så kan du lære det",
        title: "5.2 DIKTAT",
        duration: Duration(seconds: 34)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/5_13_kropsdele.mp3",
        album: "Så kan du lære det",
        title: "5.13 KROPSDELE",
        duration: Duration(seconds: 321)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/5_17_opg_b.mp3",
        album: "Så kan du lære det",
        title: "5.17 OPGAVE B. ORDFORRÅD",
        duration: Duration(seconds: 329)),

    // Kapitel 6
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/6_2_diktat.mp3",
        album: "Så kan du lære det",
        title: "6.2 DIKTAT",
        duration: Duration(seconds: 29)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/6_19_linda_og_bjorn_i_ikea.mp3",
        album: "Så kan du lære det",
        title: "6.19 LINDA OG BJØRN I IKEA",
        duration: Duration(seconds: 112)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/6_24_lytteoevelse_efter_brylluppet.mp3",
        album: "Så kan du lære det",
        title: "6.24 EFTER BRYLLUPPET",
        duration: Duration(seconds: 128)),

    // Kapitel 7
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/7_1_man_sparer_saa_meget_tid.mp3",
        album: "Så kan du lære det",
        title: "7.1 MAN SPARER SÅ MEGET TID",
        duration: Duration(seconds: 165)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/7_14_lytteoevelse_landbrug.mp3",
        album: "Så kan du lære det",
        title: "7.14 LANDBRUG",
        duration: Duration(seconds: 171)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/7_16_hygge_i_samtalekoekkenet.mp3",
        album: "Så kan du lære det",
        title: "7.16 HYGGE I SAMTALEKØKKENET",
        duration: Duration(seconds: 199)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/7_19_i_koekkenet.mp3",
        album: "Så kan du lære det",
        title: "7.19 I KØKKENET",
        duration: Duration(seconds: 40)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/7_20_paa_bordet.mp3",
        album: "Så kan du lære det",
        title: "7.20 PÅ BORDET",
        duration: Duration(seconds: 64)),

    // Kapitel 8
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/8_2_diktat.mp3",
        album: "Så kan du lære det",
        title: "8.2 DIKTAT",
        duration: Duration(seconds: 49)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/8_4_det_kilder_lidt_i_maven_ny.mp3",
        album: "Så kan du lære det",
        title: "8.4 DET KILDER LIDT I MAVEN",
        duration: Duration(seconds: 213)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/8_15_lytteoevelse_danskerne_og_deres_kaeledyr_ny.mp3",
        album: "Så kan du lære det",
        title: "8.15 DANSKERNE OG DERES KÆLEDYR",
        duration: Duration(seconds: 93)),

    // Kapitel 9
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/9_2_der_er_jo_forskel_paa_virkelighed_og_fiktion.mp3",
        album: "Så kan du lære det",
        title: "9.2 DER ER JO FORSKEL PÅ VIRKELIGHED OG FIKTION",
        duration: Duration(seconds: 219)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/9_2_diktat.mp3",
        album: "Så kan du lære det",
        title: "9.2 DIKTAT",
        duration: Duration(seconds: 34)),
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/9_16_prinsessen_paa_aerten_final.mp3",
        album: "Så kan du lære det",
        title: "9.16 PRINSESSEN PÅ ÆRTEN",
        duration: Duration(seconds: 130)),

    // Kapitel 10
    MediaItem(
        id: "https://saakandulaeredet.ibog.gyldendal.dk/fileadmin/indhold/10_2_diktat.mp3",
        album: "Så kan du lære det",
        title: "10.2 DIKTAT",
        duration: Duration(seconds: 30)),
  ];
}
