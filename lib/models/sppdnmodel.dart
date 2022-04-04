class Sppdnmodel {
  String nOSPPBJ;
  String tGLSURAT;
  String aMANDEMEN;
  String aPP3;
  String aPP2;
  String aPP1;
  String aPPs3;
  String aPPs2;
  String aPPs1;
  String eXPIRED;
  String aPP1EMPID;
  String aPP2EMPID;
  String aPP3EMPID;
  String pATSPPBJ;
  String pATTO;
  String pATSPPBJKET;
  String pATTOKET;
  String vOLPERMINTAAN;
  String vOLTOLERANSI;
  String vOLSPB;
  String cURRENTAPP;
  String cURRENTAPPLEVEL;
  String sTATUS;
  String rEQUESTER;
  String rEQUESTERJABATAN;
  String aPP1JABATAN;
  String aPP2JABATAN;
  String aPP3JABATAN;
  String kDJMATERIAL;
  String sT;
  String tGLST;
  String aPP1JBT;
  String rADATANG;
  String aPP1DATE;
  String rAKIRIM;
  String cATATAN;
  String aPP2JBT;
  String aPP2DATE;
  String aPP3JBT;
  String aPP3DATE;
  String cREATEDBY;
  String cREATEDDATE;
  String lASTUPDATEBY;
  String lASTUPDATEDATE;
  String cHK;
  String cHKEMPID;
  String cHKDATE;
  String lINKNOSPPBJINTERN;
  String pKROWID;
  String rEFSPPBJ;
  String iNVESTASI;
  String rNUM;

  Sppdnmodel(
      {this.nOSPPBJ,
      this.tGLSURAT,
      this.aMANDEMEN,
      this.aPP3,
      this.aPP2,
      this.aPP1,
      this.aPPs3,
      this.aPPs2,
      this.aPPs1,
      this.eXPIRED,
      this.aPP1EMPID,
      this.aPP2EMPID,
      this.aPP3EMPID,
      this.pATSPPBJ,
      this.pATTO,
      this.pATSPPBJKET,
      this.pATTOKET,
      this.vOLPERMINTAAN,
      this.vOLTOLERANSI,
      this.vOLSPB,
      this.cURRENTAPP,
      this.cURRENTAPPLEVEL,
      this.sTATUS,
      this.rEQUESTER,
      this.rEQUESTERJABATAN,
      this.aPP1JABATAN,
      this.aPP2JABATAN,
      this.aPP3JABATAN,
      this.kDJMATERIAL,
      this.sT,
      this.tGLST,
      this.aPP1JBT,
      this.rADATANG,
      this.aPP1DATE,
      this.rAKIRIM,
      this.cATATAN,
      this.aPP2JBT,
      this.aPP2DATE,
      this.aPP3JBT,
      this.aPP3DATE,
      this.cREATEDBY,
      this.cREATEDDATE,
      this.lASTUPDATEBY,
      this.lASTUPDATEDATE,
      this.cHK,
      this.cHKEMPID,
      this.cHKDATE,
      this.lINKNOSPPBJINTERN,
      this.pKROWID,
      this.rEFSPPBJ,
      this.iNVESTASI,
      this.rNUM});

  Sppdnmodel.fromJson(Map<String, dynamic> json) {
    nOSPPBJ = json['NO_SPPBJ'];
    tGLSURAT = json['TGL_SURAT'];
    aMANDEMEN = json['AMANDEMEN'];
    aPP3 = json['APP3'];
    aPP2 = json['APP2'];
    aPP1 = json['APP1'];
    eXPIRED = json['EXPIRED'];
    aPP1EMPID = json['APP1_EMPID'];
    aPP2EMPID = json['APP2_EMPID'];
    aPP3EMPID = json['APP3_EMPID'];
    pATSPPBJ = json['PAT_SPPBJ'];
    pATTO = json['PAT_TO'];
    pATSPPBJKET = json['PAT_SPPBJ_KET'];
    pATTOKET = json['PAT_TO_KET'];
    vOLPERMINTAAN = json['VOL_PERMINTAAN'];
    vOLTOLERANSI = json['VOL_TOLERANSI'];
    vOLSPB = json['VOL_SPB'];
    cURRENTAPP = json['CURRENT_APP'];
    cURRENTAPPLEVEL = json['CURRENT_APP_LEVEL'];
    sTATUS = json['STATUS'];
    rEQUESTER = json['REQUESTER'];
    aPP1 = json['APP1'];
    aPP2 = json['APP2'];
    aPP3 = json['APP3'];
    aPPs1 = json['APP_1'];
    aPPs2 = json['APP_2'];
    aPPs3 = json['APP_3'];
    rEQUESTERJABATAN = json['REQUESTER_JABATAN'];
    aPP1JABATAN = json['APP1_JABATAN'];
    aPP2JABATAN = json['APP2_JABATAN'];
    aPP3JABATAN = json['APP3_JABATAN'];
    kDJMATERIAL = json['KD_JMATERIAL'];
    sT = json['ST'];
    tGLST = json['TGL_ST'];
    aPP1JBT = json['APP1_JBT'];
    rADATANG = json['RA_DATANG'];
    aPP1DATE = json['APP1_DATE'];
    rAKIRIM = json['RA_KIRIM'];
    cATATAN = json['CATATAN'];
    aPP2JBT = json['APP2_JBT'];
    aPP2DATE = json['APP2_DATE'];
    aPP3JBT = json['APP3_JBT'];
    aPP3DATE = json['APP3_DATE'];
    cREATEDBY = json['CREATED_BY'];
    cREATEDDATE = json['CREATED_DATE'];
    lASTUPDATEBY = json['LAST_UPDATE_BY'];
    lASTUPDATEDATE = json['LAST_UPDATE_DATE'];
    cHK = json['CHK'];
    cHKEMPID = json['CHK_EMPID'];
    cHKDATE = json['CHK_DATE'];
    lINKNOSPPBJINTERN = json['LINK_NO_SPPBJ_INTERN'];
    pKROWID = json['PK_ROW_ID'];
    rEFSPPBJ = json['REF_SPPBJ'];
    iNVESTASI = json['INVESTASI'];
    rNUM = json['RNUM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NO_SPPBJ'] = this.nOSPPBJ;
    data['TGL_SURAT'] = this.tGLSURAT;
    data['AMANDEMEN'] = this.aMANDEMEN;
    data['APP3'] = this.aPP3;
    data['APP2'] = this.aPP2;
    data['APP1'] = this.aPP1;
    data['EXPIRED'] = this.eXPIRED;
    data['APP1_EMPID'] = this.aPP1EMPID;
    data['APP2_EMPID'] = this.aPP2EMPID;
    data['APP3_EMPID'] = this.aPP3EMPID;
    data['PAT_SPPBJ'] = this.pATSPPBJ;
    data['PAT_TO'] = this.pATTO;
    data['PAT_SPPBJ_KET'] = this.pATSPPBJKET;
    data['PAT_TO_KET'] = this.pATTOKET;
    data['VOL_PERMINTAAN'] = this.vOLPERMINTAAN;
    data['VOL_TOLERANSI'] = this.vOLTOLERANSI;
    data['VOL_SPB'] = this.vOLSPB;
    data['CURRENT_APP'] = this.cURRENTAPP;
    data['CURRENT_APP_LEVEL'] = this.cURRENTAPPLEVEL;
    data['STATUS'] = this.sTATUS;
    data['REQUESTER'] = this.rEQUESTER;
    data['APP_1'] = this.aPP1;
    data['APP_2'] = this.aPP2;
    data['APP_3'] = this.aPP3;
    data['REQUESTER_JABATAN'] = this.rEQUESTERJABATAN;
    data['APP1_JABATAN'] = this.aPP1JABATAN;
    data['APP2_JABATAN'] = this.aPP2JABATAN;
    data['APP3_JABATAN'] = this.aPP3JABATAN;
    data['KD_JMATERIAL'] = this.kDJMATERIAL;
    data['ST'] = this.sT;
    data['TGL_ST'] = this.tGLST;
    data['APP1_JBT'] = this.aPP1JBT;
    data['RA_DATANG'] = this.rADATANG;
    data['APP1_DATE'] = this.aPP1DATE;
    data['RA_KIRIM'] = this.rAKIRIM;
    data['CATATAN'] = this.cATATAN;
    data['APP2_JBT'] = this.aPP2JBT;
    data['APP2_DATE'] = this.aPP2DATE;
    data['APP3_JBT'] = this.aPP3JBT;
    data['APP3_DATE'] = this.aPP3DATE;
    data['CREATED_BY'] = this.cREATEDBY;
    data['CREATED_DATE'] = this.cREATEDDATE;
    data['LAST_UPDATE_BY'] = this.lASTUPDATEBY;
    data['LAST_UPDATE_DATE'] = this.lASTUPDATEDATE;
    data['CHK'] = this.cHK;
    data['CHK_EMPID'] = this.cHKEMPID;
    data['CHK_DATE'] = this.cHKDATE;
    data['LINK_NO_SPPBJ_INTERN'] = this.lINKNOSPPBJINTERN;
    data['PK_ROW_ID'] = this.pKROWID;
    data['REF_SPPBJ'] = this.rEFSPPBJ;
    data['INVESTASI'] = this.iNVESTASI;
    data['RNUM'] = this.rNUM;
    return data;
  }
}
