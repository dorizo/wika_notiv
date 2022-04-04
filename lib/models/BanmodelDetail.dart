class BanmodelDetail {
  String nOBAN;
  String kDMATERIAL;
  String hARGAPENAWARAN;
  String hARGADISEPAKATI;
  String cREATEDDATE;
  String tUJUANPENYERAHAN;
  String vOL;
  String kDJMATERIAL;
  String uRAIAN;
  String sATUAN;
  String sPESIFIKASI;
  String kDPART;
  String cREATEDBY;
  String lASTUPDATEBY;
  String lASTUPDATEDATE;
  String kDST;
  String tOLERANSI;
  String mATHPP;
  String sTMATGIS;
  String rNUM;

  BanmodelDetail(
      {this.nOBAN,
      this.kDMATERIAL,
      this.hARGAPENAWARAN,
      this.hARGADISEPAKATI,
      this.cREATEDDATE,
      this.tUJUANPENYERAHAN,
      this.vOL,
      this.kDJMATERIAL,
      this.uRAIAN,
      this.sATUAN,
      this.sPESIFIKASI,
      this.kDPART,
      this.cREATEDBY,
      this.lASTUPDATEBY,
      this.lASTUPDATEDATE,
      this.kDST,
      this.tOLERANSI,
      this.mATHPP,
      this.sTMATGIS,
      this.rNUM});

  BanmodelDetail.fromJson(Map<String, dynamic> json) {
    nOBAN = json['NO_BAN'];
    kDMATERIAL = json['KD_MATERIAL'];
    hARGAPENAWARAN = json['HARGA_PENAWARAN'];
    hARGADISEPAKATI = json['HARGA_DISEPAKATI'];
    cREATEDDATE = json['CREATED_DATE'];
    tUJUANPENYERAHAN = json['TUJUAN_PENYERAHAN'];
    vOL = json['VOL'];
    kDJMATERIAL = json['KD_JMATERIAL'];
    uRAIAN = json['URAIAN'];
    sATUAN = json['SATUAN'];
    sPESIFIKASI = json['SPESIFIKASI'];
    kDPART = json['KD_PART'];
    cREATEDBY = json['CREATED_BY'];
    lASTUPDATEBY = json['LAST_UPDATE_BY'];
    lASTUPDATEDATE = json['LAST_UPDATE_DATE'];
    kDST = json['KD_ST'];
    tOLERANSI = json['TOLERANSI'];
    mATHPP = json['MAT_HPP'];
    sTMATGIS = json['ST_MATGIS'];
    rNUM = json['RNUM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NO_BAN'] = this.nOBAN;
    data['KD_MATERIAL'] = this.kDMATERIAL;
    data['HARGA_PENAWARAN'] = this.hARGAPENAWARAN;
    data['HARGA_DISEPAKATI'] = this.hARGADISEPAKATI;
    data['CREATED_DATE'] = this.cREATEDDATE;
    data['TUJUAN_PENYERAHAN'] = this.tUJUANPENYERAHAN;
    data['VOL'] = this.vOL;
    data['KD_JMATERIAL'] = this.kDJMATERIAL;
    data['URAIAN'] = this.uRAIAN;
    data['SATUAN'] = this.sATUAN;
    data['SPESIFIKASI'] = this.sPESIFIKASI;
    data['KD_PART'] = this.kDPART;
    data['CREATED_BY'] = this.cREATEDBY;
    data['LAST_UPDATE_BY'] = this.lASTUPDATEBY;
    data['LAST_UPDATE_DATE'] = this.lASTUPDATEDATE;
    data['KD_ST'] = this.kDST;
    data['TOLERANSI'] = this.tOLERANSI;
    data['MAT_HPP'] = this.mATHPP;
    data['ST_MATGIS'] = this.sTMATGIS;
    data['RNUM'] = this.rNUM;
    return data;
  }
}
