import '../matematik.dart';
import 'sekil.dart';

class Kare extends Sekil {
  Kare(double genislik, double yukseklik) : super(genislik, yukseklik);

  @override
  sekilIsminiYazdir() {
    print("Kare");
  }

  toplamaYap(){
    print(Matematik.topla(6, 7));
  }
}