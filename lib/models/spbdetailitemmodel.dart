class Spbdetailitemmodel {
  String nOSPB;
  String kDMATERIAL;
  String vOL;
  String sPESIFIKASI;
  String hARGA;
  String kET;
  String nOSPPBJ;
  String tGLRENCANAPENDATANGAN;
  String hARGANONRP;
  String cONVERTHARGA;
  String oNGKOSANGKUTAN;
  String sTATUSPERSEN;
  String sTATUSCOMPLETE;
  String hPP;
  String cAPEX;
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
  String rNUM;
  String tglsurat;
  String vOLSPPBJCOUNT;

  Spbdetailitemmodel(
      {this.nOSPB,
      this.kDMATERIAL,
      this.vOL,
      this.sPESIFIKASI,
      this.hARGA,
      this.kET,
      this.nOSPPBJ,
      this.tGLRENCANAPENDATANGAN,
      this.hARGANONRP,
      this.cONVERTHARGA,
      this.oNGKOSANGKUTAN,
      this.sTATUSPERSEN,
      this.sTATUSCOMPLETE,
      this.hPP,
      this.cAPEX,
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
      this.rNUM,
      this.tglsurat,
      this.vOLSPPBJCOUNT});

  Spbdetailitemmodel.fromJson(Map<String, dynamic> json) {
    nOSPB = json['NO_SPB'];
    kDMATERIAL = json['KD_MATERIAL'];
    vOL = json['VOL'];
    sPESIFIKASI = json['SPESIFIKASI'];
    hARGA = json['HARGA'];
    kET = json['KET'];
    nOSPPBJ = json['NO_SPPBJ'];
    tGLRENCANAPENDATANGAN = json['TGL_RENCANA_PENDATANGAN'];
    hARGANONRP = json['HARGA_NON_RP'];
    cONVERTHARGA = json['CONVERT_HARGA'];
    oNGKOSANGKUTAN = json['ONGKOS_ANGKUTAN'];
    sTATUSPERSEN = json['STATUS_PERSEN'];
    sTATUSCOMPLETE = json['STATUS_COMPLETE'];
    hPP = json['HPP'];
    cAPEX = json['CAPEX'];
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
    rNUM = json['RNUM'];
    tglsurat = json['TGL_SURAT'];
    vOLSPPBJCOUNT = json['VOL_SPPBJ_COUNT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NO_SPB'] = this.nOSPB;
    data['KD_MATERIAL'] = this.kDMATERIAL;
    data['VOL'] = this.vOL;
    data['SPESIFIKASI'] = this.sPESIFIKASI;
    data['HARGA'] = this.hARGA;
    data['KET'] = this.kET;
    data['NO_SPPBJ'] = this.nOSPPBJ;
    data['TGL_RENCANA_PENDATANGAN'] = this.tGLRENCANAPENDATANGAN;
    data['HARGA_NON_RP'] = this.hARGANONRP;
    data['CONVERT_HARGA'] = this.cONVERTHARGA;
    data['ONGKOS_ANGKUTAN'] = this.oNGKOSANGKUTAN;
    data['STATUS_PERSEN'] = this.sTATUSPERSEN;
    data['STATUS_COMPLETE'] = this.sTATUSCOMPLETE;
    data['HPP'] = this.hPP;
    data['CAPEX'] = this.cAPEX;
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
    data['RNUM'] = this.rNUM;
    data['TGL_SURAT'] = this.tglsurat;
    data['VOL_SPPBJ_COUNT'] = this.vOLSPPBJCOUNT;
    return data;
  }
}
