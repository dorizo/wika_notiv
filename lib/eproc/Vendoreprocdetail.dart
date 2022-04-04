import 'package:flutter/material.dart';
import 'package:wika/models/Product.dart';

class Vendoreprocdetail extends StatefulWidget {
  const Vendoreprocdetail({Key key}) : super(key: key);

  @override
  _VendoreprocdetailState createState() => _VendoreprocdetailState();
}

class _VendoreprocdetailState extends State<Vendoreprocdetail> {
  @override
  Widget build(BuildContext context) {
    final agrs = ModalRoute.of(context).settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(agrs.nAMA),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              agrs.nAMA,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Image.network(agrs.fILE),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Text("Kategori")),
                    Text(agrs.kATEGORIUR)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Text("Nama Vendor")),
                    Text(agrs.nAMATRADER)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Text("Harga")),
                    Text("Rp " + agrs.hARGA)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
