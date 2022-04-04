import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:wika/models/BanModel.dart';
import 'package:wika/models/BanmodelDetail.dart';
import 'package:wika/models/Bapmdetailmodel.dart';
import 'package:wika/models/Bapmmodel.dart';
import 'package:wika/models/DocumenTerupload_model.dart';
import 'package:wika/models/Invoicedetailmodel.dart';
import 'package:wika/models/Notifikasi_model.dart';
import 'package:wika/models/Product.dart';
import 'package:wika/models/Spmksmodel.dart';
import 'package:wika/models/Sppdndetailmodel.dart';
import 'package:wika/models/VendorModel.dart';
import 'package:wika/models/bapbdetailmodel.dart';
import 'package:wika/models/bapbmodel.dart';
import 'package:wika/models/invoicemodel.dart';
import 'package:wika/models/negosiasimodel.dart';
import 'package:wika/models/penawaranmodel.dart';
import 'package:wika/models/spbdetailitemmodel.dart';
import 'package:wika/models/spbmodel.dart';
import 'package:wika/models/spmksdetailmodel.dart';
import 'package:wika/models/sppdnmodel.dart';
import '../global.dart';

class Internethttp {
  var client = http.Client();
  Future<http.Response> login(
      String username, String passowrd, String imeiNum) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String imeiNumx = imeiNum;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    var response = await client.post(Uri.parse(logoin),
        body: {"username": username, "password": passowrd, "imei": imeiNum},
        headers: <String, String>{'authorization': basicAuth});
    return response;
  }

  Future<http.Response> kategoriproduk() async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    var response = await client.get(
        Uri.parse(baseurl + 'dashboard/kategoriproduk'),
        headers: <String, String>{'authorization': basicAuth});
    return response;
  }

  Future<http.StreamedResponse> uploadimage(
      String f, String username, String imei, String token) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    var request =
        new http.MultipartRequest("post", Uri.parse(documentuploadregister));
    request.headers.addAll({'authorization': basicAuth});
    request.fields['username'] = username;
    request.fields['imei'] = imei;
    request.fields['token'] = token;
    request.files.add(http.MultipartFile(
        'picturePath', File(f).readAsBytes().asStream(), File(f).lengthSync(),
        filename: f.split("/").last));
    return request.send();
  }

  Future<String> requestdevice(String username, String imei) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String imeis = imei;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    var response = await client.post(Uri.parse(logoireqeust),
        body: {"username": username, "imei": imeis},
        headers: <String, String>{'authorization': basicAuth});
    return response.body;
  }

  Future<List<Product>> vendoreprocinternet(
      String mulai,
      String selesai,
      String namabarang,
      String hargamaksimal,
      String hargaminimal,
      String kategori,
      String urutan,
      String kategoriproduk) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    var response = await client.post(Uri.parse(urlvendorinternet), body: {
      "mulai": mulai,
      "selesai": selesai,
      "Nama_barang": namabarang,
      "Harga_maksimal": hargamaksimal,
      "Harga_minimal": hargaminimal,
      "Kategori": kategori,
      "urutan": urutan,
      "kategoriProduk": kategoriproduk
    }, headers: <String, String>{
      'authorization': basicAuth
    });
    List proucts = json.decode(response.body);
    return proucts.map((e) => new Product.fromJson(e)).toList();
  }

  Future<List<VendorModel>> vendoreproclistinternet(
      String mulai, String selesai) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    var response = await client.post(Uri.parse(urlvendorlistinternet),
        body: {"mulai": mulai, "selesai": selesai},
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new VendorModel.fromJson(e)).toList();
  }

  Future<List<DocumenTerupload_model>> docuementteruploadinternet(
      String mulai, String selesai) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));

    var response = await client.get(Uri.parse(urldocumentterupload),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new DocumenTerupload_model.fromJson(e)).toList();
  }

  Future<List<negosiasimodel>> negosiasimodelinternet(
      String mulai, String selesai) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));

    var response = await client.get(Uri.parse(urlnegosiasi),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new negosiasimodel.fromJson(e)).toList();
  }

  Future<List<Sppdnmodel>> sppdninternet(
      String mulai,
      String selesai,
      String nosppbj,
      String status,
      String tglsurat,
      String patkode,
      String kodehalaman,
      String kdjbt) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = urlsppdn +
        "?page=" +
        mulai +
        "&pat=" +
        patkode +
        "&kodejabatan=" +
        kdjbt +
        "&pagekode=" +
        kodehalaman +
        "&no_sppbj=" +
        nosppbj +
        "&tgl_surat=" +
        tglsurat +
        "&status=" +
        status;
    print(url);
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new Sppdnmodel.fromJson(e)).toList();
  }

  Future<List<Sppdndetailmodel>> sppdndetailinternet(String mulai) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = urlsppdn + "/detail?kode=" + mulai;
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new Sppdndetailmodel.fromJson(e)).toList();
  }

  Future<Sppdnmodel> singlesppdninternet(String kode) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = urlsppdn + "/single?kode=" + kode;
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});

    var prouctsx = json.decode(response.body);
    return Sppdnmodel.fromJson(prouctsx);
  }

  Future<List<Spbmodel>> spbinternet(
      String mulai,
      String selesai,
      String nosppbj,
      String status,
      String namavendor,
      String nospb,
      String kodepat,
      String kodehalaman,
      String kdjbt) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = urlspb +
        "?page=" +
        mulai +
        "&kodejabatan=" +
        kdjbt +
        "&pagekode=" +
        kodehalaman +
        "&no_sppbj=" +
        nosppbj +
        "&pat=" +
        kodepat +
        "&no_sppbj=" +
        nosppbj +
        "&namavendor=" +
        namavendor +
        "&no_spb=" +
        nospb +
        "&status=" +
        status;
    print(url);
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new Spbmodel.fromJson(e)).toList();
  }

  Future<List<Spbdetailitemmodel>> spbdetailinternet(String mulai) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = urlspb + "/detail?kode=" + mulai;

    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new Spbdetailitemmodel.fromJson(e)).toList();
  }

  Future<Spbmodel> singlespbinternet(String kode) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = urlspb + "/single?kode=" + kode;
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});

    var prouctsx = json.decode(response.body);
    return Spbmodel.fromJson(prouctsx);
  }

  Future<List<penawaranmodel>> jumlahpenawaraninternet(
      String mulai, String selesai) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));

    var response = await client.get(Uri.parse(urljumlah_penaawaran),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new penawaranmodel.fromJson(e)).toList();
  }

  Future<List<Bapbmodel>> bapbinternet(String mulai, String selesai,
      String nosppbj, String status, String tglsurat) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = urlbpab +
        "?page=" +
        mulai +
        "&no_sppbj=" +
        nosppbj +
        "&tgl_surat=" +
        tglsurat +
        "&status=" +
        status;
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new Bapbmodel.fromJson(e)).toList();
  }

  Future<List<Bapbdetailmodel>> bapbdetailinternet(String mulai) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = urlbpabdetail + "?kode=" + mulai;
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new Bapbdetailmodel.fromJson(e)).toList();
  }

  Future<Bapbmodel> singlebapbinternet(String kode) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = urlbpab + "/single?kode=" + kode;
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});

    var prouctsx = json.decode(response.body);
    return Bapbmodel.fromJson(prouctsx);
  }

  Future<http.Response> approvebapb(
      String applevel, String KDJBT, String KDEMPID, String NOSPPBJ) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    var response = await client.post(Uri.parse(urlbpab + "/approve"), body: {
      "applevel": applevel,
      "KD_JBT": KDJBT,
      "KD_EMPID": KDEMPID,
      "NO_SPB": NOSPPBJ
    }, headers: <String, String>{
      'authorization': basicAuth
    });
    return response;
  }

  Future<List<Invoicemodel>> invoiceinternet(
      String mulai,
      String seleai,
      String nOINVOICE,
      String tGLTERIMA,
      String tGLINVOICE,
      String namavendor,
      String status,
      String kodepat,
      String kodehalaman,
      String kdjbt) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = urlinvoice +
        "?page=" +
        mulai +
        "&pat=" +
        kodepat +
        "&kodejabatan=" +
        kdjbt +
        "&pagekode=" +
        kodehalaman +
        "&NO_INVOICE=" +
        nOINVOICE +
        "&TGL_TERIMA=" +
        tGLTERIMA +
        "&TGL_INVOICE=" +
        tGLINVOICE +
        "&namavendor=" +
        namavendor +
        "&status=" +
        status;
    print(url);
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new Invoicemodel.fromJson(e)).toList();
  }

  Future<List<BanModel>> baninternt(
      String mulai,
      String seleai,
      String nOINVOICE,
      String tGLTERIMA,
      String namavendor,
      String kodepat,
      String kodehalaman,
      String kdjbt) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = baseurl +
        "ban/" +
        "?page=" +
        mulai +
        "&pat=" +
        kodepat +
        "&kodejabatan=" +
        kdjbt +
        "&pagekode=" +
        kodehalaman +
        "&NO_INVOICE=" +
        nOINVOICE +
        "&TGL_TERIMA=" +
        tGLTERIMA +
        "&namavendor=" +
        namavendor;
    print(url);
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new BanModel.fromJson(e)).toList();
  }

  Future<List<BanmodelDetail>> bandetailinternet(String mulai) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = baseurl + "ban/detail?kode=" + mulai;
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new BanmodelDetail.fromJson(e)).toList();
  }

  Future<Sppdnmodel> singlebaninternet(String kode) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = baseurl + 'ban' + "/single?kode=" + kode;
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});

    var prouctsx = json.decode(response.body);
    return Sppdnmodel.fromJson(prouctsx);
  }

  Future<List<Invoicedetailmodel>> invoicedetailinternet(String mulai) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = urlinvoice + "/detail?kode=" + mulai;
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new Invoicedetailmodel.fromJson(e)).toList();
  }

  Future<List<Notifikasi_model>> notifikasiinternet(
      String mulai, String kdpat, String kdjbg) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = baseurl + "notifikasi/" + mulai + "/" + kdpat + "/" + kdjbg;
    print(url);
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new Notifikasi_model.fromJson(e)).toList();
  }

  Future<http.Response> approveAll(
      String applevel, String KDJBT, String KDEMPID, String NOSPPBJ) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    var response = await client.post(Uri.parse(urlsppdn + "/approve"), body: {
      "applevel": applevel,
      "KD_JBT": KDEMPID,
      "KD_EMPID": KDEMPID,
      "NO_SPPBJ": NOSPPBJ
    }, headers: <String, String>{
      'authorization': basicAuth
    });
    return response;
  }

  Future<http.Response> approvespb(
      String applevel, String KDJBT, String KDEMPID, String NOSPPBJ) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    var response = await client.post(Uri.parse(urlspb + "/approve"), body: {
      "applevel": applevel,
      "KD_JBT": KDJBT,
      "KD_EMPID": KDEMPID,
      "NO_SPB": NOSPPBJ
    }, headers: <String, String>{
      'authorization': basicAuth
    });
    return response;
  }

  //bapm

  Future<List<Bapmmodel>> bapminternt(
      String mulai,
      String seleai,
      String nOINVOICE,
      String tGLTERIMA,
      String namavendor,
      String kodepat,
      String kodehalaman,
      String kdjbt) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = baseurl +
        "bapm/" +
        "?page=" +
        mulai +
        "&pat=" +
        kodepat +
        "&kodejabatan=" +
        kdjbt +
        "&pagekode=" +
        kodehalaman +
        "&NO_INVOICE=" +
        nOINVOICE +
        "&TGL_TERIMA=" +
        tGLTERIMA +
        "&namavendor=" +
        namavendor;
    print(url);
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});
    if (response.statusCode == 200) {
      List prouctsx = json.decode(response.body);
      return prouctsx.map((e) => new Bapmmodel.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  Future<List<Bapmdetailmodel>> bapmdetailinternet(String mulai) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = baseurl + "bapm/detail?kode=" + mulai;
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new Bapmdetailmodel.fromJson(e)).toList();
  }

  // Future<Sppdnmodel> singlebapminternet(String kode) async {
  //   String usernamex = usernameauth;
  //   String passwordx = passwordauth;
  //   String basicAuth =
  //       'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
  //   String url = baseurl + 'bapm' + "/single?kode=" + kode;
  //   var response = await client.get(Uri.parse(url),
  //       headers: <String, String>{'authorization': basicAuth});

  //   var prouctsx = json.decode(response.body);
  //   return Sppdnmodel.fromJson(prouctsx);
  // }

  //spmks

  Future<List<Spmksmodel>> spmksinternet(
      String mulai,
      String seleai,
      String nOINVOICE,
      String tGLTERIMA,
      String namavendor,
      String kodepat,
      String kodehalaman,
      String kdjbt) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = baseurl +
        "spmks/" +
        "?page=" +
        mulai +
        "&pat=" +
        kodepat +
        "&kodejabatan=" +
        kdjbt +
        "&pagekode=" +
        kodehalaman +
        "&NO_INVOICE=" +
        nOINVOICE +
        "&TGL_TERIMA=" +
        tGLTERIMA +
        "&namavendor=" +
        namavendor;
    print(url);
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new Spmksmodel.fromJson(e)).toList();
  }

  Future<List<spmksdetailmodel>> Spmksdetailinternet(String mulai) async {
    String usernamex = usernameauth;
    String passwordx = passwordauth;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
    String url = baseurl + "spmks/detail?kode=" + mulai;
    var response = await client.get(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth});
    List prouctsx = json.decode(response.body);
    return prouctsx.map((e) => new spmksdetailmodel.fromJson(e)).toList();
  }

  // Future<Sppdnmodel> singlebapminternet(String kode) async {
  //   String usernamex = usernameauth;
  //   String passwordx = passwordauth;
  //   String basicAuth =
  //       'Basic ' + base64Encode(utf8.encode('$usernamex:$passwordx'));
  //   String url = baseurl + 'bapm' + "/single?kode=" + kode;
  //   var response = await client.get(Uri.parse(url),
  //       headers: <String, String>{'authorization': basicAuth});

  //   var prouctsx = json.decode(response.body);
  //   return Sppdnmodel.fromJson(prouctsx);
  // }
}
