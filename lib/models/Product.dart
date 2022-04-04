class Product {
  String nO;
  String pRODUKTRADERID;
  String nAMA;
  String hARGA;
  String tRADERID;
  String nAMATRADER;
  String kATEGORI;
  String kATEGORIUR;
  String fILE;
  String pRODUKTRADERIDEN;
  ARRFILE aRRFILE;

  Product(
      {this.nO,
      this.pRODUKTRADERID,
      this.nAMA,
      this.hARGA,
      this.tRADERID,
      this.nAMATRADER,
      this.kATEGORI,
      this.kATEGORIUR,
      this.fILE,
      this.pRODUKTRADERIDEN,
      this.aRRFILE});

  Product.fromJson(Map<String, dynamic> json) {
    nO = json['NO'];
    pRODUKTRADERID = json['PRODUK_TRADER_ID'];
    nAMA = json['NAMA'];
    hARGA = json['HARGA'];
    tRADERID = json['TRADER_ID'];
    nAMATRADER = json['NAMA_TRADER'];
    kATEGORI = json['KATEGORI'];
    kATEGORIUR = json['KATEGORI_UR'];
    fILE = json['FILE'];
    pRODUKTRADERIDEN = json['PRODUK_TRADER_ID_EN'];
    aRRFILE =
        json['ARRFILE'] != null ? new ARRFILE.fromJson(json['ARRFILE']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NO'] = this.nO;
    data['PRODUK_TRADER_ID'] = this.pRODUKTRADERID;
    data['NAMA'] = this.nAMA;
    data['HARGA'] = this.hARGA;
    data['TRADER_ID'] = this.tRADERID;
    data['NAMA_TRADER'] = this.nAMATRADER;
    data['KATEGORI'] = this.kATEGORI;
    data['KATEGORI_UR'] = this.kATEGORIUR;
    data['FILE'] = this.fILE;
    data['PRODUK_TRADER_ID_EN'] = this.pRODUKTRADERIDEN;
    if (this.aRRFILE != null) {
      data['ARRFILE'] = this.aRRFILE.toJson();
    }
    return data;
  }
}

class ARRFILE {
  int width;
  int height;

  ARRFILE({this.width, this.height});

  ARRFILE.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}
