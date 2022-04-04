class BanModel {
  String nOBAN;
  String tGLBAN;
  String pPH;
  String pENYERAHAN;
  String jENISPEMBAYARAN;
  String pEMBAYARAN;
  String jENISLC;
  String kETPEMBAYARAN;
  String tGLAWAL;
  String tGLAKHIR;
  String vENDORID;
  String eMAILVENDOR;
  String pATBAN;
  String cREATEDBY;
  String cREATEDDATE;
  String tUJUANPENYERAHAN;
  String pPHID;
  String aPP1;
  String aPP1DATE;
  String aPP1EMPID;
  String aPP1JBT;
  String aPP2;
  String aPP2DATE;
  String aPP2EMPID;
  String aPP2JBT;
  String cUSTOMTEXT;
  String nOPENAWARAN;
  String kDPEKERJAAN;
  String pATVENDOR;
  String nAMA;
  String aLAMAT;
  String tELPAREA;
  String tELP;
  String fAX;
  String kOTA;
  String tELPAREA2;
  String tELP2;
  String fAX2;
  String kOTA2;
  String aLAMAT2;
  String tELPAREA3;
  String tELP3;
  String fAX3;
  String kOTA3;
  String aLAMAT3;
  String cONTACTPERSON;
  String tGLPENILAIAN;
  String nOKUALIFIKASI;
  String kETKUALIFIKASI;
  String rANK;
  String lASTUPDATEBY;
  String lASTUPDATEDATE;
  String vALID;
  String nPWP;
  String bERELASI;
  String eMAIL;
  String rNUM;
  String aPP1NAME;
  String aPP2NAME;

  BanModel(
      {this.nOBAN,
      this.tGLBAN,
      this.pPH,
      this.pENYERAHAN,
      this.jENISPEMBAYARAN,
      this.pEMBAYARAN,
      this.jENISLC,
      this.kETPEMBAYARAN,
      this.tGLAWAL,
      this.tGLAKHIR,
      this.vENDORID,
      this.eMAILVENDOR,
      this.pATBAN,
      this.cREATEDBY,
      this.cREATEDDATE,
      this.tUJUANPENYERAHAN,
      this.pPHID,
      this.aPP1,
      this.aPP1DATE,
      this.aPP1EMPID,
      this.aPP1JBT,
      this.aPP2,
      this.aPP2DATE,
      this.aPP2EMPID,
      this.aPP2JBT,
      this.cUSTOMTEXT,
      this.nOPENAWARAN,
      this.kDPEKERJAAN,
      this.pATVENDOR,
      this.nAMA,
      this.aLAMAT,
      this.tELPAREA,
      this.tELP,
      this.fAX,
      this.kOTA,
      this.tELPAREA2,
      this.tELP2,
      this.fAX2,
      this.kOTA2,
      this.aLAMAT2,
      this.tELPAREA3,
      this.tELP3,
      this.fAX3,
      this.kOTA3,
      this.aLAMAT3,
      this.cONTACTPERSON,
      this.tGLPENILAIAN,
      this.nOKUALIFIKASI,
      this.kETKUALIFIKASI,
      this.rANK,
      this.lASTUPDATEBY,
      this.lASTUPDATEDATE,
      this.vALID,
      this.nPWP,
      this.bERELASI,
      this.eMAIL,
      this.rNUM,
      this.aPP1NAME,
      this.aPP2NAME});

  BanModel.fromJson(Map<String, dynamic> json) {
    nOBAN = json['NO_BAN'];
    tGLBAN = json['TGL_BAN'];
    pPH = json['PPH'];
    pENYERAHAN = json['PENYERAHAN'];
    jENISPEMBAYARAN = json['JENIS_PEMBAYARAN'];
    pEMBAYARAN = json['PEMBAYARAN'];
    jENISLC = json['JENIS_LC'];
    kETPEMBAYARAN = json['KET_PEMBAYARAN'];
    tGLAWAL = json['TGL_AWAL'];
    tGLAKHIR = json['TGL_AKHIR'];
    vENDORID = json['VENDOR_ID'];
    eMAILVENDOR = json['EMAIL_VENDOR'];
    pATBAN = json['PAT_BAN'];
    cREATEDBY = json['CREATED_BY'];
    cREATEDDATE = json['CREATED_DATE'];
    tUJUANPENYERAHAN = json['TUJUAN_PENYERAHAN'];
    pPHID = json['PPH_ID'];
    aPP1 = json['APP1'];
    aPP1DATE = json['APP1_DATE'];
    aPP1EMPID = json['APP1_EMPID'];
    aPP1JBT = json['APP1_JBT'];
    aPP2 = json['APP2'];
    aPP2DATE = json['APP2_DATE'];
    aPP2EMPID = json['APP2_EMPID'];
    aPP2JBT = json['APP2_JBT'];
    cUSTOMTEXT = json['CUSTOM_TEXT'];
    nOPENAWARAN = json['NO_PENAWARAN'];
    kDPEKERJAAN = json['KD_PEKERJAAN'];
    pATVENDOR = json['PAT_VENDOR'];
    nAMA = json['NAMA'];
    aLAMAT = json['ALAMAT'];
    tELPAREA = json['TELP_AREA'];
    tELP = json['TELP'];
    fAX = json['FAX'];
    kOTA = json['KOTA'];
    tELPAREA2 = json['TELP_AREA2'];
    tELP2 = json['TELP2'];
    fAX2 = json['FAX2'];
    kOTA2 = json['KOTA2'];
    aLAMAT2 = json['ALAMAT2'];
    tELPAREA3 = json['TELP_AREA3'];
    tELP3 = json['TELP3'];
    fAX3 = json['FAX3'];
    kOTA3 = json['KOTA3'];
    aLAMAT3 = json['ALAMAT3'];
    cONTACTPERSON = json['CONTACT_PERSON'];
    tGLPENILAIAN = json['TGL_PENILAIAN'];
    nOKUALIFIKASI = json['NO_KUALIFIKASI'];
    kETKUALIFIKASI = json['KET_KUALIFIKASI'];
    rANK = json['RANK'];
    lASTUPDATEBY = json['LAST_UPDATE_BY'];
    lASTUPDATEDATE = json['LAST_UPDATE_DATE'];
    vALID = json['VALID'];
    nPWP = json['NPWP'];
    bERELASI = json['BERELASI'];
    eMAIL = json['EMAIL'];
    rNUM = json['RNUM'];
    aPP1NAME = json['APP1_NAME'];
    aPP2NAME = json['APP2_NAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NO_BAN'] = this.nOBAN;
    data['TGL_BAN'] = this.tGLBAN;
    data['PPH'] = this.pPH;
    data['PENYERAHAN'] = this.pENYERAHAN;
    data['JENIS_PEMBAYARAN'] = this.jENISPEMBAYARAN;
    data['PEMBAYARAN'] = this.pEMBAYARAN;
    data['JENIS_LC'] = this.jENISLC;
    data['KET_PEMBAYARAN'] = this.kETPEMBAYARAN;
    data['TGL_AWAL'] = this.tGLAWAL;
    data['TGL_AKHIR'] = this.tGLAKHIR;
    data['VENDOR_ID'] = this.vENDORID;
    data['EMAIL_VENDOR'] = this.eMAILVENDOR;
    data['PAT_BAN'] = this.pATBAN;
    data['CREATED_BY'] = this.cREATEDBY;
    data['CREATED_DATE'] = this.cREATEDDATE;
    data['TUJUAN_PENYERAHAN'] = this.tUJUANPENYERAHAN;
    data['PPH_ID'] = this.pPHID;
    data['APP1'] = this.aPP1;
    data['APP1_DATE'] = this.aPP1DATE;
    data['APP1_EMPID'] = this.aPP1EMPID;
    data['APP1_JBT'] = this.aPP1JBT;
    data['APP2'] = this.aPP2;
    data['APP2_DATE'] = this.aPP2DATE;
    data['APP2_EMPID'] = this.aPP2EMPID;
    data['APP2_JBT'] = this.aPP2JBT;
    data['CUSTOM_TEXT'] = this.cUSTOMTEXT;
    data['NO_PENAWARAN'] = this.nOPENAWARAN;
    data['KD_PEKERJAAN'] = this.kDPEKERJAAN;
    data['PAT_VENDOR'] = this.pATVENDOR;
    data['NAMA'] = this.nAMA;
    data['ALAMAT'] = this.aLAMAT;
    data['TELP_AREA'] = this.tELPAREA;
    data['TELP'] = this.tELP;
    data['FAX'] = this.fAX;
    data['KOTA'] = this.kOTA;
    data['TELP_AREA2'] = this.tELPAREA2;
    data['TELP2'] = this.tELP2;
    data['FAX2'] = this.fAX2;
    data['KOTA2'] = this.kOTA2;
    data['ALAMAT2'] = this.aLAMAT2;
    data['TELP_AREA3'] = this.tELPAREA3;
    data['TELP3'] = this.tELP3;
    data['FAX3'] = this.fAX3;
    data['KOTA3'] = this.kOTA3;
    data['ALAMAT3'] = this.aLAMAT3;
    data['CONTACT_PERSON'] = this.cONTACTPERSON;
    data['TGL_PENILAIAN'] = this.tGLPENILAIAN;
    data['NO_KUALIFIKASI'] = this.nOKUALIFIKASI;
    data['KET_KUALIFIKASI'] = this.kETKUALIFIKASI;
    data['RANK'] = this.rANK;
    data['LAST_UPDATE_BY'] = this.lASTUPDATEBY;
    data['LAST_UPDATE_DATE'] = this.lASTUPDATEDATE;
    data['VALID'] = this.vALID;
    data['NPWP'] = this.nPWP;
    data['BERELASI'] = this.bERELASI;
    data['EMAIL'] = this.eMAIL;
    data['RNUM'] = this.rNUM;
    data['APP1_NAME'] = this.aPP1NAME;
    data['APP2_NAME'] = this.aPP2NAME;
    return data;
  }
}
