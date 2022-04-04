import 'package:flutter/material.dart';
import 'package:wika/models/spbdetailitemmodel.dart';
import 'package:wika/toolmanual/alertmanual.dart';

class Spbitem extends StatefulWidget {
  const Spbitem({Key key}) : super(key: key);

  @override
  _SpbitemState createState() => _SpbitemState();
}

class _SpbitemState extends State<Spbitem> {
  Spbdetailitemmodel agrs;
  var ckvalue = [];
  @override
  void initState() {
    super.initState();
    ckvalue.add(false);
    ckvalue.add(false);
    ckvalue.add(false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<dynamic> a = ModalRoute.of(context).settings.arguments;
      print(a[1]);
      if (a[1]) {
        setState(() {
          ckvalue[0] = true;
          ckvalue[1] = true;
          ckvalue[2] = true;
        });
      } else {
        setState(() {
          ckvalue[0] = false;
          ckvalue[1] = false;
          ckvalue[2] = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> a = ModalRoute.of(context).settings.arguments;
    agrs = a[0] as Spbdetailitemmodel;

    return Scaffold(
        appBar: AppBar(
          title: Text(agrs.nOSPPBJ == null ? "-" : agrs.nOSPPBJ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                      ? "-"
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
                              child: Text('Volume sppdn',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            CheckboxListTile(
                                activeColor: Colors.pink[300],
                                dense: true,
                                //font change
                                title: new Text(
                                  agrs.vOL,
                                ),
                                selected: ckvalue[1],
                                value: ckvalue[1],
                                onChanged: (bool val) {
                                  setState(() {
                                    ckvalue[1] = true;
                                  });
                                })
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Tanggal',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            CheckboxListTile(
                                activeColor: Colors.pink[300],
                                dense: true,
                                //font change
                                title: new Text(
                                  agrs.tglsurat == null
                                      ? "Tanggal Null"
                                      : agrs.tglsurat,
                                ),
                                selected: ckvalue[2],
                                value: ckvalue[2],
                                onChanged: (bool val) {
                                  setState(() {
                                    ckvalue[2] = true;
                                  });
                                })
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Volume Terpenuhi',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(
                                agrs.sTATUSPERSEN != null
                                    ? agrs.sTATUSPERSEN
                                    : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Harga Satuan',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            CheckboxListTile(
                                activeColor: Colors.pink[300],
                                dense: true,
                                //font change
                                title: new Text(
                                  agrs.hARGA == null ? "" : agrs.hARGA,
                                ),
                                selected: ckvalue[0],
                                value: ckvalue[0],
                                onChanged: (bool val) {
                                  setState(() {
                                    ckvalue[0] = true;
                                  });
                                })
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
                              child: Text('volume Rencana',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(agrs.vOL != null ? agrs.vOL : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('volume Realisasi',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(agrs.cAPEX != null ? agrs.cAPEX : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Rencana Pemakaian Tanggal 1',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(
                                agrs.sTATUSPERSEN != null
                                    ? agrs.sTATUSPERSEN
                                    : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Rencana Pemakaian Tanggal 2',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(
                                agrs.sTATUSPERSEN != null
                                    ? agrs.sTATUSPERSEN
                                    : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Rencana Pemakaian Peruntukan',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(
                                agrs.sTATUSPERSEN != null
                                    ? agrs.sTATUSPERSEN
                                    : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Rencana Diterima Tanggal 1',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(
                                agrs.sTATUSPERSEN != null
                                    ? agrs.sTATUSPERSEN
                                    : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            if (ckvalue.contains(false)) {
                              print(ckvalue);
                              showDialog(
                                  builder: (context) => Alertmanual().a(
                                      context, "Anda belum ceklist semua data"),
                                  context: context,
                                  barrierDismissible: false);
                              print("anda belum ceklist semua data");
                            } else {
                              Navigator.of(context).pop(true);
                            }
                          },
                          child: Container(
                              width: double.infinity,
                              color: Colors.green,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Confirmasi Ceklist",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              )))
                    ]))));
  }
}
