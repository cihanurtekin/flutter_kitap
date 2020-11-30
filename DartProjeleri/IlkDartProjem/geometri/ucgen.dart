import 'sekil.dart';

class Ucgen extends Sekil {
  Ucgen(double genislik, double yukseklik) : super(genislik, yukseklik);

  double alanHesapla(){
    return (genislik * yukseklik) / 2;
  }

  @override
  sekilIsminiYazdir() {
    print("Üçcgen");
  }
}