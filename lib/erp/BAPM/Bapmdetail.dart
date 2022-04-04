import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wika/global.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/models/Bapmdetailmodel.dart';
import 'package:wika/models/Bapmmodel.dart';
import 'package:wika/models/spmksdetailmodel.dart';
import 'package:wika/session.dart';
import 'package:wika/toolmanual/alertmanual.dart';

class Bapmdetail extends StatefulWidget {
  const Bapmdetail({Key key}) : super(key: key);

  @override
  _SpmksdetailState createState() => _SpmksdetailState();
}

class _SpmksdetailState extends State<Bapmdetail> {
  Bapmmodel agrs;

  List<Bapmdetailmodel> detail = [];
  String aprovelvl = '0';
  String kdpat = '0';
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      agrs = ModalRoute.of(context).settings.arguments as Bapmmodel;
      setState(() {
        dxxx(agrs.nOBAPM == null ? "" : agrs.nOBAPM);
        // refreshpage(agrs.nOSPMKS);
      });
    });
    Session().sessionku().then((value) {
      var appjson = jsonDecode(value)['kd_jbt'];
      print(value);
      var applevelku = jsonDecode(applevel);
      setState(() {
        kdpat = jsonDecode(value)['kd_pat'];
        var xu = applevelku[appjson];
        print(xu);
        if (xu.containsKey("invoice")) {
          aprovelvl = xu["invoice"];
        } else {
          aprovelvl = "0";
        }
      });
      print(aprovelvl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: agrs == null
          ? Container()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(agrs.nOBAPM != null ? agrs.nOBAPM : ""),
                    SizedBox(
                      height: 20,
                    ),
                    Text(agrs.tGLBAPM != null ? agrs.tGLBAPM : ""),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Material"),
                    detail.length != 0
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: detail.length,
                            itemBuilder: (context, index) {
                              return cardku(detail[index]);
                            })
                        : Center(child: CircularProgressIndicator()),
                    Divider(
                      height: 50,
                    ),
                    app1(agrs.aPP1, agrs.aPP1EMPID, "Mengetahui", agrs.aPP1DATE,
                        "1"),
                    app1(agrs.aPP2, agrs.aPP1EMPID, "Diterima Oleh",
                        agrs.aPP2DATE, "2"),
                  ],
                ),
              ),
            ),
    );
  }

  Widget cardku(Bapmdetailmodel detail) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/bapmitemdetail", arguments: detail);
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

  Widget dxxx(String kode) {
    Internethttp().bapmdetailinternet(kode).then((value) {
      // print(value.length);
      setState(() {
        detail.addAll(value);
      });
    });
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
                              if (kdpat == agrs.pATBAPM ||
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
                                                                    agrs.nOBAPM)
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
                                                                // refreshpage(
                                                                //     agrs.nOBAN);
                                                                // Navigator.of(
                                                                //         context)
                                                                //     .pop();
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
}
