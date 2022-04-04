class Bapmdetailmodel {
  String nOBAPM;
  String kDMATERIAL;
  String sPESIFIKASI;
  String vOL;
  String hARGA;
  String kDLINI;
  String oNGKOSANGKUTAN;
  String kDJMATERIAL;
  String uRAIAN;
  String sATUAN;
  String kDPART;
  String cREATEDBY;
  String cREATEDDATE;
  String lASTUPDATEBY;
  String lASTUPDATEDATE;
  String kDST;
  String tOLERANSI;
  String mATHPP;
  String sTMATGIS;
  String vOLSPPBJ;
  Bapmdetailmodel(
      {this.nOBAPM,
      this.kDMATERIAL,
      this.sPESIFIKASI,
      this.vOL,
      this.hARGA,
      this.kDLINI,
      this.oNGKOSANGKUTAN,
      this.kDJMATERIAL,
      this.uRAIAN,
      this.sATUAN,
      this.kDPART,
      this.cREATEDBY,
      this.cREATEDDATE,
      this.lASTUPDATEBY,
      this.lASTUPDATEDATE,
      this.kDST,
      this.tOLERANSI,
      this.mATHPP,
      this.sTMATGIS,
      this.vOLSPPBJ});

  Bapmdetailmodel.fromJson(Map<String, dynamic> json) {
    nOBAPM = json['NO_BAPM'];
    kDMATERIAL = json['KD_MATERIAL'];
    sPESIFIKASI = json['SPESIFIKASI'];
    vOL = json['VOL'];
    hARGA = json['HARGA'];
    kDLINI = json['KD_LINI'];
    oNGKOSANGKUTAN = json['ONGKOS_ANGKUTAN'];
    kDJMATERIAL = json['KD_JMATERIAL'];
    uRAIAN = json['URAIAN'];
    sATUAN = json['SATUAN'];
    kDPART = json['KD_PART'];
    cREATEDBY = json['CREATED_BY'];
    cREATEDDATE = json['CREATED_DATE'];
    lASTUPDATEBY = json['LAST_UPDATE_BY'];
    lASTUPDATEDATE = json['LAST_UPDATE_DATE'];
    kDST = json['KD_ST'];
    tOLERANSI = json['TOLERANSI'];
    mATHPP = json['MAT_HPP'];
    sTMATGIS = json['ST_MATGIS'];
    vOLSPPBJ = json['VOL_SPPBJ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NO_BAPM'] = this.nOBAPM;
    data['KD_MATERIAL'] = this.kDMATERIAL;
    data['SPESIFIKASI'] = this.sPESIFIKASI;
    data['VOL'] = this.vOL;
    data['HARGA'] = this.hARGA;
    data['KD_LINI'] = this.kDLINI;
    data['ONGKOS_ANGKUTAN'] = this.oNGKOSANGKUTAN;
    data['KD_JMATERIAL'] = this.kDJMATERIAL;
    data['URAIAN'] = this.uRAIAN;
    data['SATUAN'] = this.sATUAN;
    data['KD_PART'] = this.kDPART;
    data['CREATED_BY'] = this.cREATEDBY;
    data['CREATED_DATE'] = this.cREATEDDATE;
    data['LAST_UPDATE_BY'] = this.lASTUPDATEBY;
    data['LAST_UPDATE_DATE'] = this.lASTUPDATEDATE;
    data['KD_ST'] = this.kDST;
    data['TOLERANSI'] = this.tOLERANSI;
    data['MAT_HPP'] = this.mATHPP;
    data['ST_MATGIS'] = this.sTMATGIS;
    data['VOL_SPPBJ'] = this.vOLSPPBJ;
    return data;
  }
}
