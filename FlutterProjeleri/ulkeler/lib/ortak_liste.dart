import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulkeler/ulke.dart';
import 'package:ulkeler/ulke_detay_sayfasi.dart';

class OrtakListe extends StatefulWidget {
  List<Ulke> ulkeListesi;
  List<String> favoriUlkeKodlari;

  OrtakListe(this.ulkeListesi, this.favoriUlkeKodlari);

  @override
  _OrtakListeState createState() => _OrtakListeState();
}

class _OrtakListeState extends State<OrtakListe> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.ulkeListesi.length,
      itemBuilder: _buildListItem,
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    Ulke ulke = widget.ulkeListesi[index];

    return Card(
      child: ListTile(
        leading: ClipOval(
          child: SizedBox(
            width: 48,
            height: 48,
            child: SvgPicture.network(
              ulke.bayrak,
              clipBehavior: Clip.none,
              fit: BoxFit.cover,
              placeholderBuilder: (context) {
                return CircleAvatar(backgroundColor: Colors.grey);
              },
            ),
          ),
        ),
        title: Text(ulke.isim),
        subtitle: Text("Başkent: ${ulke.baskent}"),
        trailing: IconButton(
          icon: Icon(
            widget.favoriUlkeKodlari.contains(ulke.ulkeKodu)
                ? Icons.favorite
                : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () {
            _favoriTiklandi(ulke);
          },
        ),
        onTap: () {
          _ulkeTiklandi(context, ulke);
        },
      ),
    );
  }

  _ulkeTiklandi(BuildContext context, Ulke ulke) {
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (BuildContext context) {
        return UlkeDetaySayfasi(ulke);
      },
    );

    Navigator.push(context, sayfaYolu);
  }

  _favoriTiklandi(Ulke ulke) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (widget.favoriUlkeKodlari.contains(ulke.ulkeKodu)) {
      widget.favoriUlkeKodlari.remove(ulke.ulkeKodu);
    } else {
      widget.favoriUlkeKodlari.add(ulke.ulkeKodu);
    }

    await prefs.setStringList("favoriler", widget.favoriUlkeKodlari);
    setState(() {});
  }
}
