class spmksdetailmodel {
  String nOSPMKS;
  String kDMATERIAL;
  String vOL;
  String nOURUT;
  String kDLINI;
  String kET;
  String nOINVENTARIS;
  String vOLAPP;
  String kDJMATERIAL;
  String uRAIAN;
  String sATUAN;
  String sPESIFIKASI;
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

  spmksdetailmodel(
      {this.nOSPMKS,
      this.kDMATERIAL,
      this.vOL,
      this.nOURUT,
      this.kDLINI,
      this.kET,
      this.nOINVENTARIS,
      this.vOLAPP,
      this.kDJMATERIAL,
      this.uRAIAN,
      this.sATUAN,
      this.sPESIFIKASI,
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

  spmksdetailmodel.fromJson(Map<String, dynamic> json) {
    nOSPMKS = json['NO_SPMKS'];
    kDMATERIAL = json['KD_MATERIAL'];
    vOL = json['VOL'];
    nOURUT = json['NO_URUT'];
    kDLINI = json['KD_LINI'];
    kET = json['KET'];
    nOINVENTARIS = json['NO_INVENTARIS'];
    vOLAPP = json['VOL_APP'];
    kDJMATERIAL = json['KD_JMATERIAL'];
    uRAIAN = json['URAIAN'];
    sATUAN = json['SATUAN'];
    sPESIFIKASI = json['SPESIFIKASI'];
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
    data['NO_SPMKS'] = this.nOSPMKS;
    data['KD_MATERIAL'] = this.kDMATERIAL;
    data['VOL'] = this.vOL;
    data['NO_URUT'] = this.nOURUT;
    data['KD_LINI'] = this.kDLINI;
    data['KET'] = this.kET;
    data['NO_INVENTARIS'] = this.nOINVENTARIS;
    data['VOL_APP'] = this.vOLAPP;
    data['KD_JMATERIAL'] = this.kDJMATERIAL;
    data['URAIAN'] = this.uRAIAN;
    data['SATUAN'] = this.sATUAN;
    data['SPESIFIKASI'] = this.sPESIFIKASI;
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
