import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/models/bapbdetailmodel.dart';
import 'package:wika/models/bapbmodel.dart';
import 'package:wika/session.dart';
import 'package:wika/toolmanual/alertmanual.dart';

import '../../global.dart';

class Bapbdetail extends StatefulWidget {
  const Bapbdetail({Key key}) : super(key: key);

  @override
  _BapbdetailState createState() => _BapbdetailState();
}

class _BapbdetailState extends State<Bapbdetail> {
  List<Bapbdetailmodel> detail = [];
  Bapbmodel agrs;
  String aprovelvl = '0';
  String kdpat = '0';
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      agrs = ModalRoute.of(context).settings.arguments as Bapbmodel;
      setState(() {
        dxxx(agrs.nOBAPB == null ? "" : agrs.nOBAPB);
        refreshpage(agrs.nOBAPB);
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
        appBar: AppBar(
          title: Text(agrs.nOBAPB == null ? "" : agrs.nOBAPB),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "BAPB",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                agrs.nOBAPB == null ? "" : agrs.nOBAPB,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 30,
              ),
              Text(
                agrs.nOSPB != null ? agrs.nOSPB : "0",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                agrs.nAMA != null ? agrs.nAMA : "0",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                agrs.aLAMAT != null ? agrs.aLAMAT : "0",
                style: TextStyle(fontWeight: FontWeight.normal),
                textAlign: TextAlign.left,
              ),
              Divider(
                height: 30,
              ),
              Table(
                children: [
                  TableRow(children: [
                    Text("hari : "),
                    Text(agrs.tIPE == null ? "" : agrs.tIPE),
                  ]),
                  TableRow(children: [
                    Text("Tanggal Terima : "),
                    Text(agrs.tGLTERIMA == null ? "" : agrs.tGLTERIMA),
                  ]),
                  TableRow(children: [
                    Text("Surat Jalan : "),
                    Text(agrs.nOSURATJALAN == null ? "" : agrs.nOSURATJALAN),
                  ]),
                  TableRow(children: [
                    Text("No / tgl : "),
                    Text(agrs.tGLSURAT == null ? "" : agrs.tGLSURAT),
                  ]),
                ],
              ),
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
              app1(agrs.aPP1, agrs.aPP1NAME, "Mengetahui", agrs.aPP1DATE, "1"),
              app1(agrs.aPP2, agrs.aPP2NAME, "Diterima Oleh", agrs.aPP2DATE,
                  "2"),
              app1(agrs.aPP3, agrs.aPP3NAME, "Kualitas (Mutu)", agrs.aPP3DATE,
                  "3"),
              Divider(
                height: 50,
              ),
              Table(
                children: [
                  TableRow(children: [
                    Text("Penilaian Aspek Pelayanan : "),
                    Text(agrs.aSPEKLAYANAN == null ? "" : agrs.aSPEKLAYANAN),
                  ]),
                  TableRow(children: [
                    Text("Penilaian Aspek K3L : "),
                    Text(agrs.aSPEKK3 == null ? "" : agrs.aSPEKK3),
                  ]),
                  TableRow(children: [
                    Text("Catatan : "),
                    Text(agrs.cATATAN == null ? "" : agrs.cATATAN),
                  ]),
                ],
              ),
            ],
          ),
        )));
  }

  Widget cardku(Bapbdetailmodel model) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/bapbitemdetail", arguments: model);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("kode Sumber daya"),
                    Text(model.kDMATERIAL != null ? model.kDMATERIAL : "0")
                  ],
                ),
                Row(
                  children: [
                    Text("Nama Material"),
                    Text(model.uRAIAN != null ? model.uRAIAN : "0")
                  ],
                ),
                Row(
                  children: [
                    Text("Volume"),
                    Text(model.vOL != null ? model.vOL : "0")
                  ],
                ),
                Row(
                  children: [
                    Text("Volume Terima"),
                    Text(model.vOLTERIMA != null ? model.vOLTERIMA : "0")
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dxxx(String kode) {
    Internethttp().bapbdetailinternet(kode).then((value) {
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
                    : sppdnkode == null
                        ? Container()
                        : sppdnkode == '0'
                            ? FlatButton(
                                minWidth: 110,
                                onPressed: () => {
                                      if (applvl != aprovelvl)
                                        {
                                          showDialog(
                                              builder: (context) => Alertmanual().a(
                                                  context,
                                                  "Anda Tidak Memiliki Akses Approve"),
                                              context: context,
                                              barrierDismissible: false)
                                        }
                                      else
                                        {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Approve '),
                                                content: Text(
                                                    "Apakah Anda yakin untuk Approve?"),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    child: Text("YES"),
                                                    onPressed: () {
                                                      //Put your code here which you want to execute on Yes button click.
                                                      Session()
                                                          .sessionku()
                                                          .then((value) {
                                                        print(applvl);
                                                        var appjson =
                                                            jsonDecode(value);
                                                        Internethttp()
                                                            .approvebapb(
                                                                applvl,
                                                                appjson[
                                                                    'KDJBT'],
                                                                appjson['NIP'],
                                                                agrs.nOBAPB)
                                                            .then((value) {
                                                          if (value
                                                                  .statusCode ==
                                                              500) {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            var json =
                                                                jsonDecode(
                                                                    value.body);
                                                            showDialog(
                                                                builder: (context) =>
                                                                    Alertmanual().a(
                                                                        context,
                                                                        json[
                                                                            'message']),
                                                                context:
                                                                    context,
                                                                barrierDismissible:
                                                                    false);
                                                          } else {
                                                            refreshpage(
                                                                agrs.nOBAPB ==
                                                                        null
                                                                    ? ""
                                                                    : agrs
                                                                        .nOBAPB);
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
                                ))
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

  void refreshpage(String nobapb) {
    Internethttp().singlebapbinternet(nobapb).then((value) {
      setState(() {
        print(value.aPP1NAME);
        agrs.aPP1 = value.aPP1;
        agrs.aPP1EMPID = value.aPP1EMPID;
        agrs.aPP1NAME = value.aPP1NAME;
        agrs.aPP2 = value.aPP2;
        agrs.aPP2EMPID = value.aPP2EMPID;
        agrs.aPP2NAME = value.aPP2NAME;
        agrs.aPP2DATE = value.aPP2DATE;
        agrs.aPP3 = value.aPP3;
        agrs.aPP3EMPID = value.aPP3EMPID;
        agrs.aPP3NAME = value.aPP3NAME;
        agrs.aPP3DATE = value.aPP3DATE;
      });
    });
  }
}
