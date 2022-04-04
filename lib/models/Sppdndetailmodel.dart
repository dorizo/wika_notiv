class Sppdndetailmodel {
  String nOSPPBJ;
  String kDMATERIAL;
  String nOURUT;
  String sPESIFIKASI;
  String vOL;
  String kET;
  String tGLPEMAKAIAN;
  String vOLDIPENUHI;
  String tGLPEMAKAIAN2;
  String tGLDITERIMA;
  String tGLDITERIMA2;
  String pERUNTUKAN;
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

  Sppdndetailmodel(
      {this.nOSPPBJ,
      this.kDMATERIAL,
      this.nOURUT,
      this.sPESIFIKASI,
      this.vOL,
      this.kET,
      this.tGLPEMAKAIAN,
      this.vOLDIPENUHI,
      this.tGLPEMAKAIAN2,
      this.tGLDITERIMA,
      this.tGLDITERIMA2,
      this.pERUNTUKAN,
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
      this.sTMATGIS});

  Sppdndetailmodel.fromJson(Map<String, dynamic> json) {
    nOSPPBJ = json['NO_SPPBJ'];
    kDMATERIAL = json['KD_MATERIAL'];
    nOURUT = json['NO_URUT'];
    sPESIFIKASI = json['SPESIFIKASI'];
    vOL = json['VOL'];
    kET = json['KET'];
    tGLPEMAKAIAN = json['TGL_PEMAKAIAN'];
    vOLDIPENUHI = json['VOL_DIPENUHI'];
    tGLPEMAKAIAN2 = json['TGL_PEMAKAIAN2'];
    tGLDITERIMA = json['TGL_DITERIMA'];
    tGLDITERIMA2 = json['TGL_DITERIMA2'];
    pERUNTUKAN = json['PERUNTUKAN'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NO_SPPBJ'] = this.nOSPPBJ;
    data['KD_MATERIAL'] = this.kDMATERIAL;
    data['NO_URUT'] = this.nOURUT;
    data['SPESIFIKASI'] = this.sPESIFIKASI;
    data['VOL'] = this.vOL;
    data['KET'] = this.kET;
    data['TGL_PEMAKAIAN'] = this.tGLPEMAKAIAN;
    data['VOL_DIPENUHI'] = this.vOLDIPENUHI;
    data['TGL_PEMAKAIAN2'] = this.tGLPEMAKAIAN2;
    data['TGL_DITERIMA'] = this.tGLDITERIMA;
    data['TGL_DITERIMA2'] = this.tGLDITERIMA2;
    data['PERUNTUKAN'] = this.pERUNTUKAN;
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
    return data;
  }
}
