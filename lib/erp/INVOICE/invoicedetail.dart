import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/models/Invoicedetailmodel.dart';
import 'package:wika/models/invoicemodel.dart';

import '../../global.dart';
import '../../session.dart';

class Invoicedetail extends StatefulWidget {
  const Invoicedetail({Key key}) : super(key: key);

  @override
  _InvoicedetailState createState() => _InvoicedetailState();
}

class _InvoicedetailState extends State<Invoicedetail> {
  Invoicemodel agrs;
  List<Invoicedetailmodel> detail = [];
  String aprovelvl = '0';
  String kdpat = '0';
  bool loading = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        agrs = ModalRoute.of(context).settings.arguments as Invoicemodel;
        Internethttp().invoicedetailinternet(agrs.nOINVOICE).then((value) {
          setState(() {
            loading = true;
            detail.addAll(value);
          });
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
    });
  }

  @override
  Widget build(BuildContext context) {
    agrs = ModalRoute.of(context).settings.arguments as Invoicemodel;
    return Scaffold(
        appBar: AppBar(
          title: Text(agrs.nOINVOICE != null ? agrs.nOINVOICE : ""),
        ),
        body: agrs.nOINVOICE != null
            ? SingleChildScrollView(
                child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("INVOICE"),
                    SizedBox(
                      height: 20,
                    ),
                    Text(agrs.nOINVOICE != null ? agrs.nOINVOICE : ""),
                    SizedBox(
                      height: 10,
                    ),
                    Text(agrs.nILAITOTAL != null ? agrs.nILAITOTAL : ""),
                    SizedBox(
                      height: 10,
                    ),
                    Text(agrs.nAMA != null ? agrs.nAMA : ""),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Tanggal Invoice"),
                        Text(agrs.tGLINVOICE != null ? agrs.tGLINVOICE : ""),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Tanggal Terima Invoice"),
                        Text(agrs.tGLTERIMA != null ? agrs.tGLTERIMA : ""),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    loading
                        ? detail.length != 0
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: detail.length,
                                itemBuilder: (context, index) {
                                  return Cardku(detail[index]);
                                })
                            : Center(child: Text('Item Kosong'))
                        : Center(child: CircularProgressIndicator()),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: agrs.fILETAGIHAN != '0'
                            ? Row(
                                children: [
                                  FlatButton(
                                      minWidth: 110,
                                      onPressed: () {},
                                      color: Colors.green,
                                      child: Row(
                                        children: [
                                          Icon(Icons.check_sharp),
                                          Text("Tagihan"),
                                        ],
                                      )),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  FlatButton(
                                      minWidth: 110,
                                      onPressed: () {
                                        Navigator.pushNamed(context, "/pdfview",
                                            arguments: agrs);
                                      },
                                      color: Colors.blue,
                                      child: Row(
                                        children: [
                                          Icon(Icons.remove_red_eye_sharp),
                                          Text("View"),
                                        ],
                                      ))
                                ],
                              )
                            : Row(
                                children: [
                                  FlatButton(
                                      minWidth: 110,
                                      onPressed: () {},
                                      color: Colors.blue,
                                      child: Row(
                                        children: [
                                          Icon(Icons.cached),
                                          Text("Tagihan"),
                                        ],
                                      ))
                                ],
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: agrs.fILEFPAJAK != '0'
                            ? Row(
                                children: [
                                  FlatButton(
                                      minWidth: 110,
                                      onPressed: () {},
                                      color: Colors.green,
                                      child: Row(
                                        children: [
                                          Icon(Icons.check_sharp),
                                          Text("Faktur Pajak"),
                                        ],
                                      )),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  FlatButton(
                                      minWidth: 110,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, "/pdfview");
                                      },
                                      color: Colors.blue,
                                      child: Row(
                                        children: [
                                          Icon(Icons.remove_red_eye_sharp),
                                          Text("View"),
                                        ],
                                      ))
                                ],
                              )
                            : Row(
                                children: [
                                  FlatButton(
                                      minWidth: 110,
                                      onPressed: () {},
                                      color: Colors.red,
                                      child: Row(
                                        children: [
                                          Icon(Icons.close),
                                          Text("Faktur Pajak"),
                                        ],
                                      ))
                                ],
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: agrs.fILEPPH != '0'
                            ? Row(
                                children: [
                                  FlatButton(
                                      minWidth: 110,
                                      onPressed: () {},
                                      color: Colors.green,
                                      child: Row(
                                        children: [
                                          Icon(Icons.check_sharp),
                                          Text("PPH"),
                                        ],
                                      )),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  FlatButton(
                                      minWidth: 110,
                                      onPressed: () {},
                                      color: Colors.blue,
                                      child: Row(
                                        children: [
                                          Icon(Icons.remove_red_eye_sharp),
                                          Text("View"),
                                        ],
                                      ))
                                ],
                              )
                            : Row(
                                children: [
                                  FlatButton(
                                      minWidth: 110,
                                      onPressed: () {},
                                      color: Colors.red,
                                      child: Row(
                                        children: [
                                          Icon(Icons.close),
                                          Text("PPH"),
                                        ],
                                      ))
                                ],
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: agrs.fILEDLL != '0'
                            ? Row(
                                children: [
                                  FlatButton(
                                      minWidth: 110,
                                      onPressed: () {},
                                      color: Colors.green,
                                      child: Row(
                                        children: [
                                          Icon(Icons.check_sharp),
                                          Text("Lain Lain"),
                                        ],
                                      )),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  FlatButton(
                                      minWidth: 110,
                                      onPressed: () {},
                                      color: Colors.blue,
                                      child: Row(
                                        children: [
                                          Icon(Icons.remove_red_eye_sharp),
                                          Text("View"),
                                        ],
                                      ))
                                ],
                              )
                            : Row(
                                children: [
                                  FlatButton(
                                      minWidth: 110,
                                      onPressed: () {},
                                      color: Colors.red,
                                      child: Row(
                                        children: [
                                          Icon(Icons.close),
                                          Text("Lain Lain"),
                                        ],
                                      ))
                                ],
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("keterangan"),
                        Expanded(
                            child: Center(
                                child: Text(agrs.kET == null ? "" : agrs.kET)))
                      ],
                    )
                  ],
                ),
              ))
            : Center(child: CircularProgressIndicator()));
  }

  Widget Cardku(Invoicedetailmodel detail) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/Invoiceitem", arguments: detail);
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
                      TableRow(
                          children: [Text('Material'), Text(detail.uRAIAN)]),
                      TableRow(children: [Text('volume'), Text(detail.vOLUME)]),
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
}
