import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:wika/models/invoicemodel.dart';

class Pdfview extends StatefulWidget {
  const Pdfview({Key key}) : super(key: key);

  @override
  _PdfviewState createState() => _PdfviewState();
}

class _PdfviewState extends State<Pdfview> {
  bool _isLoading = true;
  PDFDocument document;
  Invoicemodel agrs;
  String url = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        agrs = ModalRoute.of(context).settings.arguments as Invoicemodel;
        loadDocument(agrs.nOINVOICE);
      });
    });
  }

  loadDocument(String kode) async {
    print(
        "https://erpci-eproc.wika-beton.co.id/index.php/api/invoice_pdf/files?kode=" +
            kode +
            "&file=FILE_TAGIHAN");
    document = await PDFDocument.fromURL(
        "https://erpci-eproc.wika-beton.co.id/index.php/api/invoice_pdf/files?kode=" +
            kode +
            "&file=FILE_TAGIHAN"
        // "https://slicedinvoices.com/pdf/wordpress-pdf-invoice-plugin-sample.pdf"
        );

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FlutterPluginPDFViewer'),
        ),
        body: Center(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : PDFViewer(
                    lazyLoad: false,
                    document: document,
                    zoomSteps: 1,
                  )));
  }
}
