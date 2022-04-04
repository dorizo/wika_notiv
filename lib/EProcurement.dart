import 'package:flutter/material.dart';
import 'package:wika/global.dart';

class EProcurement extends StatefulWidget {
  @override
  _EProcurementState createState() => _EProcurementState();
}

class _EProcurementState extends State<EProcurement> {
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
                          child: Text(
                            "E Procurment Menu",
                            style: titileStylewhite,
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
    "Catalog",
    "Analisa keputusan",
  ];

  Map jobCatToIcon = {
    "Catalog": Icon(Icons.healing, color: lightBlueIsh, size: 50),
    "Analisa keputusan": Icon(Icons.search, color: lightBlueIsh, size: 50),
  };
  List<Widget> getJobCategories() {
    List<Widget> jobCategoriesCards = [];
    List<Widget> rows = [];
    int i = 0;
    int hero = 1;
    for (String category in jobCategories) {
      if (i < 2) {
        rows.add(getCategoryContainer(category, hero));
        i++;
      } else {
        i = 0;
        jobCategoriesCards.add(new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows,
        ));
        rows = [];
        rows.add(getCategoryContainer(category, hero));
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

  Widget getCategoryContainer(String categoryName, int heros) {
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
              heroTag: heros, // put som
              onPressed: () {
                if (categoryName == 'Catalog') {
                  print(categoryName);
                  Navigator.pushNamed(context, "/eproccatalog");
                } else if (categoryName == 'Jumlah Vendor') {
                  Navigator.pushNamed(context, "/eprocvendorlist");
                } else if (categoryName == 'Kontrak Terupload') {
                  Navigator.pushNamed(context, "/kontrakterupload");
                } else if (categoryName == 'BAN') {
                  Navigator.pushNamed(context, "/FaceDetectorView");
                } else if (categoryName == 'Negosiasi Berjalan') {
                  Navigator.pushNamed(context, "/Negosiasioverview");
                } else if (categoryName == 'Jumlah Penawaran') {
                  Navigator.pushNamed(context, "/Jumlahpenawaranoverview");
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
