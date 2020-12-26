import 'package:flutter/material.dart';
import 'package:ulkeler/ortak_liste.dart';
import 'package:ulkeler/ulke.dart';

class Favoriler extends StatefulWidget {
  final List<Ulke> butunUlkeler;
  final List<String> favoriUlkeKodlari;

  Favoriler(this.butunUlkeler, this.favoriUlkeKodlari);

  @override
  _FavorilerState createState() => _FavorilerState();
}

class _FavorilerState extends State<Favoriler> {
  List<Ulke> _favoriUlkeler = List<Ulke>();

  @override
  void initState() {
    super.initState();

    for (Ulke ulke in widget.butunUlkeler) {
      if (widget.favoriUlkeKodlari.contains(ulke.ulkeKodu)) {
        _favoriUlkeler.add(ulke);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text("Favoriler"),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return OrtakListe(_favoriUlkeler, widget.favoriUlkeKodlari);
  }
}
