import 'calisan.dart';

class Yazilimci extends Calisan {
  late String bildigiProgramlamaDili;

  Yazilimci(String ad, String soyad, String adres, int maas, int telefon, this.bildigiProgramlamaDili)
      : super(ad, soyad, adres, maas, telefon);
}
