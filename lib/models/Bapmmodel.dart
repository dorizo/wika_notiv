class Bapmmodel {
  String nOBAPM;
  String pATBAPM;
  String nOSPB;
  String pATTO;
  String tGLBAPM;
  String aPP1;
  String aPP1EMPID;
  String aPP1JBT;
  String aPP1DATE;
  String aPP2;
  String aPP2EMPID;
  String aPP2JBT;
  String aPP2DATE;
  String aPP3;
  String aPP3EMPID;
  String aPP3JBT;
  String aPP3DATE;
  String aPP4;
  String cHK;
  String aPP4EMPID;
  String aPP4JBT;
  String cHKEMPID;
  String cHKDATE;
  String cREATEDBY;
  String aPP4DATE;
  String cREATEDDATE;
  String lASTUPDATEBY;
  String lASTUPDATEDATE;
  String nOBAPB;
  String nOSPPBJ;
  String nOPESANANPS;
  String tGLSPB;
  String eXPIRED;
  String nAMAPAT;
  String nAMAPATTO;
  String rNUM;

  Bapmmodel(
      {this.nOBAPM,
      this.pATBAPM,
      this.nOSPB,
      this.pATTO,
      this.tGLBAPM,
      this.aPP1,
      this.aPP1EMPID,
      this.aPP1JBT,
      this.aPP1DATE,
      this.aPP2,
      this.aPP2EMPID,
      this.aPP2JBT,
      this.aPP2DATE,
      this.aPP3,
      this.aPP3EMPID,
      this.aPP3JBT,
      this.aPP3DATE,
      this.aPP4,
      this.cHK,
      this.aPP4EMPID,
      this.aPP4JBT,
      this.cHKEMPID,
      this.cHKDATE,
      this.cREATEDBY,
      this.aPP4DATE,
      this.cREATEDDATE,
      this.lASTUPDATEBY,
      this.lASTUPDATEDATE,
      this.nOBAPB,
      this.nOSPPBJ,
      this.nOPESANANPS,
      this.tGLSPB,
      this.eXPIRED,
      this.nAMAPAT,
      this.nAMAPATTO,
      this.rNUM});

  Bapmmodel.fromJson(Map<String, dynamic> json) {
    nOBAPM = json['NO_BAPM'];
    pATBAPM = json['PAT_BAPM'];
    nOSPB = json['NO_SPB'];
    pATTO = json['PAT_TO'];
    tGLBAPM = json['TGL_BAPM'];
    aPP1 = json['APP1'];
    aPP1EMPID = json['APP1_EMPID'];
    aPP1JBT = json['APP1_JBT'];
    aPP1DATE = json['APP1_DATE'];
    aPP2 = json['APP2'];
    aPP2EMPID = json['APP2_EMPID'];
    aPP2JBT = json['APP2_JBT'];
    aPP2DATE = json['APP2_DATE'];
    aPP3 = json['APP3'];
    aPP3EMPID = json['APP3_EMPID'];
    aPP3JBT = json['APP3_JBT'];
    aPP3DATE = json['APP3_DATE'];
    aPP4 = json['APP4'];
    cHK = json['CHK'];
    aPP4EMPID = json['APP4_EMPID'];
    aPP4JBT = json['APP4_JBT'];
    cHKEMPID = json['CHK_EMPID'];
    cHKDATE = json['CHK_DATE'];
    cREATEDBY = json['CREATED_BY'];
    aPP4DATE = json['APP4_DATE'];
    cREATEDDATE = json['CREATED_DATE'];
    lASTUPDATEBY = json['LAST_UPDATE_BY'];
    lASTUPDATEDATE = json['LAST_UPDATE_DATE'];
    nOBAPB = json['NO_BAPB'];
    nOSPPBJ = json['NO_SPPBJ'];
    nOPESANANPS = json['NO_PESANAN_PS'];
    tGLSPB = json['TGL_SPB'];
    eXPIRED = json['EXPIRED'];
    nAMAPAT = json['NAMA_PAT'];
    nAMAPATTO = json['NAMA_PAT_TO'];
    rNUM = json['RNUM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NO_BAPM'] = this.nOBAPM;
    data['PAT_BAPM'] = this.pATBAPM;
    data['NO_SPB'] = this.nOSPB;
    data['PAT_TO'] = this.pATTO;
    data['TGL_BAPM'] = this.tGLBAPM;
    data['APP1'] = this.aPP1;
    data['APP1_EMPID'] = this.aPP1EMPID;
    data['APP1_JBT'] = this.aPP1JBT;
    data['APP1_DATE'] = this.aPP1DATE;
    data['APP2'] = this.aPP2;
    data['APP2_EMPID'] = this.aPP2EMPID;
    data['APP2_JBT'] = this.aPP2JBT;
    data['APP2_DATE'] = this.aPP2DATE;
    data['APP3'] = this.aPP3;
    data['APP3_EMPID'] = this.aPP3EMPID;
    data['APP3_JBT'] = this.aPP3JBT;
    data['APP3_DATE'] = this.aPP3DATE;
    data['APP4'] = this.aPP4;
    data['CHK'] = this.cHK;
    data['APP4_EMPID'] = this.aPP4EMPID;
    data['APP4_JBT'] = this.aPP4JBT;
    data['CHK_EMPID'] = this.cHKEMPID;
    data['CHK_DATE'] = this.cHKDATE;
    data['CREATED_BY'] = this.cREATEDBY;
    data['APP4_DATE'] = this.aPP4DATE;
    data['CREATED_DATE'] = this.cREATEDDATE;
    data['LAST_UPDATE_BY'] = this.lASTUPDATEBY;
    data['LAST_UPDATE_DATE'] = this.lASTUPDATEDATE;
    data['NO_BAPB'] = this.nOBAPB;
    data['NO_SPPBJ'] = this.nOSPPBJ;
    data['NO_PESANAN_PS'] = this.nOPESANANPS;
    data['TGL_SPB'] = this.tGLSPB;
    data['EXPIRED'] = this.eXPIRED;
    data['NAMA_PAT'] = this.nAMAPAT;
    data['NAMA_PAT_TO'] = this.nAMAPATTO;
    data['RNUM'] = this.rNUM;
    return data;
  }
}
