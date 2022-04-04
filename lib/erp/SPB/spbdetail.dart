import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/models/spbdetailitemmodel.dart';
import 'package:wika/models/spbmodel.dart';
import 'package:wika/session.dart';
import 'package:wika/toolmanual/alertmanual.dart';

import '../../global.dart';

class Spbdetail extends StatefulWidget {
  const Spbdetail({Key key}) : super(key: key);

  @override
  _SpbdetailState createState() => _SpbdetailState();
}

class _SpbdetailState extends State<Spbdetail> {
  Spbmodel agrs;
  List<Spbdetailitemmodel> detail = [];
  String aprovelvl = '0';
  var arraycekdata = [];
  var kdpat;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        agrs = ModalRoute.of(context).settings.arguments as Spbmodel;
        print("appss" + agrs.aPP1);
        Internethttp().spbdetailinternet(agrs.nOSPB).then((value) {
          setState(() {
            detail.addAll(value);
            for (var i = 0; i < detail.length; i++) {
              arraycekdata.add(false);
            }
          });
        });
      });
      refreshpage(agrs.nOSPB);
      Session().sessionku().then((value) {
        var appjson = jsonDecode(value)['kd_jbt'];
        print(value);
        var applevelku = jsonDecode(applevel);
        setState(() {
          kdpat = jsonDecode(value)['kd_pat'];
          // aprovelvl = jsonDecode(applevelku[appjson]);
          var xu = applevelku[appjson];
          print(xu);
          if (kdpat == "0A") {
            if (xu["SPBPUSAT"] == null) {
              aprovelvl = '0';
            } else {
              aprovelvl = xu["SPBPUSAT"];
            }
          } else {
            if (xu["SPBPUSAT"] == null) {
              aprovelvl = '0';
            } else {
              aprovelvl = xu["SPBPABRIK"];
            }
          }
          print("approve" + aprovelvl);
        });
      });
      // Session().sessionku().then((value) {
      //   var appjson = jsonDecode(jsonDecode(value)['APP_LVL'])['SPB'];
      //   setState(() {
      //     aprovelvl = appjson['CEK_LEVEL'];
      //   });
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    agrs = ModalRoute.of(context).settings.arguments as Spbmodel;
    return Scaffold(
        appBar: AppBar(
          title: Text(agrs.nOSPPBJ != null ? agrs.nOSPPBJ : ""),
        ),
        body: agrs.nOSPPBJ != null
            ? SingleChildScrollView(
                child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("SPB"),
                    SizedBox(
                      height: 20,
                    ),
                    Text(agrs.nAMAVENDOR == null ? "" : agrs.nOSPPBJ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(agrs.tGLSURAT == null ? "" : agrs.tGLSURAT),
                    SizedBox(
                      height: 5,
                    ),
                    Text(agrs.nOSPB == null ? "" : agrs.nOSPB),
                    SizedBox(
                      height: 5,
                    ),
                    Text(agrs.tGLSPB == null ? "" : agrs.tGLSPB),
                    SizedBox(
                      height: 5,
                    ),
                    Text(agrs.nAMAVENDOR != null ? agrs.nAMAVENDOR : ""),
                    SizedBox(
                      height: 5,
                    ),
                    Text(agrs.aLAMATVENDOR != null
                        ? agrs.aLAMATVENDOR
                        : "Tidak Ada Alamat"),
                    SizedBox(
                      height: 5,
                    ),
                    Text(agrs.eMAILVENDOR != null
                        ? agrs.nAMAVENDOR
                        : "email tidak ada"),
                    SizedBox(
                      height: 5,
                    ),
                    Text(agrs.vENDORID != null ? agrs.vENDORID : ""),
                    SizedBox(
                      height: 5,
                    ),
                    Text(agrs.pATSPB != null ? agrs.pATSPB : ""),
                    Divider(
                      height: 30,
                    ),
                    Text("PENGIRIMAN : [ " +
                        (agrs.kETPENYERAHAN != null ? agrs.kETPENYERAHAN : "") +
                        " ]"),
                    Text(agrs.aLAMATPENGIRIMAN != null
                        ? agrs.aLAMATPENGIRIMAN
                        : "Alamat Pengiriman tidak Ada"),
                    Text(
                      (agrs.tGLAMBIL != null
                              ? agrs.tGLAMBIL
                              : "tanggal ambil Kosong") +
                          ' -> ' +
                          (agrs.tGLDATANG != null
                              ? agrs.tGLDATANG
                              : "tanggal datang Kosong"),
                      style: TextStyle(fontWeight: FontWeight.normal),
                      textAlign: TextAlign.left,
                    ),
                    Text(agrs.jENISPEMBAYARAN != null
                        ? agrs.jENISPEMBAYARAN
                        : "jenis pembayaran kosong"),
                    Text("Pembayaran SCF : " +
                        (agrs.pEMBAYARANSCF != null
                            ? agrs.pEMBAYARANSCF
                            : "0") +
                        " Hari"),
                    Divider(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "NO BAN : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: Text(
                          agrs.nOBAN == null ? "" : agrs.nOBAN,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                      ],
                    ),
                    detail == null
                        ? Container()
                        : detail.length != 0
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: detail.length,
                                itemBuilder: (context, index) {
                                  print(arraycekdata[index]);
                                  return Cardku(detail[index], index);
                                })
                            : Center(child: CircularProgressIndicator()),
                    Divider(
                      height: 50,
                    ),
                    app1(agrs.aPP1, agrs.aPP1NAME, "Mengetahui", agrs.aPP1DATE,
                        "1"),
                    app1(agrs.aPP2, agrs.aPP2NAME, "Dipesan Oleh",
                        agrs.aPP2DATE, "2"),
                    // app1(agrs.aPP3, agrs.aPPs3, "Pemohon", agrs.aPP3DATE, "3"),
                    Divider(
                      height: 50,
                    ),
                    Table(
                      children: [
                        TableRow(children: [
                          Text("Total"),
                          Text(agrs.tOTALHARGA != null ? agrs.tOTALHARGA : "0")
                        ]),
                        TableRow(children: [
                          Text("PPN"),
                          Text(agrs.pPN != null ? agrs.pPN : "0")
                        ]),
                        TableRow(children: [
                          Text("Jumlah"),
                          Text(agrs.tOTALHARGARP != null
                              ? agrs.tOTALHARGARP
                              : "0")
                        ]),
                        TableRow(children: [
                          Text("PPH"),
                          Text(agrs.pPH != null ? agrs.pPH : "0")
                        ])
                      ],
                    ),
                    Row(
                      children: [
                        Text("Spesifikasi Teknis"),
                        Text(agrs.sPEKTEKNIS != null ? agrs.sPEKTEKNIS : "")
                      ],
                    )
                  ],
                ),
              ))
            : Center(child: CircularProgressIndicator()));
  }

  Widget Cardku(Spbdetailitemmodel detail, int index) {
    return GestureDetector(
      onTap: () async {
        print(arraycekdata[index]);
        final result = await Navigator.pushNamed(context, "/Spbitem",
            arguments: [detail, arraycekdata[index]]);
        if (result == true) {
          setState(() {
            arraycekdata[index] = true;
            print(arraycekdata);
            arraycekdata.contains(false);
          });
          print('data benar ya');
        }
      },
      child: Card(
          color: arraycekdata[index] ? Colors.grey[600] : Colors.white,
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
                            Text(detail.kDMATERIAL == null
                                ? ""
                                : detail.kDMATERIAL)
                          ]),
                          TableRow(children: [
                            Text('Nama Material'),
                            Text(detail.uRAIAN == null ? "" : detail.uRAIAN)
                          ]),
                          // TableRow(children: [
                          //   Text('Volume Sppdn'),
                          //   Text(detail.vOLSPPBJCOUNT + ' ' + detail.sATUAN)
                          // ]),
                          // TableRow(children: [
                          //   Text('Volume Terpenuhi'),
                          //   Text("null")
                          // ]),
                          // TableRow(children: [
                          //   Text('Volume SPB'),
                          //   Text(detail.vOL + ' ' + detail.sATUAN)
                          // ])
                        ],
                      ),
                    ),
                    detail.vOLSPPBJCOUNT == null
                        ? Container()
                        : double.parse(detail.vOLSPPBJCOUNT) >
                                double.parse(detail.vOL)
                            ? FlatButton(
                                minWidth: 110,
                                onPressed: () => {},
                                color: Colors.red,
                                child: Row(
                                  children: [
                                    Icon(Icons.lock_open),
                                    Text("OPEN"),
                                  ],
                                ))
                            : FlatButton(
                                minWidth: 110,
                                onPressed: () => {},
                                color: Colors.green,
                                child: Row(
                                  children: [
                                    Icon(Icons.lock),
                                    Text("CLOSE"),
                                  ],
                                ))
                  ],
                ),
              ],
            ),
          )),
    );
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
                        ? applvl != aprovelvl
                            ? Container()
                            : Column(
                                children: [
                                  if (kdpat == agrs.pATSPB ||
                                      kdpat == agrs.pATTO) ...[
                                    arraycekdata.contains(false)
                                        ? Container(
                                            child:
                                                Text("Item Harus Di ceklist"),
                                          )
                                        : FlatButton(
                                            minWidth: 110,
                                            onPressed: () => {
                                                  if (applvl != aprovelvl)
                                                    {
                                                      showDialog(
                                                          builder: (context) =>
                                                              Alertmanual().a(
                                                                  context,
                                                                  "Anda Tidak Memiliki Akses Approve"),
                                                          context: context,
                                                          barrierDismissible:
                                                              false)
                                                    }
                                                  else
                                                    {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Approve '),
                                                            content: Text(
                                                                "Apakah Anda yakin untuk Approve?"),
                                                            actions: <Widget>[
                                                              FlatButton(
                                                                child:
                                                                    Text("YES"),
                                                                onPressed: () {
                                                                  //Put your code here which you want to execute on Yes button click.
                                                                  Session()
                                                                      .sessionku()
                                                                      .then(
                                                                          (value) {
                                                                    var appjson =
                                                                        jsonDecode(
                                                                            value);
                                                                    Internethttp()
                                                                        .approvespb(
                                                                            applvl,
                                                                            appjson[
                                                                                'kd_jbt'],
                                                                            appjson[
                                                                                'user_id'],
                                                                            agrs
                                                                                .nOSPB)
                                                                        .then(
                                                                            (value) {
                                                                      if (value
                                                                              .statusCode ==
                                                                          500) {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                        var json =
                                                                            jsonDecode(value.body);
                                                                        showDialog(
                                                                            builder: (context) =>
                                                                                Alertmanual().a(context, json['message']),
                                                                            context: context,
                                                                            barrierDismissible: false);
                                                                      } else {
                                                                        refreshpage(
                                                                            agrs.nOSPB);
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      }
                                                                      print(value
                                                                          .body);
                                                                    });
                                                                  });
                                                                },
                                                              ),
                                                              FlatButton(
                                                                child:
                                                                    Text("NO"),
                                                                onPressed: () {
                                                                  //Put your code here which you want to execute on No button click.
                                                                  Navigator.of(
                                                                          context)
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
                                    Container(child: Text("NOT Akses Approve")),
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

  Widget refreshpage(String noSPB) {
    // return "sss";
    Internethttp().singlespbinternet(noSPB).then((value) {
      print("refresh" + value.aPP1);
      setState(() {
        agrs.aPP1 = value.aPP1;
        agrs.aPP1NAME = value.aPP1NAME;
        agrs.aPP1DATE = value.aPP1DATE;
        agrs.aPP1EMPID = value.aPP1EMPID;
        agrs.aPP2 = value.aPP2;
        agrs.aPP2NAME = value.aPP2NAME;
        agrs.aPP2DATE = value.aPP2DATE;
        agrs.aPP2EMPID = value.aPP2EMPID;
      });
    });
  }
}
