class Bapbdetailmodel {
  String nOBAPB;
  String kDMATERIAL;
  String vOL;
  String qC;
  String nOSPPBJ;
  String sPESIFIKASI;
  String tGLRENCANAPENDATANGAN;
  String vOLTERIMA;
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

  Bapbdetailmodel(
      {this.nOBAPB,
      this.kDMATERIAL,
      this.vOL,
      this.qC,
      this.nOSPPBJ,
      this.sPESIFIKASI,
      this.tGLRENCANAPENDATANGAN,
      this.vOLTERIMA,
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
      this.rNUM});

  Bapbdetailmodel.fromJson(Map<String, dynamic> json) {
    nOBAPB = json['NO_BAPB'];
    kDMATERIAL = json['KD_MATERIAL'];
    vOL = json['VOL'];
    qC = json['QC'];
    nOSPPBJ = json['NO_SPPBJ'];
    sPESIFIKASI = json['SPESIFIKASI'];
    tGLRENCANAPENDATANGAN = json['TGL_RENCANA_PENDATANGAN'];
    vOLTERIMA = json['VOL_TERIMA'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NO_BAPB'] = this.nOBAPB;
    data['KD_MATERIAL'] = this.kDMATERIAL;
    data['VOL'] = this.vOL;
    data['QC'] = this.qC;
    data['NO_SPPBJ'] = this.nOSPPBJ;
    data['SPESIFIKASI'] = this.sPESIFIKASI;
    data['TGL_RENCANA_PENDATANGAN'] = this.tGLRENCANAPENDATANGAN;
    data['VOL_TERIMA'] = this.vOLTERIMA;
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
    return data;
  }
}
