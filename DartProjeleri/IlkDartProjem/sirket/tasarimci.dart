import 'calisan.dart';

class Tasarimci extends Calisan {
  late String kullandigiCizimProgrami;

  Tasarimci(String ad, String soyad, String adres, int maas, int telefon, this.kullandigiCizimProgrami)
      : super(ad, soyad, adres, maas, telefon);
}