class Spmksmodel {
  String nOSPMKS;
  String pATSPMKS;
  String tGLSPMKS;
  String aPP1;
  String aPP1EMPID;
  String aPP1JBT;
  String aPP1DATE;
  String aPP2;
  String aPP2EMPID;
  String aPP2JBT;
  String aPP2DATE;
  String cREATEDBY;
  String cREATEDDATE;
  String lASTUPDATEBY;
  String lASTUPDATEDATE;
  String eXPIRED;
  String nAMAPAT;
  String rNUM;

  Spmksmodel(
      {this.nOSPMKS,
      this.pATSPMKS,
      this.tGLSPMKS,
      this.aPP1,
      this.aPP1EMPID,
      this.aPP1JBT,
      this.aPP1DATE,
      this.aPP2,
      this.aPP2EMPID,
      this.aPP2JBT,
      this.aPP2DATE,
      this.cREATEDBY,
      this.cREATEDDATE,
      this.lASTUPDATEBY,
      this.lASTUPDATEDATE,
      this.eXPIRED,
      this.nAMAPAT,
      this.rNUM});

  Spmksmodel.fromJson(Map<String, dynamic> json) {
    nOSPMKS = json['NO_SPMKS'];
    pATSPMKS = json['PAT_SPMKS'];
    tGLSPMKS = json['TGL_SPMKS'];
    aPP1 = json['APP1'];
    aPP1EMPID = json['APP1_EMPID'];
    aPP1JBT = json['APP1_JBT'];
    aPP1DATE = json['APP1_DATE'];
    aPP2 = json['APP2'];
    aPP2EMPID = json['APP2_EMPID'];
    aPP2JBT = json['APP2_JBT'];
    aPP2DATE = json['APP2_DATE'];
    cREATEDBY = json['CREATED_BY'];
    cREATEDDATE = json['CREATED_DATE'];
    lASTUPDATEBY = json['LAST_UPDATE_BY'];
    lASTUPDATEDATE = json['LAST_UPDATE_DATE'];
    eXPIRED = json['EXPIRED'];
    nAMAPAT = json['NAMA_PAT'];
    rNUM = json['RNUM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NO_SPMKS'] = this.nOSPMKS;
    data['PAT_SPMKS'] = this.pATSPMKS;
    data['TGL_SPMKS'] = this.tGLSPMKS;
    data['APP1'] = this.aPP1;
    data['APP1_EMPID'] = this.aPP1EMPID;
    data['APP1_JBT'] = this.aPP1JBT;
    data['APP1_DATE'] = this.aPP1DATE;
    data['APP2'] = this.aPP2;
    data['APP2_EMPID'] = this.aPP2EMPID;
    data['APP2_JBT'] = this.aPP2JBT;
    data['APP2_DATE'] = this.aPP2DATE;
    data['CREATED_BY'] = this.cREATEDBY;
    data['CREATED_DATE'] = this.cREATEDDATE;
    data['LAST_UPDATE_BY'] = this.lASTUPDATEBY;
    data['LAST_UPDATE_DATE'] = this.lASTUPDATEDATE;
    data['EXPIRED'] = this.eXPIRED;
    data['NAMA_PAT'] = this.nAMAPAT;
    data['RNUM'] = this.rNUM;
    return data;
  }
}
