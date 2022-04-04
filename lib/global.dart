import 'package:flutter/material.dart';

final String baseurl = "https://erpci-eproc.wika-beton.co.id/api/";
final String urldocument = "https://erpci-eproc.wika-beton.co.id/";

final String logoin = baseurl + "login";
final String logoireqeust = baseurl + "login/request";
final String urlvendorinternet = baseurl + "dashboard/product";
final String urlvendorlistinternet = baseurl + "dashboard/vendor";
final String urldocumentterupload = baseurl + "dashboard/document_terupload";
final String urlnegosiasi = baseurl + "dashboard/negosiasi";
final String urljumlah_penaawaran = baseurl + "dashboard/jumlah_penaawaran";
final String documentuploadregister = baseurl + "login/requestnew";
final String urlsppdn = baseurl + "sppdn";
final String urlspb = baseurl + "spb";
final String urlbpab = baseurl + "bapb";
final String urlinvoice = baseurl + "invoice";
final String urlbpabdetail = baseurl + "bapb/detail";

final String usernameauth = "admin";
final String passwordauth = "1234";
final String applevel =
    '{"JBTM0055":{"SPPDN": "1"},"JBTM0038":{"SPPDN": "2" , "SPBPABRIK": "2"},"JBTM0078":{"SPPDN": "3","SPBPUSAT": "1" , "invoice": "1"},"JBTM0082":{"SPBPUSAT": "2", "invoice": "2"},"JBTM0050":{"SPBPABRIK": "1"}}';
Color lightGreen = Colors.blueAccent;
Color lightBlueIsh = Colors.blue;
Color darkGreen = Color(0xFF00AA12);
Color backgroundColor = Color(0xFFEFEEF5);

TextStyle titleStyleWhite = new TextStyle(
    fontFamily: 'Helvetica',
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 35);
TextStyle jobCardTitileStyleBlue = new TextStyle(
    fontFamily: 'Avenir',
    color: lightBlueIsh,
    fontWeight: FontWeight.bold,
    fontSize: 20);
TextStyle jobCardTitileStyleBlack = new TextStyle(
    fontFamily: 'Avenir',
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 12);
TextStyle titileStyleLighterBlack = new TextStyle(
    fontFamily: 'Avenir',
    color: Color(0xFF34475D),
    fontWeight: FontWeight.bold,
    fontSize: 20);

TextStyle titileStyleBlack = new TextStyle(
    fontFamily: 'Helvetica',
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 25);

TextStyle titileStylewhite = new TextStyle(
    fontFamily: 'Helvetica',
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 25);
TextStyle salaryStyle = new TextStyle(
    fontFamily: 'Avenir',
    color: darkGreen,
    fontWeight: FontWeight.bold,
    fontSize: 50);
