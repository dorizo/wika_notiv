import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wika/global.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/models/Sppdndetailmodel.dart';
import 'package:wika/models/sppdnmodel.dart';
import 'package:wika/session.dart';
import 'package:wika/toolmanual/alertmanual.dart';

class Sppdndetail extends StatefulWidget {
  const Sppdndetail({Key key}) : super(key: key);

  @override
  _SppdndetailState createState() => _SppdndetailState();
}

class _SppdndetailState extends State<Sppdndetail> {
  List<Sppdndetailmodel> detail = [];
  Sppdnmodel agrs;
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
      agrs = ModalRoute.of(context).settings.arguments as Sppdnmodel;
      print(agrs.nOSPPBJ);
      Internethttp().sppdndetailinternet(agrs.nOSPPBJ).then((value) {
        setState(() {
          detail.addAll(value);
        });
      });
      refreshpage(agrs.nOSPPBJ);
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
    agrs = ModalRoute.of(context).settings.arguments as Sppdnmodel;
    return Scaffold(
        appBar: AppBar(
          title: Text(agrs.nOSPPBJ != null ? agrs.nOSPPBJ : ""),
        ),
        body: agrs.nOSPPBJ != null
            ? SingleChildScrollView(
                child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("SPPDN"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      agrs.nOSPPBJ,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Table(
                      children: [
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Kepada : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(agrs.pATTOKET == null ? "" : agrs.pATTOKET),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Peruntukan : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(agrs.rEQUESTER == null ? "" : agrs.rEQUESTER),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Investasi : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(agrs.iNVESTASI != "0" ? "Ya" : "Tidak"),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "KODE PAT : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(agrs.pATSPPBJ),
                          ],
                        )
                      ],
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
                    app1(agrs.aPP1, agrs.aPPs1, "Pemohon", agrs.aPP1DATE, "1"),
                    app1(agrs.aPP2, agrs.aPPs2, "Menyetujui", agrs.aPP2DATE,
                        "2"),
                    app1(agrs.aPP3, agrs.aPPs3, "Verifikasi", agrs.aPP3DATE,
                        "3"),
                    Divider(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Text("catatan : "),
                        Expanded(
                            child:
                                Text(agrs.cATATAN != null ? agrs.cATATAN : ""))
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
                              if (kdpat == agrs.pATSPPBJ ||
                                  kdpat == agrs.pATTO) ...[
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
                                                                    agrs.nOSPPBJ)
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
                                                                refreshpage(agrs
                                                                    .nOSPPBJ);
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

  Widget Cardku(Sppdndetailmodel detail) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/sppdnitemdetail", arguments: detail);
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
                        Text('Kode Material'),
                        Text(detail.kDMATERIAL)
                      ]),
                      TableRow(children: [
                        Text('Nama Material'),
                        Text(detail.uRAIAN)
                      ]),
                      TableRow(children: [
                        Text('Nama Material'),
                        Text(detail.vOL + ' ' + detail.sATUAN)
                      ])
                    ],
                  ),
                ),
                agrs.sTATUS == 'OPEN'
                    ? FlatButton(
                        minWidth: 110,
                        onPressed: () => {},
                        color: Colors.red,
                        child: Row(
                          children: [
                            Icon(Icons.lock_open),
                            Text(agrs.sTATUS),
                          ],
                        ))
                    : FlatButton(
                        minWidth: 110,
                        onPressed: () => {},
                        color: Colors.green,
                        child: Row(
                          children: [
                            Icon(Icons.lock),
                            Text(agrs.sTATUS),
                          ],
                        ))
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget refreshpage(String kode) {
    Internethttp().singlesppdninternet(kode).then((value) {
      setState(() {
        agrs.aPP1 = value.aPP1;
        agrs.aPPs1 = value.aPPs1;
        agrs.aPP1DATE = value.aPP1DATE;
        agrs.aPP2 = value.aPP2;
        agrs.aPPs2 = value.aPPs2;
        agrs.aPP2DATE = value.aPP2DATE;
        agrs.aPP3 = value.aPP3;
        agrs.aPPs3 = value.aPPs3;
        agrs.aPP3DATE = value.aPP3DATE;
      });
    });
  }
}
