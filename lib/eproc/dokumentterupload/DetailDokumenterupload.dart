import 'package:flutter/material.dart';
import 'package:wika/models/DocumenTerupload_model.dart';

import '../../global.dart';

class DetailDokumenterupload extends StatefulWidget {
  const DetailDokumenterupload({Key key}) : super(key: key);

  @override
  _DetailDokumenteruploadState createState() => _DetailDokumenteruploadState();
}

class _DetailDokumenteruploadState extends State<DetailDokumenterupload> {
  @override
  Widget build(BuildContext context) {
    final agrs =
        ModalRoute.of(context).settings.arguments as DocumenTerupload_model;
    print(urldocument +
        "upload/PERUSAHAAN/" +
        agrs.tRADERID +
        "/" +
        agrs.nAMAFILE);
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Text(urldocument +
              "upload/PERUSAHAAN/" +
              agrs.tRADERID +
              "/" +
              agrs.nAMAFILE),
        ));
  }
}
