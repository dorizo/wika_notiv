import 'package:flutter/material.dart';
import 'package:wika/library/currency.dart';
import 'package:wika/models/Invoicedetailmodel.dart';
import 'package:wika/models/spbdetailitemmodel.dart';

class Invoiceitem extends StatefulWidget {
  const Invoiceitem({Key key}) : super(key: key);

  @override
  _SpbitemState createState() => _SpbitemState();
}

class _SpbitemState extends State<Invoiceitem> {
  Invoicedetailmodel agrs;
  @override
  Widget build(BuildContext context) {
    agrs = ModalRoute.of(context).settings.arguments as Invoicedetailmodel;
    return Scaffold(
        appBar: AppBar(
          title: Text(agrs.nOSPB),
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
                              child: Text('No SPB',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(agrs.nOSPB,
                                  style: TextStyle(fontSize: 14.0)),
                            )
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('No BAPB',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(agrs.nOBAPB,
                                  style: TextStyle(fontSize: 14.0)),
                            )
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Kode Material',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(agrs.kDMATERIAL,
                                  style: TextStyle(fontSize: 14.0)),
                            )
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Material',
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
                              child: Text('Volume',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(agrs.vOLUME != null ? agrs.vOLUME : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Harga satuan',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(agrs.sATUAN != null ? agrs.sATUAN : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('total',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(
                                agrs.hARGA != null
                                    ? Currency().rupiah(agrs.hARGA)
                                    : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Keterangan',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(agrs.kETERANGAN != null ? agrs.kETERANGAN : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                        ],
                      ),
                    ]))));
  }
}
