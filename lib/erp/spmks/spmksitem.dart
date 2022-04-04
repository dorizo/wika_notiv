import 'package:flutter/material.dart';
import 'package:wika/models/spmksdetailmodel.dart';

class Spmksitem extends StatefulWidget {
  const Spmksitem({Key key}) : super(key: key);

  @override
  _BapbitemdetailState createState() => _BapbitemdetailState();
}

class _BapbitemdetailState extends State<Spmksitem> {
  spmksdetailmodel agrs;
  @override
  Widget build(BuildContext context) {
    agrs = ModalRoute.of(context).settings.arguments as spmksdetailmodel;
    return Scaffold(
        appBar: AppBar(
          title: Text(agrs.nOSPMKS == null ? "" : agrs.nOSPMKS),
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
                              child: Text('Kode Lini ',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(agrs.kDLINI != null ? agrs.kDLINI : "",
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
                        ],
                      ),
                    ]))));
  }
}
