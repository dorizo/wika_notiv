import 'package:flutter/material.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/models/DocumenTerupload_model.dart';

class Dokumenterupload extends StatefulWidget {
  const Dokumenterupload({Key key}) : super(key: key);

  @override
  _DokumenteruploadState createState() => _DokumenteruploadState();
}

class _DokumenteruploadState extends State<Dokumenterupload> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text("Dokumen Terupload List"),
      ),
      body: FutureBuilder<List<DocumenTerupload_model>>(
        future: Internethttp().docuementteruploadinternet("1", "20"),
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

  Widget cardCatalog(DocumenTerupload_model product) {
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
                  "Masa Berlaku",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(product.tGLKADALUARSA != null
                    ? product.tGLKADALUARSA
                    : 'Tanggal Tidak Terinput'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "No Document",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(product.nOMOR != null
                    ? product.nOMOR
                    : 'No Document tidak ada')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
