class Invoicedetailmodel {
  String nOINVOICE;
  String nOBAPB;
  String kDMATERIAL;
  String vOLUME;
  String hARSAT;
  String hARGA;
  String nOSPB;
  String sPESIFIKASI;
  String pROSES;
  String kETERANGAN;
  String sISA;
  String uRAIAN;
  String kDJMATERIAL;
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
  String rNUM;

  Invoicedetailmodel(
      {this.nOINVOICE,
      this.nOBAPB,
      this.kDMATERIAL,
      this.vOLUME,
      this.hARSAT,
      this.hARGA,
      this.nOSPB,
      this.sPESIFIKASI,
      this.pROSES,
      this.kETERANGAN,
      this.sISA,
      this.uRAIAN,
      this.kDJMATERIAL,
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
      this.rNUM});

  Invoicedetailmodel.fromJson(Map<String, dynamic> json) {
    nOINVOICE = json['NO_INVOICE'];
    nOBAPB = json['NO_BAPB'];
    kDMATERIAL = json['KD_MATERIAL'];
    vOLUME = json['VOLUME'];
    hARSAT = json['HARSAT'];
    hARGA = json['HARGA'];
    nOSPB = json['NO_SPB'];
    sPESIFIKASI = json['SPESIFIKASI'];
    pROSES = json['PROSES'];
    kETERANGAN = json['KETERANGAN'];
    sISA = json['SISA'];
    uRAIAN = json['URAIAN'];
    kDJMATERIAL = json['KD_JMATERIAL'];
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
    rNUM = json['RNUM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NO_INVOICE'] = this.nOINVOICE;
    data['NO_BAPB'] = this.nOBAPB;
    data['KD_MATERIAL'] = this.kDMATERIAL;
    data['VOLUME'] = this.vOLUME;
    data['HARSAT'] = this.hARSAT;
    data['HARGA'] = this.hARGA;
    data['NO_SPB'] = this.nOSPB;
    data['SPESIFIKASI'] = this.sPESIFIKASI;
    data['PROSES'] = this.pROSES;
    data['KETERANGAN'] = this.kETERANGAN;
    data['SISA'] = this.sISA;
    data['URAIAN'] = this.uRAIAN;
    data['KD_JMATERIAL'] = this.kDJMATERIAL;
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
    data['RNUM'] = this.rNUM;
    return data;
  }
}
