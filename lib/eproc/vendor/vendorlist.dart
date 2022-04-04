import 'package:flutter/material.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/models/VendorModel.dart';

class Vendorlist extends StatefulWidget {
  const Vendorlist({Key key}) : super(key: key);

  @override
  _VendorlistState createState() => _VendorlistState();
}

class _VendorlistState extends State<Vendorlist> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text("Vendor List"),
      ),
      body: FutureBuilder<List<VendorModel>>(
        future: Internethttp().vendoreproclistinternet("1", "20"),
        builder: (context, snapshot) {
          print(snapshot.error);
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return cardCatalog(snapshot.data[index]);
                    },
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }

          // return Text(snapshot.data.length.toString());
        },

        // child: new ListView.builder(itemBuilder: (context, index) {
        //   return Text("d");
        // }),
      ),
    );
  }

  Widget cardCatalog(VendorModel product) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/eprocvendordetail",
              arguments: product);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Nama Vendor",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Text(
                      product.nAMA,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "ALAMAT",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(product.aLAMAT != null ? product.aLAMAT : 'Tanpa No telp'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "NO TELP",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(product.tELP != null ? product.tELP : 'Tanpa No telp')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
