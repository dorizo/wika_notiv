import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:intl/intl.dart';
import 'package:wika/models/SessiondataModel.dart';
import 'package:wika/models/spbmodel.dart';
import 'package:wika/session.dart';

class SpbOverview extends StatefulWidget {
  final String kategoripage;
  const SpbOverview({Key key, this.kategoripage}) : super(key: key);

  @override
  _SpbOverviewState createState() => _SpbOverviewState();
}

class _SpbOverviewState extends State<SpbOverview> {
  int page = 0;
  DateTime _selectedDate;
  TextEditingController _textEditingController = TextEditingController();
  ScrollController _controller = ScrollController();
  bool isLoading = false;
  Future<List<Spbmodel>> x;
  List<Spbmodel> pagging = [];
  TextEditingController nosppdn = TextEditingController();
  TextEditingController tanngalsppdn = TextEditingController();
  TextEditingController nospbcontroller = TextEditingController();
  TextEditingController namavendorcontroller = TextEditingController();
  //variable serach
  String kodeSppdn = "";
  String namavendor = "";
  String nospb = "";
  String statussppdn = "";
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
              .spbinternet(
                  page.toString(),
                  "20",
                  kodeSppdn,
                  statussppdn,
                  namavendor,
                  nospb,
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
            .spbinternet("0", "20", "", "", "", "", sessiondata.kdPat,
                widget.kategoripage, sessiondata.kdJbt)
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
        title: Text("SPB"),
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

  Widget cardCatalog(Spbmodel product) {
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
                            product.nOSPB != null ? product.nOSPB : "",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.nOSPPBJ != null ? product.nOSPPBJ : "",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.tGLSURAT != null ? product.tGLSURAT : "",
                            style: TextStyle(fontWeight: FontWeight.normal),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.kETPENYERAHAN != null
                                ? product.kETPENYERAHAN
                                : "",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            (product.pATTOKET != null ? product.pATTOKET : "") +
                                ' -> ' +
                                (product.pATSPBKET != null
                                    ? product.pATSPBKET
                                    : ""),
                            style: TextStyle(fontWeight: FontWeight.normal),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.nAMAVENDOR != null
                                ? product.nAMAVENDOR
                                : "",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Volume SPPDN",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        product.vOLBAPB,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Volume SPB",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          product.vOLSPB != null
                                              ? product.vOLSPB
                                              : '0',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        product.sPBSTATUS == 'OPEN'
                            ? FlatButton(
                                minWidth: 110,
                                onPressed: () => {},
                                color: Colors.red,
                                child: Row(
                                  children: [
                                    Icon(Icons.lock_open),
                                    Text(product.sPBSTATUS),
                                  ],
                                ))
                            : FlatButton(
                                minWidth: 110,
                                onPressed: () => {},
                                color: Colors.green,
                                child: Row(
                                  children: [
                                    Icon(Icons.lock),
                                    Text(product.sPBSTATUS),
                                  ],
                                )),
                        FlatButton(
                            minWidth: 110,
                            onPressed: () {
                              Navigator.pushNamed(context, "/spbdetail",
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

  Widget d(
      String ssppdn, String nospbs, String statusinet, String namavendors) {
    Internethttp()
        .spbinternet("0", "20", ssppdn, statusinet, namavendors, nospbs,
            sessiondata.kdPat, widget.kategoripage, sessiondata.kdJbt)
        .then((value) {
      setState(() {
        page = 1;
        pagging.clear();
        pagging.addAll(value);
        kodeSppdn = ssppdn;
        namavendor = namavendors;
        nospb = nospbs;
        statussppdn = statusinet;
      });
    });
  }

  void showsearchform(context) {
    String _valGender;
    List _listGender = ["CLOSED", "OPEN"];

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Filter Pencarian"),
                    TextField(
                      controller: nospbcontroller,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.format_list_numbered),
                        hintText: 'Input No SPPDN disini',
                        labelText: 'No SPB',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                      controller: namavendorcontroller,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.format_list_numbered),
                        hintText: 'Input No SPPDN disini',
                        labelText: 'Nama Vendor',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // TextField(
                    //   textAlign: TextAlign.center,
                    //   decoration: InputDecoration(
                    //     prefixIcon: Icon(Icons.format_list_numbered),
                    //     hintText: 'Input No',
                    //     labelText: 'Tanggal',
                    //     border: const OutlineInputBorder(),
                    //   ),
                    //   focusNode: AlwaysDisabledFocusNode(),
                    //   controller: _textEditingController,
                    //   onTap: () {
                    //     _selectDate(context);
                    //   },
                    // ),
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
                            d(
                                nosppdn.text,
                                nospbcontroller.text,
                                _valGender != null ? _valGender : "",
                                namavendorcontroller.text);
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
          });
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
