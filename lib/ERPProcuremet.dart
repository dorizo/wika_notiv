import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/models/Notifikasi_model.dart';
import 'package:wika/session.dart';
import 'global.dart';

class ERPProcuremet extends StatefulWidget {
  @override
  _ERPProcuremetState createState() => _ERPProcuremetState();
}

class _ERPProcuremetState extends State<ERPProcuremet> {
  List<Notifikasi_model> cardhorizontal = [];
  List<String> jobCategories = [];
  @override
  void initState() {
    super.initState();
    refresh();
  }

  void refresh() {
    Future.delayed(Duration.zero, () {
      Session().sessionku().then((value) {
        if (value != null) {
          var nip = jsonDecode(value);
          if (nip['kd_pat'] == '0A') {
            jobCategories = [
              "SPPDN",
              "SPB",
              "Invoice",
              "BAN",
            ];
          } else {
            jobCategories = [
              "SPPDN",
              "SPB",
              "BAPB",
              "Invoice",
              "BAPM",
              "SPMKS",
              "BAN",
            ];
          }
          Internethttp()
              .notifikasiinternet(nip['user_id'], nip['kd_pat'], nip['kd_jbt'])
              .then((value) {
            setState(() {
              // print(value);
              cardhorizontal.clear();

              cardhorizontal.addAll(value);
            });
          });
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    constraints: BoxConstraints.expand(height: 225),
                    decoration: BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [lightBlueIsh, lightGreen],
                            begin: const FractionalOffset(1.0, 1.0),
                            end: const FractionalOffset(0.2, 0.2),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Image.asset('assets/images/logo.png', height: 40),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    padding: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 40, left: 20),
                          child: GestureDetector(
                            onTap: () {
                              Session().logout();
                            },
                            child: Text(
                              "ERP Procurement Menu",
                              style: titileStylewhite,
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Expanded(
                          child: Container(
                            child: ListView(
                              shrinkWrap: true,
                              children: getJobCategories(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Map jobCatToIcon = {
    "SPPDN": Icon(Icons.settings, color: lightBlueIsh, size: 50),
    "SPB": Icon(Icons.healing, color: lightBlueIsh, size: 50),
    "BAPB": Icon(Icons.search, color: lightBlueIsh, size: 50),
    "Invoice": Icon(Icons.card_membership, color: lightBlueIsh, size: 50),
    "BAPM": Icon(Icons.card_membership, color: lightBlueIsh, size: 50),
    "SPMKS": Icon(Icons.card_membership, color: lightBlueIsh, size: 50),
    "BAN": Icon(Icons.card_membership, color: lightBlueIsh, size: 50),
  };
  List<Widget> getJobCategories() {
    List<Widget> jobCategoriesCards = [];
    List<Widget> rows = [];
    int i = 0;
    int hero = 1;
    for (String category in jobCategories) {
      if (i < 2) {
        rows.add(getCategoryContainer(category, hero, i));
        i++;
      } else {
        i = 0;
        jobCategoriesCards.add(new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows,
        ));
        rows = [];
        rows.add(getCategoryContainer(category, hero, i));
        i++;
      }
      hero++;
    }
    if (rows.length > 0) {
      jobCategoriesCards.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
    }
    return jobCategoriesCards;
  }

  Widget getCategoryContainer(String categoryName, int eros, int nomordata) {
    // print();
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 10),
          child: new Container(
            margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
            height: 180,
            width: MediaQuery.of(context).size.width * 0.40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                new BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Center(
                      child: Text(categoryName,
                          style: titileStyleLighterBlack,
                          textAlign: TextAlign.center)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 100,
                  width: 70,
                  child: FloatingActionButton(
                    heroTag: eros, // put som
                    backgroundColor: Colors.white,
                    child: jobCatToIcon[categoryName],
                    elevation: 10,
                    onPressed: () {
                      if (categoryName == 'SPPDN') {
                        print(categoryName);
                        Navigator.pushNamed(context, "/SppdnOverview");
                      } else if (categoryName == 'Jumlah Vendor') {
                        Navigator.pushNamed(context, "/eprocvendorlist");
                      } else if (categoryName == 'SPB') {
                        Navigator.pushNamed(context, "/spbOverview");
                      } else if (categoryName == 'BAN') {
                        Navigator.pushNamed(context, "/Banoverview");
                      } else if (categoryName == 'BAPM') {
                        Navigator.pushNamed(context, "/Bapmoverview");
                      } else if (categoryName == 'SPMKS') {
                        Navigator.pushNamed(context, "/Spmksoverview");
                      } else if (categoryName == 'BAPB') {
                        Navigator.pushNamed(context, "/bapbOverview");
                      } else if (categoryName == 'Invoice') {
                        Navigator.pushNamed(context, "/invoiceOverview");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        cardhorizontal.length == 0
            ? Positioned(
                top: 10,
                right: 0,
                child: SizedBox(
                  height: 20,
                  child: Center(child: CircularProgressIndicator()),
                ),
              )
            : cardhorizontal
                        .where((element) =>
                            element.name.toLowerCase() ==
                            categoryName.toLowerCase())
                        .first
                        .value ==
                    0
                ? Container()
                : Positioned(
                    top: 10,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // print(cardhorizontal[eros - 1].value);
                        if (cardhorizontal
                                .where((element) =>
                                    element.name.toLowerCase() ==
                                    categoryName.toLowerCase())
                                .first
                                .value ==
                            0) {
                          popupnotivikasi(
                              "Tidak Ada Approve " + categoryName.toString());
                        } else {
                          if (categoryName == 'SPPDN') {
                            Navigator.pushNamed(context, "/Sppdnnotifikasi")
                                .then((value) {
                              refresh();
                            });
                          } else if (categoryName == 'SPB') {
                            Navigator.pushNamed(context, "/spbnotifikasi")
                                .then((value) {
                              refresh();
                            });
                          } else if (categoryName == 'BAPB') {
                            Navigator.pushNamed(context, "/bapbOverview");
                          } else if (categoryName == 'BAN') {
                            Navigator.pushNamed(context, "/banoverview");
                          } else if (categoryName == 'Invoice') {
                            Navigator.pushNamed(context, "/invoicenotifikasi")
                                .then((value) {
                              refresh();
                            });
                          }
                        }
                      },
                      child: Container(
                        width: 70,
                        height: 170,
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffc32c37),
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Center(
                              child: Text(
                                cardhorizontal
                                    .where((element) =>
                                        element.name.toLowerCase() ==
                                        categoryName.toLowerCase())
                                    .first
                                    .value
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
      ],
    );
  }

  void popupnotivikasi(String data) {
    final snackBar = SnackBar(
      content: Text(data),
      action: SnackBarAction(
        label: 'Keluar',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
