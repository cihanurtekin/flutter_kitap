class Ulke {
  String ulkeKodu;
  String isim;
  String baskent;
  String bolge;
  int nufus;
  String bayrak;
  String dil;

  Ulke.fromMap(Map<String, dynamic> ulkeMap) {
    this.ulkeKodu = ulkeMap["alpha2Code"];
    this.isim = ulkeMap["name"];
    this.baskent = ulkeMap["capital"];
    this.bolge = ulkeMap["region"];
    this.nufus = ulkeMap["population"];
    this.bayrak = ulkeMap["flag"];
    this.dil = ulkeMap["languages"][0]["name"];
  }
}
