import 'package:flutter/material.dart';
import 'package:wika/models/negosiasimodel.dart';

class negosiasidetail extends StatefulWidget {
  const negosiasidetail({Key key}) : super(key: key);

  @override
  _negosiasidetailState createState() => _negosiasidetailState();
}

class _negosiasidetailState extends State<negosiasidetail> {
  @override
  Widget build(BuildContext context) {
    final agrs = ModalRoute.of(context).settings.arguments as negosiasimodel;
    return Scaffold(
        appBar: AppBar(
          title: Text(agrs.nAMA),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
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
                        agrs.nAMA,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        "TRADER ID",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        agrs.tRADERID != null ? agrs.tRADERID : "",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "keterangan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        agrs.kETERANGAN != null ? agrs.kETERANGAN : "",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Grup",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        agrs.gRUP != null ? agrs.gRUP : "",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "uraian",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        agrs.uRAIAN != null ? agrs.uRAIAN : "",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        agrs.gRUP != null ? agrs.gRUP : "",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "status",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        agrs.status != null ? agrs.status : "",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
