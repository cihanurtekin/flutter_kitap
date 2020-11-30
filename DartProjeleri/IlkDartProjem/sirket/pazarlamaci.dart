import 'calisan.dart';

class Pazarlamaci extends Calisan {
  late String pazarlamaTeknigi;

  Pazarlamaci(String ad, String soyad, String adres, int maas, int telefon, this.pazarlamaTeknigi)
      : super(ad, soyad, adres, maas, telefon);
}