import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:wika/global.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/models/Notifikasi_model.dart';

import 'models/job.dart';
import 'session.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Notifikasi_model> cardhorizontal = [];
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      Session().sessionku().then((value) {
        if (value != null) {
          var nip = jsonDecode(value);
          Internethttp()
              .notifikasiinternet(nip['user_id'], nip['kd_pat'], nip['kd_jbt'])
              .then((value) {
            setState(() {
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
                    margin: EdgeInsets.only(top: 120),
                    constraints: BoxConstraints.expand(height: 200),
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 40),
                      scrollDirection: Axis.horizontal,
                      itemCount: cardhorizontal.length,
                      itemBuilder: (BuildContext context, int index) {
                        return getJobCard(cardhorizontal[index]);
                      },
                      // children: getRecentJobs()
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 280),
                    padding: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 40, left: 20),
                          child: Text(
                            "Menu",
                            style: titileStyleBlack,
                          ),
                        ),
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

  List<String> jobCategories = [
    "Persetujuan Vendor",
    "Persetujuan SPB",
    "Persetujuan BAPB",
    "Blacklist Vendor",
  ];

  Map jobCatToIcon = {
    "Persetujuan Vendor": Icon(Icons.settings, color: lightBlueIsh, size: 50),
    "Persetujuan SPB": Icon(Icons.healing, color: lightBlueIsh, size: 50),
    "Persetujuan BAPB": Icon(Icons.search, color: lightBlueIsh, size: 50),
    "Blacklist Vendor":
        Icon(Icons.card_membership, color: lightBlueIsh, size: 50),
    "Rencana": Icon(Icons.healing, color: lightBlueIsh, size: 50),
  };
  Widget getCategoryContainer(String categoryName, int num) {
    return new Container(
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
      height: 180,
      width: MediaQuery.of(context).size.width * 0.43,
      padding: EdgeInsets.all(10),
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
          Center(
              child: Text(categoryName,
                  style: titileStyleLighterBlack, textAlign: TextAlign.center)),
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 100,
            width: 70,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: jobCatToIcon[categoryName],
              elevation: 10,
              heroTag: num, // put som
              onPressed: () {
                FlutterAppBadger.updateBadgeCount(3);
                Session().logout();
              },
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getJobCategories() {
    List<Widget> jobCategoriesCards = [];
    List<Widget> rows = [];
    int i = 0;
    int herov = 1;
    for (String category in jobCategories) {
      if (i < 2) {
        rows.add(getCategoryContainer(category, herov));
        i++;
      } else {
        i = 0;
        jobCategoriesCards.add(new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows,
        ));
        rows = [];
        rows.add(getCategoryContainer(category, herov));
        i++;
      }
      herov++;
    }
    if (rows.length > 0) {
      jobCategoriesCards.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
    }
    return jobCategoriesCards;
  }

  List<Job> findJobs() {
    List<Job> jobs = [];
    for (int i = 0; i < 5; i++) {
      jobs.add(new Job("Volvo", "TOTAL VENDOR", 50, "Remote", "Part time",
          new AssetImage("lib/assets/volvo.png")));
    }
    return jobs;
  }

  Widget getJobCard(Notifikasi_model job) {
    return GestureDetector(
      onTap: () {
        print(job.name);
        if (job.name == 'SPPDN') {
          if (job.value == 0) {
            popupnotivikasi("Data Notivikasi SPPDN kosong");
          } else {
            Navigator.pushNamed(context, "/Sppdnnotifikasi");
          }
        } else if (job.name == 'SPB') {
          if (job.value == 0) {
            popupnotivikasi("Data Notivikasi SPB kosong");
          } else {
            Navigator.pushNamed(context, "/Sppdnnotifikasi");
          }
        } else if (job.name == 'INVOICE') {
          if (job.value == 0) {
            popupnotivikasi("Data Notivikasi INVOICE kosong");
          } else {
            Navigator.pushNamed(context, "/Sppdnnotifikasi");
          }
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(right: 20, bottom: 30, top: 30),
        height: 100,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              new BoxShadow(
                color: Colors.grey,
                blurRadius: 20.0,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              job.name,
              textAlign: TextAlign.center,
              style: jobCardTitileStyleBlue,
            ),
            Text(job.value.toString(),
                textAlign: TextAlign.center, style: salaryStyle)
          ],
        ),
      ),
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
