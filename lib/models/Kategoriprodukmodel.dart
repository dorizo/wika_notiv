class Kategoriprodukmodel {
  String kODE;
  String uRAIAN;

  Kategoriprodukmodel({this.kODE, this.uRAIAN});

  Kategoriprodukmodel.fromJson(Map<String, dynamic> json) {
    kODE = json['KODE'];
    uRAIAN = json['URAIAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['KODE'] = this.kODE;
    data['URAIAN'] = this.uRAIAN;
    return data;
  }
}
