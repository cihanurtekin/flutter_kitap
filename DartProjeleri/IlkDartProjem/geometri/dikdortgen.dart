import 'sekil.dart';

class Dikdortgen extends Sekil {
  Dikdortgen(double genislik, double yukseklik) : super(genislik, yukseklik);

  @override
  sekilIsminiYazdir() {
    print("Dikdörtgen");
  }
}