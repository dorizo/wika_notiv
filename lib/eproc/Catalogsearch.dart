import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/modeloffline/Catalogsearchmodel.dart';
import 'package:wika/models/Kategoriprodukmodel.dart';

class Catalogsearch extends StatefulWidget {
  const Catalogsearch({Key key}) : super(key: key);

  @override
  _CatalogsearchState createState() => _CatalogsearchState();
}

class _CatalogsearchState extends State<Catalogsearch> {
  Catalogsearchmodel agrs;
  TextEditingController nmbarang = TextEditingController();
  TextEditingController hargamax = TextEditingController();
  TextEditingController hargamin = TextEditingController();
  List<Kategoriprodukmodel> kategorimodels = [];
  String kategoriproduk;
  String kategori;
  String urutan;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      agrs = ModalRoute.of(context).settings.arguments as Catalogsearchmodel;
      setState(() {
        nmbarang.text = agrs?.namaBarang;
        hargamax.text = agrs?.hargaMaksimal;
        hargamin.text = agrs?.hargaMinimal;
        print(agrs?.uraian);
        agrs?.kategori != "" ? kategori = agrs?.kategori : "";
        agrs?.uraian != "" ? urutan = agrs?.uraian : "";
        agrs?.kategoriproduk != "" ? kategoriproduk = agrs?.kategoriproduk : "";
      });
      Internethttp().kategoriproduk().then((value) {
        // print(jsonDecode(value.body));
        setState(() {
          List p = jsonDecode(value.body);

          kategorimodels.addAll(
              p.map((e) => new Kategoriprodukmodel.fromJson(e)).toList());
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Seacrh Catalog"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: nmbarang,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.format_list_numbered),
                  hintText: 'Nama Barang',
                  labelText: 'Nama Barang',
                  border: const OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: hargamax,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.format_list_numbered),
                  hintText: 'Harga Maximal',
                  labelText: 'Harga Maximal',
                  border: const OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: hargamin,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.format_list_numbered),
                  hintText: 'Harga Minimal',
                  labelText: 'Harga Minimal',
                  border: const OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              kategorimodels.length == 0
                  ? Container()
                  : DropdownButton<String>(
                      isExpanded: true,
                      hint: Text("Select The Category"),
                      value: kategoriproduk,
                      items: kategorimodels.map<DropdownMenuItem<String>>(
                          (Kategoriprodukmodel e) {
                        return DropdownMenuItem<String>(
                          value: e.kODE,
                          child: Text(e.uRAIAN),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          print(value);
                          kategoriproduk = value;
                        });
                      },
                    ),
              SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                isExpanded: true,
                hint: Text("Select The Status"),
                value: kategori,
                items: <String>['Suku Cadang', 'Material', 'jasa']
                    .map((String value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    print(value);
                    kategori = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                isExpanded: true,
                hint: Text("Urutkan Berdasarkan"),
                value: urutan,
                items: <String>['Harga Tertinggi', 'Harga Terendah']
                    .map((String value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    print(value);
                    urutan = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextButton.icon(
                  onPressed: () {
                    setState(() {
                      final x = jsonDecode('{"Nama_barang" : "' +
                          nmbarang.text +
                          '" ,"Harga_maksimal" : "' +
                          hargamax.text +
                          '" ,"Harga_minimal" : "' +
                          hargamin.text +
                          '" ,"Kategori" : "' +
                          (kategori == null ? "" : kategori) +
                          '" ,"kategoriproduk" : "' +
                          (kategoriproduk == null ? "" : kategoriproduk) +
                          '" ,"uraian" : "' +
                          (urutan == null ? "" : urutan) +
                          '"}');

                      agrs = Catalogsearchmodel.fromJson(x);
                    });
                    Navigator.pop(context, agrs);
                  },
                  icon: Icon(Icons.search),
                  label: Text("Search"))
            ],
          ),
        ),
      ),
    );
  }
}
