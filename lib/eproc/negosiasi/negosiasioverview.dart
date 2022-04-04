import 'package:flutter/material.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/models/negosiasimodel.dart';

class Negosiasioverview extends StatefulWidget {
  const Negosiasioverview({Key key}) : super(key: key);

  @override
  _NegosiasioverviewState createState() => _NegosiasioverviewState();
}

class _NegosiasioverviewState extends State<Negosiasioverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Negosiasi"),
      ),
      body: FutureBuilder<List<negosiasimodel>>(
        future: Internethttp().negosiasimodelinternet("1", "20"),
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

  Widget cardCatalog(negosiasimodel product) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/negosiasidetail", arguments: product);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        "Nama Kebutuhan",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        product.nAMA,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Pengadan",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    product.uRAIAN != null ? product.uRAIAN : 'Urainan kosong'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Periode Penawaran",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(product.tGLAWLPEMILIHAN != null
                    ? product.tGLAWLPEMILIHAN +
                        " s/d " +
                        product.tGLAHRPEMILIHAN
                    : 'No Document tidak ada'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(product.status != null
                    ? product.status
                    : 'No Document tidak ada')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
