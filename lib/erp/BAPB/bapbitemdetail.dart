import 'package:flutter/material.dart';
import 'package:wika/models/bapbdetailmodel.dart';

class Bapbitemdetail extends StatefulWidget {
  const Bapbitemdetail({Key key}) : super(key: key);

  @override
  _BapbitemdetailState createState() => _BapbitemdetailState();
}

class _BapbitemdetailState extends State<Bapbitemdetail> {
  Bapbdetailmodel agrs;
  @override
  Widget build(BuildContext context) {
    agrs = ModalRoute.of(context).settings.arguments as Bapbdetailmodel;
    return Scaffold(
        appBar: AppBar(
          title: Text(agrs.nOSPPBJ == null ? "" : agrs.nOSPPBJ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("BAPD"),
                      SizedBox(
                        height: 10,
                      ),
                      Table(
                        border: TableBorder.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Kode Sumberdaya',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                  agrs.kDMATERIAL == null
                                      ? ""
                                      : agrs.kDMATERIAL,
                                  style: TextStyle(fontSize: 14.0)),
                            )
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Nama Barang',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(agrs.uRAIAN != null ? agrs.uRAIAN : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Spesifikasi',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(
                                agrs.sPESIFIKASI != null
                                    ? agrs.sPESIFIKASI
                                    : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('satuan',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(agrs.sATUAN != null ? agrs.sATUAN : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('volume',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(agrs.vOL != null ? agrs.vOL : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('volume Terima',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(agrs.vOLTERIMA != null ? agrs.vOLTERIMA : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('catatan',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(agrs.qC != null ? agrs.qC : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('No Sppbj',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(agrs.nOSPPBJ != null ? agrs.nOSPPBJ : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                        ],
                      ),
                    ]))));
  }
}
