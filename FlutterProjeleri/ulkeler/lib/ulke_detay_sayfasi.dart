import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ulkeler/ulke.dart';

class UlkeDetaySayfasi extends StatelessWidget {
  final Ulke _ulke;

  UlkeDetaySayfasi(this._ulke);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(_ulke.isim),
      centerTitle: true,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          SvgPicture.network(
            _ulke.bayrak,
            width: MediaQuery.of(context).size.width / 2,
            placeholderBuilder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 120,
                color: Colors.grey,
              );
            },
          ),
          SizedBox(height: 24),
          Text(
            _ulke.isim,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 36),
          _buildTumDetaylar(),
        ],
      ),
    );
  }

  Widget _buildTumDetaylar() {
    return Column(
      children: [
        _buildDetayRow("Ülke İsmi: ", _ulke.isim),
        _buildDetayRow("Başkent: ", _ulke.baskent),
        _buildDetayRow("Bölge: ", _ulke.bolge),
        _buildDetayRow("Nüfus: ", _ulke.nufus.toString()),
        _buildDetayRow("Dil: ", _ulke.dil),
      ],
    );
  }

  Widget _buildDetayRow(String baslik, String detay) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              baslik,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              detay,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
