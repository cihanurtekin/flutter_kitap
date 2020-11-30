import 'aksiyon.dart';
import 'controllable.dart';

class Oyuncu implements Aksiyon, Controllable{
  @override
  ol() {
    print("Oyuncu öldü.");
  }

  @override
  saldir() {
    print("Oyuncu saldırdı.");
  }

  @override
  savunmaYap() {
    print("Oyuncu savunma yaptı.");
  }

  @override
  kos() {
    print("Oyuncu koştu.");
  }

  @override
  yuru() {
    print("Oyuncu yürüdü.");
  }

  @override
  zipla() {
    print("Oyuncu zıpladı.");
  }
}