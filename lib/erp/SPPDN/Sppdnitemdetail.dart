import 'package:flutter/material.dart';
import 'package:wika/models/Sppdndetailmodel.dart';

class Sppdnitemdetail extends StatefulWidget {
  const Sppdnitemdetail({Key key}) : super(key: key);

  @override
  _SppdnitemdetailState createState() => _SppdnitemdetailState();
}

class _SppdnitemdetailState extends State<Sppdnitemdetail> {
  Sppdndetailmodel agrs;
  @override
  Widget build(BuildContext context) {
    agrs = ModalRoute.of(context).settings.arguments as Sppdndetailmodel;
    return Scaffold(
        appBar: AppBar(
          title: Text(agrs.nOSPPBJ),
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
                              child: Text(agrs.kDMATERIAL,
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
                            Text(
                                agrs.vOLDIPENUHI != null
                                    ? agrs.vOLDIPENUHI
                                    : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Rencana Pemakaian Tanggal 1',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(
                                agrs.tGLPEMAKAIAN != null
                                    ? agrs.tGLPEMAKAIAN
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
                                agrs.tGLPEMAKAIAN2 != null
                                    ? agrs.tGLPEMAKAIAN2
                                    : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Rencana Pemakaian Peruntukan',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(agrs.pERUNTUKAN != null ? agrs.pERUNTUKAN : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Rencana Diterima Tanggal 1',
                                  style: TextStyle(fontSize: 14.0)),
                            ),
                            Text(
                                agrs.tGLDITERIMA != null
                                    ? agrs.tGLDITERIMA
                                    : "",
                                style: TextStyle(fontSize: 14.0))
                          ]),
                        ],
                      ),
                    ]))));
  }
}
