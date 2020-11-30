import 'aksiyon.dart';

class Zombi implements Aksiyon{
  @override
  ol() {
    print("Zombi öldü.");
  }

  @override
  saldir() {
    print("Zombi saldırdı.");
  }

  @override
  savunmaYap() {
    print("Zombi savunma yaptı.");
  }
}