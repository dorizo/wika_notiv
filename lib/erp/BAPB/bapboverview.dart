import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/models/bapbmodel.dart';

class Bapboverview extends StatefulWidget {
  final String kategoripage;
  const Bapboverview({Key key, this.kategoripage}) : super(key: key);

  @override
  _BapboverviewState createState() => _BapboverviewState();
}

class _BapboverviewState extends State<Bapboverview> {
  int page = 1;
  DateTime _selectedDate;
  TextEditingController _textEditingController = TextEditingController();
  ScrollController _controller = ScrollController();
  bool isLoading = false;
  Future<List<Bapbmodel>> x;
  List<Bapbmodel> pagging = [];
  TextEditingController nosppdn = TextEditingController();
  TextEditingController tanngalsppdn = TextEditingController();
  //variable serach
  String kodeSppdn = "";
  String tanggalSppdn = "";
  String statussppdn = "";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        setState(() {
          page++;
          isLoading = true;
          Internethttp()
              .bapbinternet(
                  page.toString(), "20", kodeSppdn, statussppdn, tanggalSppdn)
              .then((value) {
            setState(() {
              pagging.addAll(value);
              isLoading = false;
            });
          });
        });
      }
    });
    x = Internethttp().bapbinternet("1", "20", "", "", "");
    Internethttp().bapbinternet("1", "20", "", "", "").then((value) {
      setState(() {
        pagging.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BAPB"),
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

  Widget cardCatalog(Bapbmodel product) {
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
                            product.nOBAPB != null ? product.nOBAPB : "",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.nOSPB != null ? product.nOSPB : "",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.tGLSURAT,
                            style: TextStyle(fontWeight: FontWeight.normal),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.nAMA,
                            style: TextStyle(fontWeight: FontWeight.normal),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        FlatButton(
                            minWidth: 110,
                            onPressed: () {
                              Navigator.pushNamed(context, "/bapbdetail",
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

  Widget d(String ssppdn, String tanggal, String statusinet) {
    Internethttp()
        .bapbinternet("1", "20", ssppdn, statusinet, tanggal)
        .then((value) {
      setState(() {
        page = 1;
        pagging.clear();
        pagging.addAll(value);
        kodeSppdn = ssppdn;
        statussppdn = statusinet;
        tanggalSppdn = tanggal;
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
                                  _valGender != null ? _valGender : "");
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
