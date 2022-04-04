import 'package:flutter/material.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/models/negosiasimodel.dart';
import 'package:wika/models/penawaranmodel.dart';

class Jumlahpenawaranoverview extends StatefulWidget {
  const Jumlahpenawaranoverview({Key key}) : super(key: key);

  @override
  _JumlahpenawaranoverviewState createState() => _JumlahpenawaranoverviewState();
}

class _JumlahpenawaranoverviewState extends State<Jumlahpenawaranoverview> {
  @override
  Widget build(BuildContext context) {

    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text("Jumlah Penawaran"),
      ),
      body: FutureBuilder<List<penawaranmodel>>(
        future: Internethttp().jumlahpenawaraninternet("1", "20"),
        builder: (context, snapshot) {
          print(snapshot.error);
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                new Padding(
                    padding: EdgeInsets.all(10),
                    child: new Text(snapshot.data.length.toString() +" Penawaran" , style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),)
                ),
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

  Widget cardCatalog(penawaranmodel product) {
    return Container(
      child: GestureDetector(
        onTap: () {
          // Navigator.pushNamed(context, "/detaildocumenterupload",
          //     arguments: product);
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
                        "No Penawaran",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        product.nOPENAWARAN,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Penawaran",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(product.pERIHAL != null
                    ? product.pERIHAL
                    : 'Urainan kosong'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Periode Penawaran",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(product.tGLPENAWARAN != null
                    ? product.tGLPENAWARAN
                    : 'No Document tidak ada'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(product.lAMPIRAN != null
                    ? product.lAMPIRAN
                    : 'No Document tidak ada')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
