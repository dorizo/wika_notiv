import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wika/ERPProcuremet.dart';
import 'package:wika/eproc/Catalogsearch.dart';
import 'package:wika/eproc/Vendoreprocdetail.dart';
import 'package:wika/eproc/jumlahpenawaran/jumlahpenawaranoverview.dart';
import 'package:wika/eproc/negosiasi/negosiasidetail.dart';
import 'package:wika/eproc/vendor/vendorlist.dart';
import 'package:wika/erp/BAN/Banitem.dart';
import 'package:wika/erp/BAN/Banoverview.dart';
import 'package:wika/erp/BAN/bandetail.dart';
import 'package:wika/erp/BAPB/bapbdetail.dart';
import 'package:wika/erp/BAPB/bapbitemdetail.dart';
import 'package:wika/erp/BAPB/bapboverview.dart';
import 'package:wika/erp/BAPM/Bapmdetail.dart';
import 'package:wika/erp/BAPM/Bapmitem.dart';
import 'package:wika/erp/BAPM/Bapmoverview.dart';
import 'package:wika/erp/INVOICE/invoicedetail.dart';
import 'package:wika/erp/INVOICE/invoiceitem.dart';
import 'package:wika/erp/INVOICE/invoiceoverview.dart';
import 'package:wika/erp/INVOICE/pdfview.dart';
import 'package:wika/erp/SPB/spbdetail.dart';
import 'package:wika/erp/SPB/spbitem.dart';
import 'package:wika/erp/SPB/spboverview.dart';
import 'package:wika/erp/SPPDN/Sppdnitemdetail.dart';
import 'package:wika/erp/spmks/Spmksdetail.dart';
import 'package:wika/erp/spmks/Spmksoverview.dart';
import 'package:wika/erp/spmks/spmksitem.dart';
import 'package:wika/home.dart';
import 'package:wika/setpassword.dart';

import 'EProcurement.dart';
import 'Splashscreen.dart';
import 'deteksiwajah.dart';
import 'eproc/Vendoreproc.dart';
import 'eproc/dokumentterupload/DetailDokumenterupload.dart';
import 'eproc/dokumentterupload/Dokumenterupload.dart';
import 'eproc/negosiasi/negosiasioverview.dart';
import 'erp/SPPDN/sppdndetail.dart';
import 'erp/SPPDN/sppdnoverview.dart';
import 'kit/takeimage.dart';
import 'login.dart';
import 'loginlagi.dart';
import 'registernip.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wika Mobile',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: MyHomePage(),
      initialRoute: "/splash",
      routes: {
        '/': (context) => MyHomePage(),
        '/Registernip': (context) => Registernip(),
        '/login': (context) => Login(),
        '/loginlagi': (context) => Loginlagi(),
        '/splash': (context) => Splashscreen(),
        '/eproccatalog': (context) => Vendoreproc(),
        '/eproccatalogsearch': (context) => Catalogsearch(),
        '/eproccatalogdetail': (context) => Vendoreprocdetail(),
        '/eprocvendorlist': (context) => Vendorlist(),
        '/kontrakterupload': (context) => Dokumenterupload(),
        '/detaildocumenterupload': (context) => DetailDokumenterupload(),
        '/FaceDetectorView': (context) => FaceDetectorView(),
        '/Takeimage': (context) => Takeimage(),
        '/Negosiasioverview': (context) => Negosiasioverview(),
        '/Jumlahpenawaranoverview': (context) => Jumlahpenawaranoverview(),
        '/negosiasidetail': (context) => negosiasidetail(),
        '/SppdnOverview': (context) => SppdnOverview(
              kategoripage: "full",
            ),
        '/Sppdnnotifikasi': (context) => SppdnOverview(
              kategoripage: "notifikasi",
            ),
        '/Sppdndetail': (context) => Sppdndetail(),
        '/sppdnitemdetail': (context) => Sppdnitemdetail(),
        '/spbOverview': (context) => SpbOverview(
              kategoripage: "full",
            ),
        '/spbnotifikasi': (context) => SpbOverview(
              kategoripage: "notifikasi",
            ),
        '/spbdetail': (context) => Spbdetail(),
        '/bapbOverview': (context) => Bapboverview(),
        '/invoiceOverview': (context) => InvoiceOverview(
              kategoripage: "full",
            ),
        '/invoicenotifikasi': (context) => InvoiceOverview(
              kategoripage: "notifikasi",
            ),
        '/Invoicedetail': (context) => Invoicedetail(),
        '/bapbdetail': (context) => Bapbdetail(),
        '/bapbitemdetail': (context) => Bapbitemdetail(),
        '/Spbitem': (context) => Spbitem(),
        '/pdfview': (context) => Pdfview(),
        '/setpassword': (context) => Setpassword(),
        '/Invoiceitem': (context) => Invoiceitem(),
        '/Banoverview': (context) => Banoverview(
              kategoripage: "full",
            ),
        '/banitem': (context) => Banitem(),
        '/Bapmoverview': (context) => Bapmoverveiw(
              kategoripage: "full",
            ),
        '/bapmdetail': (context) => Bapmdetail(),
        '/bapmitemdetail': (context) => Bapmitem(),
        '/Spmksoverview': (context) => Spmksoverview(
              kategoripage: "full",
            ),
        '/spmksitem': (context) => Spmksitem(),
        '/spmksdetail': (context) => Spmksdetail(),
        '/bandetail': (context) => Bandetail(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    Widget child = Container();
    switch (_index) {
      // case 0:
      //   child = Home();
      //   break;
      case 0:
        child = ERPProcuremet();
        break;
      case 1:
        child = EProcurement();
        break;
    }
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (int index) => setState(() => _index = index),
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home_outlined),
          //   label: 'Home',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_outlined),
            label: 'ERP Procurement',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'E-Procurement',
          ),
        ],
      ),
    );
  }
}
