import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulkeler/favoriler.dart';
import 'package:ulkeler/ortak_liste.dart';
import 'package:ulkeler/ulke.dart';
import 'package:http/http.dart' as http;

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final String _apiBaglantisi = "https://restcountries.eu/rest/v2/all?fields="
      "alpha2Code;name;capital;region;population;flag;languages";

  List<Ulke> _butunUlkeler = List<Ulke>();

  List<String> _favoriUlkeKodlari = List<String>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _favorileriCihazHafizasindanCek().then((_) {
        _ulkeleriInternettenCek();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Tüm Ülkeler"),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {
            _favorilerSayfasiniAc(context);
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    return _butunUlkeler.length == 0
        ? Center(child: CircularProgressIndicator())
        : OrtakListe(_butunUlkeler, _favoriUlkeKodlari);
  }

  _favorilerSayfasiniAc(BuildContext context) {
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (BuildContext context) {
        return Favoriler(_butunUlkeler, _favoriUlkeKodlari);
      },
    );

    Navigator.push(context, sayfaYolu);
  }

  _favorileriCihazHafizasindanCek() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriler = await prefs.getStringList("favoriler");

    if (favoriler != null) {
      for (String ulkeKodu in favoriler) {
        _favoriUlkeKodlari.add(ulkeKodu);
      }
    }
  }

  _ulkeleriInternettenCek() async {
    http.Response response = await http.get(_apiBaglantisi);
    List<dynamic> parsedResponse = jsonDecode(response.body);

    for (int i = 0; i < parsedResponse.length; i++) {
      Map<String, dynamic> ulkeMap = parsedResponse[i];
      Ulke ulke = Ulke.fromMap(ulkeMap);
      if (ulke != null) {
        _butunUlkeler.add(ulke);
      }
    }

    setState(() {});
  }
}
