import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/library/currency.dart';
import 'package:wika/models/SessiondataModel.dart';
import 'package:wika/models/invoicemodel.dart';
import 'package:wika/session.dart';

class InvoiceOverview extends StatefulWidget {
  final String kategoripage;
  const InvoiceOverview({Key key, this.kategoripage}) : super(key: key);

  @override
  _InvoiceOverviewState createState() => _InvoiceOverviewState();
}

class _InvoiceOverviewState extends State<InvoiceOverview> {
  int page = 0;
  DateTime _selectedDate;
  TextEditingController _textEditingController = TextEditingController();
  ScrollController _controller = ScrollController();
  bool isLoading = false;
  Future<List<Invoicemodel>> x;
  List<Invoicemodel> pagging = [];
  TextEditingController nosppdn = TextEditingController();
  TextEditingController tanngalsppdn = TextEditingController();
  //variable serach
  String nOINVOICE = "";
  String tGLTERIMA = "";
  String tGLINVOICE = "";
  String namavendor = "";
  String status = "";
  SessiondataModel sessiondata;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        setState(() {
          page++;
          isLoading = true;
          Internethttp()
              .invoiceinternet(
                  page.toString(),
                  "20",
                  nOINVOICE,
                  tGLTERIMA,
                  tGLINVOICE,
                  namavendor,
                  status,
                  sessiondata.kdPat,
                  widget.kategoripage,
                  sessiondata.kdJbt)
              .then((value) {
            setState(() {
              pagging.addAll(value);
              isLoading = false;
            });
          });
        });
      }
    });

    Session().sessionku().then((value) {
      setState(() {
        sessiondata = SessiondataModel.fromJson(jsonDecode(value));
        Internethttp()
            .invoiceinternet(
                page.toString(),
                "20",
                nOINVOICE,
                tGLTERIMA,
                tGLINVOICE,
                namavendor,
                status,
                sessiondata.kdPat,
                widget.kategoripage,
                sessiondata.kdJbt)
            .then((value) {
          setState(() {
            pagging.addAll(value);
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice"),
        actions: [
          GestureDetector(
            child: Icon(Icons.search),
            onTap: () {
              showsearchform(context);
            },
          )
        ],
      ),
      body: Column(
        children: [
          pagging.length != 0
              ? Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    cacheExtent: 10,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: pagging.length,
                    itemBuilder: (BuildContext context, int index) {
                      return cardCatalog(pagging[index]);
                    },
                  ),
                )
              : Center(child: CircularProgressIndicator()),
          _buildProgressIndicator()
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Center(
      child: new Opacity(
        opacity: isLoading ? 1.0 : 00,
        child: new CircularProgressIndicator(),
      ),
    );
  }

  Widget cardCatalog(Invoicemodel product) {
    return Container(
      child: GestureDetector(
        onTap: () {
          // Navigator.pushNamed(context, "/negosiasidetail", arguments: product);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.nOINVOICE != null ? product.nOINVOICE : "",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.tGLINVOICE != null
                                ? product.tGLINVOICE
                                : "",
                            style: TextStyle(fontWeight: FontWeight.normal),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.tGLTERIMA != null ? product.tGLTERIMA : "",
                            style: TextStyle(fontWeight: FontWeight.normal),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.nAMA != null ? product.nAMA : "",
                            style: TextStyle(fontWeight: FontWeight.normal),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.nILAITOTAL != null
                                ? Currency().rupiah(product.nILAITOTAL)
                                : "",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        product.lEMBARKENDALI == '0'
                            ? FlatButton(
                                minWidth: 110,
                                onPressed: () => {},
                                color: Colors.red,
                                child: Row(
                                  children: [
                                    Icon(Icons.lock_open),
                                    Text(product.lEMBARKENDALI != null
                                        ? "OPEN"
                                        : ""),
                                  ],
                                ))
                            : FlatButton(
                                minWidth: 110,
                                onPressed: () => {},
                                color: Colors.green,
                                child: Row(
                                  children: [
                                    Icon(Icons.lock),
                                    Text(product.lEMBARKENDALI != null
                                        ? "CLOSE"
                                        : ""),
                                  ],
                                )),
                        FlatButton(
                            minWidth: 110,
                            onPressed: () {
                              Navigator.pushNamed(context, "/Invoicedetail",
                                  arguments: product);
                            },
                            color: Colors.blue,
                            child: Row(
                              children: [
                                Icon(Icons.remove_red_eye_sharp),
                                Text("View"),
                              ],
                            )),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget d(String nOINVOICE, String tGLTERIMA, String tGLINVOICE,
      String namavendor, String status) {
    Internethttp()
        .invoiceinternet(
            page.toString(),
            "20",
            nOINVOICE,
            tGLTERIMA,
            tGLINVOICE,
            namavendor,
            status,
            sessiondata.kdPat,
            widget.kategoripage,
            sessiondata.kdJbt)
        .then((value) {
      setState(() {
        page = 1;
        pagging.clear();
        pagging.addAll(value);
        nOINVOICE = nOINVOICE;
        tGLTERIMA = tGLTERIMA;
        tGLINVOICE = tGLINVOICE;
        namavendor = namavendor;
        status = status;
      });
    });
  }

  void showsearchform(context) {
    String _valGender;
    List _listGender = ["CLOSED", "OPEN"];

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: MediaQuery.of(context).size.height * 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Filter Pencarian"),
                      TextField(
                        controller: nosppdn,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.format_list_numbered),
                          hintText: 'Input No SPPDN disini',
                          labelText: 'No SPPDN',
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.format_list_numbered),
                          hintText: 'Input No',
                          labelText: 'Tanggal',
                          border: const OutlineInputBorder(),
                        ),
                        focusNode: AlwaysDisabledFocusNode(),
                        controller: _textEditingController,
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButton(
                        isExpanded: true,
                        hint: Text("Select The Status"),
                        value: _valGender,
                        items: _listGender.map((value) {
                          return DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _valGender = value;
                          });
                        },
                      ),
                      FlatButton(
                          minWidth: 110,
                          onPressed: () {
                            setState(() {
                              d(nosppdn.text, _textEditingController.text,
                                  _valGender != null ? _valGender : "", "", "");
                              Navigator.pop(context);
                            });
                          },
                          color: Colors.green,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search),
                              Text("Search"),
                            ],
                          )),
                    ],
                  ),
                ),
              );
            }),
          );
        });
  }

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.green,
                onPrimary: Colors.black,
                surface: Colors.black,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat("d-MMM-yy").format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
