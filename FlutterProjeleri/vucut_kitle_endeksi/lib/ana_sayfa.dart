import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  double _sonuc = 0;

  TextEditingController _boyController = TextEditingController();

  TextEditingController _kiloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Vücut Kitle Endeksi"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 48, horizontal: 16),
        child: Column(
          children: [
            Text(
              _sonuc.toStringAsFixed(2),
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 32),
            TextField(
              controller: _boyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Boy",
                suffixText: "m",
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _kiloController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Kilo",
                suffixText: "kg",
              ),
            ),
            SizedBox(height: 32),
            RaisedButton(
              child: Text("Hesapla"),
              onPressed: _hesapla,
            ),
          ],
        ),
      ),
    );
  }

  _hesapla() {
    String boyText = _boyController.text.trim();
    String kiloText = _kiloController.text.trim();

    try {
      double boy = double.parse(boyText);
      double kilo = double.parse(kiloText);

      setState(() {
        _sonuc = kilo / (boy * boy);
      });
    } catch (error) {
      print("Hatalı işlem yapıldı. Hata mesajı: ${error.toString()}");
    }
  }
}
