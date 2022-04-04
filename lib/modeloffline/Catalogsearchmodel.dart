class Catalogsearchmodel {
  String namaBarang;
  String hargaMaksimal;
  String hargaMinimal;
  String kategori;
  String uraian;
  String kategoriproduk;

  Catalogsearchmodel(
      {this.namaBarang,
      this.hargaMaksimal,
      this.hargaMinimal,
      this.kategori,
      this.uraian,
      this.kategoriproduk});

  Catalogsearchmodel.fromJson(Map<String, dynamic> json) {
    namaBarang = json['Nama_barang'];
    hargaMaksimal = json['Harga_maksimal'];
    hargaMinimal = json['Harga_minimal'];
    kategori = json['Kategori'];
    uraian = json['uraian'];
    kategoriproduk = json['kategoriproduk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nama_barang'] = this.namaBarang;
    data['Harga_maksimal'] = this.hargaMaksimal;
    data['Harga_minimal'] = this.hargaMinimal;
    data['Kategori'] = this.kategori;
    data['uraian'] = this.uraian;
    data['kategoriproduk'] = this.kategoriproduk;
    return data;
  }
}
