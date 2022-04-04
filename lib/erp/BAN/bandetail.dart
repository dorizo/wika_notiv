import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wika/global.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/models/BanModel.dart';
import 'package:wika/models/BanmodelDetail.dart';
import 'package:wika/session.dart';
import 'package:wika/toolmanual/alertmanual.dart';

class Bandetail extends StatefulWidget {
  const Bandetail({Key key}) : super(key: key);

  @override
  _SppdndetailState createState() => _SppdndetailState();
}

class _SppdndetailState extends State<Bandetail> {
  List<BanmodelDetail> detail = [];
  BanModel agrs;
  String aprovelvl = '0';
  var kdpat = '0';
  @override
  void dispose() {
    print("FirstRoute: dispose");
    super.dispose();
  }

  @override
  void deactivate() {
    print("FirstRoute: deactivate");
    super.deactivate();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      agrs = ModalRoute.of(context).settings.arguments as BanModel;
      print(agrs.nOBAN);
      Internethttp().bandetailinternet(agrs.nOBAN).then((value) {
        setState(() {
          detail.addAll(value);
        });
      });
      refreshpage(agrs.nOBAN);
      Session().sessionku().then((value) {
        var appjson = jsonDecode(value)['kd_jbt'];
        print(value);
        var applevelku = jsonDecode(applevel);
        setState(() {
          kdpat = jsonDecode(value)['kd_pat'];
          // aprovelvl = jsonDecode(applevelku[appjson]);
          var xu = applevelku[appjson];
          print(xu);
          if (xu.containsKey("SPPDN")) {
            aprovelvl = xu["SPPDN"];
          } else {
            aprovelvl = "0";
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    agrs = ModalRoute.of(context).settings.arguments as BanModel;
    return Scaffold(
        appBar: AppBar(
          title: Text(agrs.nOBAN != null ? agrs.nOBAN : ""),
        ),
        body: agrs.nOBAN != null
            ? SingleChildScrollView(
                child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("BAN"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      agrs.nOBAN,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      agrs.nOBAN,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Table(
                      children: [
                        TableRow(
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Text(
                            //     "Kepada : ",
                            //     style: TextStyle(fontWeight: FontWeight.bold),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text(agrs.tGLBAN == null ? "" : agrs.tGLBAN),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Text(
                            //     "",
                            //     style: TextStyle(fontWeight: FontWeight.bold),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(agrs.nAMA == null ? "" : agrs.nAMA),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Text(
                            //     "KODE PAT : ",
                            //     style: TextStyle(fontWeight: FontWeight.bold),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text(agrs.aLAMAT == null ? "" : agrs.aLAMAT),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        agrs.cONTACTPERSON != 0 ? agrs.cONTACTPERSON : "",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        agrs.tELP != 0 ? agrs.tELP : "",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        agrs.nOPENAWARAN != null ? agrs.nOPENAWARAN : "-",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    detail.length != 0
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: detail.length,
                            itemBuilder: (context, index) {
                              return Cardku(detail[index]);
                            })
                        : Center(child: CircularProgressIndicator()),
                    Divider(
                      height: 50,
                    ),
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      // border: TableBorder.symmetric(
                      //     inside: BorderSide(width: 2, color: Colors.blue),
                      //     outside: BorderSide(width: 3, color: Colors.blue)),
                      children: [
                        TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TableCell(child: Text("PPh Pasal")),
                              ),
                              Text("c"),
                            ],
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            )),
                        TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TableCell(child: Text("PPH")),
                              ),
                              Text(agrs.pPH != null ? agrs.pPH + "%" : ""),
                            ],
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            )),
                        TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    TableCell(child: Text("Tanggal Pesanan")),
                              ),
                              Text(agrs.tGLAWAL != null ? agrs.tGLAWAL : ""),
                            ],
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                            )),
                        TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TableCell(child: Text("Penyerahan")),
                              ),
                              Text(agrs.tGLAKHIR != null ? agrs.tGLAKHIR : ""),
                            ],
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            )),
                        TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    TableCell(child: Text("Jenis Pembayaran")),
                              ),
                              Text(agrs.jENISPEMBAYARAN != null
                                  ? agrs.jENISPEMBAYARAN
                                  : ""),
                            ],
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                            )),
                        TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TableCell(child: Text("Pembayaran")),
                              ),
                              Text(agrs.pEMBAYARAN != null
                                  ? agrs.pEMBAYARAN
                                  : ""),
                            ],
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            )),
                        TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TableCell(
                                    child: Text("Keterangan Pembayaran")),
                              ),
                              Text(agrs.kETPEMBAYARAN != null
                                  ? agrs.kETPEMBAYARAN
                                  : ""),
                            ],
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                            )),
                        TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    TableCell(child: Text("Tujuan Penyerahan")),
                              ),
                              Text(agrs.tUJUANPENYERAHAN != null
                                  ? agrs.tUJUANPENYERAHAN
                                  : ""),
                            ],
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ))
                      ],
                    ),
                    Divider(
                      height: 50,
                    ),
                    app1(agrs.aPP1, agrs.aPP1NAME, "Disetujui oleh",
                        agrs.aPP1DATE, "1"),
                    app1(agrs.aPP2, agrs.aPP1NAME, "Disetujui oleh",
                        agrs.aPP2DATE, "2"),
                    Divider(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Text("catatan : "),
                        Expanded(
                            child: Text(
                                agrs.aPP1NAME != null ? agrs.aPP1NAME : ""))
                      ],
                    )
                  ],
                ),
              ))
            : CircularProgressIndicator());
  }

  Widget app1(String sppdnkode, String name, String aprove, String tanggal,
      String applvl) {
    return GestureDetector(
      onTap: () {},
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Table(
                    children: [
                      TableRow(children: [
                        Text(aprove,
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                      TableRow(
                          children: [Text(tanggal != null ? tanggal : "")]),
                    ],
                  ),
                ),
                sppdnkode == null
                    ? Container()
                    : sppdnkode == '0'
                        ? Column(
                            children: [
                              if (kdpat == agrs.pATBAN ||
                                  kdpat == agrs.pATVENDOR) ...[
                                FlatButton(
                                    minWidth: 110,
                                    onPressed: () => {
                                          if (applvl != aprovelvl)
                                            {
                                              showDialog(
                                                  builder: (context) =>
                                                      Alertmanual().a(context,
                                                          "Anda Tidak Memiliki Akses Approve"),
                                                  context: context,
                                                  barrierDismissible: false)
                                            }
                                          else
                                            {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text('Approve '),
                                                    content: Text(
                                                        "Apakah Anda yakin untuk Approve?"),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text("YES"),
                                                        onPressed: () {
                                                          Session()
                                                              .sessionku()
                                                              .then((value) {
                                                            var appjson =
                                                                jsonDecode(
                                                                    value);
                                                            Internethttp()
                                                                .approveAll(
                                                                    applvl,
                                                                    appjson[
                                                                        'kd_jbt'],
                                                                    appjson[
                                                                        'user_id'],
                                                                    agrs.nOBAN)
                                                                .then((value) {
                                                              if (value
                                                                      .statusCode ==
                                                                  500) {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                var json =
                                                                    jsonDecode(
                                                                        value
                                                                            .body);
                                                                showDialog(
                                                                    builder: (context) => Alertmanual().a(
                                                                        context,
                                                                        json[
                                                                            'message']),
                                                                    context:
                                                                        context,
                                                                    barrierDismissible:
                                                                        false);
                                                              } else {
                                                                refreshpage(
                                                                    agrs.nOBAN);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              }
                                                              print(value.body);
                                                            });
                                                          });
                                                        },
                                                      ),
                                                      FlatButton(
                                                        child: Text("NO"),
                                                        onPressed: () {
                                                          //Put your code here which you want to execute on No button click.
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              )
                                            }
                                        },
                                    color: Colors.red,
                                    child: Row(
                                      children: [
                                        Icon(Icons.close),
                                        Text("prosess"),
                                      ],
                                    )),
                              ] else ...[
                                Container(
                                  child: Text("Not Aksess"),
                                ),
                              ]
                            ],
                          )
                        : FlatButton(
                            minWidth: 110,
                            onPressed: () {},
                            color: Colors.green,
                            child: Row(
                              children: [
                                Icon(Icons.check_sharp),
                                Text(name != null ? name : "Approve"),
                              ],
                            ))
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget Cardku(BanmodelDetail detail) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/banitem", arguments: detail);
      },
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Table(
                    children: [
                      TableRow(children: [
                        Text(
                            detail.kDMATERIAL != null ? detail.kDMATERIAL : ""),
                        Text(detail.uRAIAN != null ? detail.uRAIAN : "")
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget refreshpage(String kode) {
    Internethttp().singlebaninternet(kode).then((value) {
      setState(() {
        agrs.aPP1 = value.aPP1;
        agrs.aPP1NAME = value.aPPs1;
        agrs.aPP1DATE = value.aPP1DATE;
        agrs.aPP2 = value.aPP2;
        agrs.aPP2NAME = value.aPPs2;
        agrs.aPP2DATE = value.aPP2DATE;
      });
    });
  }
}
