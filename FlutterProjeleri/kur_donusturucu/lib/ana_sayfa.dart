import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  Map<String, double> _oranlar = {};

  String _secilenKur = "USD";

  double _sonuc = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _verileriInternettenCek();
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomPadding: false,
    appBar: _buildAppBar(),
    body: _oranlar.length > 0
        ? _buildBody()
        : Center(child: CircularProgressIndicator()),
  );
}

  Widget _buildAppBar() {
    return AppBar(
      title: Text("Kur Dönüştürücü"),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          _buildRow(),
          SizedBox(height: 16),
          _buildSonucText(),
          SizedBox(height: 16),
          _buildAyiriciCizgi(),
          _buildListView(),
        ],
      ),
    );
  }

  Widget _buildRow() {
    return Row(
      children: [
        _buildTextField(),
        SizedBox(width: 16),
        _buildDropdown(),
      ],
    );
  }

  Widget _buildTextField() {
    return Expanded(
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: _hesapla,
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButton<String>(
      value: _secilenKur,
      icon: Icon(Icons.arrow_downward),
      underline: Container(),
      onChanged: (String newValue) {
        setState(() {
          _secilenKur = newValue;
        });
      },
      items: _oranlar.keys.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildSonucText() {
    return Text(
      "${_sonuc.toStringAsFixed(2)} TL",
      style: TextStyle(fontSize: 24),
    );
  }

  Widget _buildAyiriciCizgi() {
    return Container(
      height: 2,
      color: Colors.black,
    );
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: _oranlar.keys.length,
        itemBuilder: _buildListItem,
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return ListTile(
      title: Text(_oranlar.keys.toList()[index]),
      trailing: Text(
          (1 / _oranlar.values.toList()[index]).toStringAsFixed(2) + " TL"),
    );
  }

  _hesapla(String girilenDeger) {
    try {
      double deger = double.parse(girilenDeger);
      setState(() {
        _sonuc = deger / _oranlar[_secilenKur];
      });
    } catch (e) {
      print("Bir hata oluştu");
    }
  }

  _verileriInternettenCek() async {
    http.Response response =
        await http.get("https://api.exchangeratesapi.io/latest?base=TRY");
    Map<String, dynamic> parsedResponse = jsonDecode(response.body);

    Map<String, dynamic> rates = parsedResponse["rates"];
    for (String ulkeKuru in rates.keys) {
      _oranlar[ulkeKuru] = rates[ulkeKuru] as double;
    }

    setState(() {});
  }
}
