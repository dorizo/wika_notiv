import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/modeloffline/Catalogsearchmodel.dart';
import 'package:wika/models/Product.dart';

class Vendoreproc extends StatefulWidget {
  const Vendoreproc({Key key}) : super(key: key);

  @override
  _VendoreprocState createState() => _VendoreprocState();
}

class _VendoreprocState extends State<Vendoreproc> {
  Catalogsearchmodel catalogs;
  int page = 0;
  int keterangan = 1;
  bool isLoading = false;
  List<Product> cataloglist = [];
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final x = jsonDecode(
        '{"Nama_barang" : "" ,"Harga_maksimal" : "" ,"Harga_minimal" : "" ,"Kategori" : "" ,"uraian" : ""}');

    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        setState(() {
          page++;
          isLoading = true;
          Refresh(
              page.toString(),
              catalogs.namaBarang,
              catalogs.hargaMaksimal,
              catalogs.hargaMinimal,
              catalogs.kategori,
              catalogs.uraian,
              catalogs.kategoriproduk);
        });
      }
    });
    setState(() {
      catalogs = Catalogsearchmodel.fromJson(x);
    });
    Refresh("0", "", "", "", "", "", "");
  }

  void Refresh(
      String halaman,
      String namabarang,
      String hargamaksimal,
      String hargaminimal,
      String kategori,
      String urutans,
      String kategoriproduk) {
    print('refresj');
    Internethttp()
        .vendoreprocinternet(halaman, '20', namabarang, hargamaksimal,
            hargaminimal, kategori, urutans, kategoriproduk)
        .then((value) {
      if (value.length == 0) {
        popupnotivikasi("Catalog Yang Anda cari kosong");
      }
      ;
      setState(() {
        keterangan = value.length;
        cataloglist.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          title: Text("Catalog List"),
          actions: [
            GestureDetector(
              child: Icon(Icons.search),
              onTap: () async {
                setState(() {
                  keterangan = 1;
                });
                final result = await Navigator.pushNamed(
                    context, "/eproccatalogsearch",
                    arguments: catalogs);
                if (result != null) {
                  Catalogsearchmodel x = result;
                  setState(() {
                    catalogs = x;
                    print(x.kategoriproduk);
                    cataloglist.clear();
                    Refresh(
                        "0",
                        catalogs.namaBarang,
                        catalogs.hargaMaksimal,
                        catalogs.hargaMinimal,
                        catalogs.kategori,
                        catalogs.uraian,
                        catalogs.kategoriproduk);
                  });
                }
              },
            )
          ],
        ),
        body: cataloglist.length != 0
            ? GridView.builder(
                controller: _controller,
                itemCount: cataloglist.length,
                itemBuilder: (context, index) {
                  return cardCatalog(cataloglist[index]);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3),
              )
            : Center(
                child: keterangan == 0
                    ? Text("Catalog Tidak Ditemukan")
                    : CircularProgressIndicator()));
  }

  void popupnotivikasi(String data) {
    final snackBar = SnackBar(
      content: Text(data),
      action: SnackBarAction(
        label: 'Keluar',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget cardCatalog(Product product) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/eproccatalogdetail",
              arguments: product);
        },
        child: Card(
          child: Column(
            children: [
              Text(
                product.nAMA,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Image.network(
                  product.fILE,
                  fit: BoxFit.cover,
                ),
              ),
              Text("Rp. " + product.hARGA)
            ],
          ),
        ),
      ),
    );
  }
}
