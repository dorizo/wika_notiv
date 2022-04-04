class Spbmodel {
  String nOSPB;
  String nOSPPBJ;
  String tGLSPB;
  String pATSPB;
  String pATSPBKET;
  String pATTO;
  String pATTOKET;
  String vENDORID;
  String nAMAVENDOR;
  String kDPENYERAHAN;
  String kETPENYERAHAN;
  String vOLSPB;
  String tOLERANSI;
  String vOLBAPB;
  String sPBSTATUS;
  String aPP1EMPID;
  String aPP2EMPID;
  String aPP1NAME;
  String aPP2NAME;
  String aPP1JBT;
  String aPP2JBT;
  String kDCURRENCY;
  String tGLSURAT;
  String tIPE;
  String pENYERAHAN;
  String pEMBICARAANTGL;
  String aPP1;
  String pPN;
  String pPH;
  String jADWALTTD;
  String sTAMBIL;
  String aPP1DATE;
  String tGLAMBIL;
  String tGLKIRIM;
  String tGLDATANG;
  String aPP2;
  String aPP2DATE;
  String cREATEDBY;
  String cHK;
  String cHKEMPID;
  String cREATEDDATE;
  String lASTUPDATEBY;
  String cHKDATE;
  String lASTUPDATEDATE;
  String tGLRENCANADATANG;
  String vALCURRENCY;
  String sTATUSPERSENBAPB;
  String sTATUSPERSENINV;
  String sTATUSPERSENPAYMENT;
  String tOTALHARGA;
  String cURRCONVENTION;
  String tOTALHARGARP;
  String eMAILVENDOR;
  String kETERANGAN;
  String tEMPATTUJUAN;
  String tGLTERIMA;
  String tGLTERIMAAKH;
  String sPEKTEKNIS;
  String pEMBAYARANSCF;
  String aPPVENDORNAMA;
  String aPPVENDORJBT;
  String eXPIRED;
  String sTATUS;
  String cLOSENOTES;
  String jENISPEMBAYARAN;
  String rEPEATORDER;
  String vENDORIDANGKT;
  String kETPEMBAYARAN;
  String jENISLC;
  String aLAMATPENGIRIMAN;
  String aLAMATVENDOR;
  String nOBAN;
  String tGLBAN;
  String rNUM;

  Spbmodel(
      {this.nOSPB,
      this.nOSPPBJ,
      this.tGLSPB,
      this.pATSPB,
      this.pATSPBKET,
      this.pATTO,
      this.pATTOKET,
      this.vENDORID,
      this.nAMAVENDOR,
      this.kDPENYERAHAN,
      this.kETPENYERAHAN,
      this.vOLSPB,
      this.tOLERANSI,
      this.vOLBAPB,
      this.sPBSTATUS,
      this.aPP1EMPID,
      this.aPP2EMPID,
      this.aPP1NAME,
      this.aPP2NAME,
      this.aPP1JBT,
      this.aPP2JBT,
      this.kDCURRENCY,
      this.tGLSURAT,
      this.tIPE,
      this.pENYERAHAN,
      this.pEMBICARAANTGL,
      this.aPP1,
      this.pPN,
      this.pPH,
      this.jADWALTTD,
      this.sTAMBIL,
      this.aPP1DATE,
      this.tGLAMBIL,
      this.tGLKIRIM,
      this.tGLDATANG,
      this.aPP2,
      this.aPP2DATE,
      this.cREATEDBY,
      this.cHK,
      this.cHKEMPID,
      this.cREATEDDATE,
      this.lASTUPDATEBY,
      this.cHKDATE,
      this.lASTUPDATEDATE,
      this.tGLRENCANADATANG,
      this.vALCURRENCY,
      this.sTATUSPERSENBAPB,
      this.sTATUSPERSENINV,
      this.sTATUSPERSENPAYMENT,
      this.tOTALHARGA,
      this.cURRCONVENTION,
      this.tOTALHARGARP,
      this.eMAILVENDOR,
      this.kETERANGAN,
      this.tEMPATTUJUAN,
      this.tGLTERIMA,
      this.tGLTERIMAAKH,
      this.sPEKTEKNIS,
      this.pEMBAYARANSCF,
      this.aPPVENDORNAMA,
      this.aPPVENDORJBT,
      this.eXPIRED,
      this.sTATUS,
      this.cLOSENOTES,
      this.jENISPEMBAYARAN,
      this.rEPEATORDER,
      this.vENDORIDANGKT,
      this.kETPEMBAYARAN,
      this.jENISLC,
      this.aLAMATPENGIRIMAN,
      this.aLAMATVENDOR,
      this.nOBAN,
      this.tGLBAN,
      this.rNUM});

  Spbmodel.fromJson(Map<String, dynamic> json) {
    nOSPB = json['NO_SPB'];
    nOSPPBJ = json['NO_SPPBJ'];
    tGLSPB = json['TGL_SPB'];
    pATSPB = json['PAT_SPB'];
    pATSPBKET = json['PAT_SPB_KET'];
    pATTO = json['PAT_TO'];
    pATTOKET = json['PAT_TO_KET'];
    vENDORID = json['VENDOR_ID'];
    nAMAVENDOR = json['NAMA_VENDOR'];
    kDPENYERAHAN = json['KD_PENYERAHAN'];
    kETPENYERAHAN = json['KET_PENYERAHAN'];
    vOLSPB = json['VOL_SPB'];
    tOLERANSI = json['TOLERANSI'];
    vOLBAPB = json['VOL_BAPB'];
    sPBSTATUS = json['SPB_STATUS'];
    aPP1EMPID = json['APP1_EMPID'];
    aPP2EMPID = json['APP2_EMPID'];
    aPP1NAME = json['APP1_NAME'];
    aPP2NAME = json['APP2_NAME'];
    aPP1JBT = json['APP1_JBT'];
    aPP2JBT = json['APP2_JBT'];
    kDCURRENCY = json['KD_CURRENCY'];
    tGLSURAT = json['TGL_SURAT'];
    tIPE = json['TIPE'];
    pENYERAHAN = json['PENYERAHAN'];
    pEMBICARAANTGL = json['PEMBICARAAN_TGL'];
    aPP1 = json['APP1'];
    pPN = json['PPN'];
    pPH = json['PPH'];
    jADWALTTD = json['JADWAL_TTD'];
    sTAMBIL = json['ST_AMBIL'];
    aPP1DATE = json['APP1_DATE'];
    tGLAMBIL = json['TGL_AMBIL'];
    tGLKIRIM = json['TGL_KIRIM'];
    tGLDATANG = json['TGL_DATANG'];
    aPP2 = json['APP2'];
    aPP2DATE = json['APP2_DATE'];
    cREATEDBY = json['CREATED_BY'];
    cHK = json['CHK'];
    cHKEMPID = json['CHK_EMPID'];
    cREATEDDATE = json['CREATED_DATE'];
    lASTUPDATEBY = json['LAST_UPDATE_BY'];
    cHKDATE = json['CHK_DATE'];
    lASTUPDATEDATE = json['LAST_UPDATE_DATE'];
    tGLRENCANADATANG = json['TGL_RENCANA_DATANG'];
    vALCURRENCY = json['VAL_CURRENCY'];
    sTATUSPERSENBAPB = json['STATUS_PERSEN_BAPB'];
    sTATUSPERSENINV = json['STATUS_PERSEN_INV'];
    sTATUSPERSENPAYMENT = json['STATUS_PERSEN_PAYMENT'];
    tOTALHARGA = json['TOTAL_HARGA'];
    cURRCONVENTION = json['CURR_CONVENTION'];
    tOTALHARGARP = json['TOTAL_HARGA_RP'];
    eMAILVENDOR = json['EMAIL_VENDOR'];
    kETERANGAN = json['KETERANGAN'];
    tEMPATTUJUAN = json['TEMPAT_TUJUAN'];
    tGLTERIMA = json['TGL_TERIMA'];
    tGLTERIMAAKH = json['TGL_TERIMA_AKH'];
    sPEKTEKNIS = json['SPEK_TEKNIS'];
    pEMBAYARANSCF = json['PEMBAYARAN_SCF'];
    aPPVENDORNAMA = json['APP_VENDOR_NAMA'];
    aPPVENDORJBT = json['APP_VENDOR_JBT'];
    eXPIRED = json['EXPIRED'];
    sTATUS = json['STATUS'];
    cLOSENOTES = json['CLOSE_NOTES'];
    jENISPEMBAYARAN = json['JENIS_PEMBAYARAN'];
    rEPEATORDER = json['REPEAT_ORDER'];
    vENDORIDANGKT = json['VENDOR_ID_ANGKT'];
    kETPEMBAYARAN = json['KET_PEMBAYARAN'];
    jENISLC = json['JENIS_LC'];
    aLAMATPENGIRIMAN = json['ALAMAT_PENGIRIMAN'];
    aLAMATVENDOR = json['ALAMAT_VENDOR'];
    nOBAN = json['NO_BAN'];
    tGLBAN = json['TGL_BAN'];
    rNUM = json['RNUM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NO_SPB'] = this.nOSPB;
    data['NO_SPPBJ'] = this.nOSPPBJ;
    data['TGL_SPB'] = this.tGLSPB;
    data['PAT_SPB'] = this.pATSPB;
    data['PAT_SPB_KET'] = this.pATSPBKET;
    data['PAT_TO'] = this.pATTO;
    data['PAT_TO_KET'] = this.pATTOKET;
    data['VENDOR_ID'] = this.vENDORID;
    data['NAMA_VENDOR'] = this.nAMAVENDOR;
    data['KD_PENYERAHAN'] = this.kDPENYERAHAN;
    data['KET_PENYERAHAN'] = this.kETPENYERAHAN;
    data['VOL_SPB'] = this.vOLSPB;
    data['TOLERANSI'] = this.tOLERANSI;
    data['VOL_BAPB'] = this.vOLBAPB;
    data['SPB_STATUS'] = this.sPBSTATUS;
    data['APP1_EMPID'] = this.aPP1EMPID;
    data['APP2_EMPID'] = this.aPP2EMPID;
    data['APP1_NAME'] = this.aPP1NAME;
    data['APP2_NAME'] = this.aPP2NAME;
    data['APP1_JBT'] = this.aPP1JBT;
    data['APP2_JBT'] = this.aPP2JBT;
    data['KD_CURRENCY'] = this.kDCURRENCY;
    data['TGL_SURAT'] = this.tGLSURAT;
    data['TIPE'] = this.tIPE;
    data['PENYERAHAN'] = this.pENYERAHAN;
    data['PEMBICARAAN_TGL'] = this.pEMBICARAANTGL;
    data['APP1'] = this.aPP1;
    data['PPN'] = this.pPN;
    data['PPH'] = this.pPH;
    data['JADWAL_TTD'] = this.jADWALTTD;
    data['ST_AMBIL'] = this.sTAMBIL;
    data['APP1_DATE'] = this.aPP1DATE;
    data['TGL_AMBIL'] = this.tGLAMBIL;
    data['TGL_KIRIM'] = this.tGLKIRIM;
    data['TGL_DATANG'] = this.tGLDATANG;
    data['APP2'] = this.aPP2;
    data['APP2_DATE'] = this.aPP2DATE;
    data['CREATED_BY'] = this.cREATEDBY;
    data['CHK'] = this.cHK;
    data['CHK_EMPID'] = this.cHKEMPID;
    data['CREATED_DATE'] = this.cREATEDDATE;
    data['LAST_UPDATE_BY'] = this.lASTUPDATEBY;
    data['CHK_DATE'] = this.cHKDATE;
    data['LAST_UPDATE_DATE'] = this.lASTUPDATEDATE;
    data['TGL_RENCANA_DATANG'] = this.tGLRENCANADATANG;
    data['VAL_CURRENCY'] = this.vALCURRENCY;
    data['STATUS_PERSEN_BAPB'] = this.sTATUSPERSENBAPB;
    data['STATUS_PERSEN_INV'] = this.sTATUSPERSENINV;
    data['STATUS_PERSEN_PAYMENT'] = this.sTATUSPERSENPAYMENT;
    data['TOTAL_HARGA'] = this.tOTALHARGA;
    data['CURR_CONVENTION'] = this.cURRCONVENTION;
    data['TOTAL_HARGA_RP'] = this.tOTALHARGARP;
    data['EMAIL_VENDOR'] = this.eMAILVENDOR;
    data['KETERANGAN'] = this.kETERANGAN;
    data['TEMPAT_TUJUAN'] = this.tEMPATTUJUAN;
    data['TGL_TERIMA'] = this.tGLTERIMA;
    data['TGL_TERIMA_AKH'] = this.tGLTERIMAAKH;
    data['SPEK_TEKNIS'] = this.sPEKTEKNIS;
    data['PEMBAYARAN_SCF'] = this.pEMBAYARANSCF;
    data['APP_VENDOR_NAMA'] = this.aPPVENDORNAMA;
    data['APP_VENDOR_JBT'] = this.aPPVENDORJBT;
    data['EXPIRED'] = this.eXPIRED;
    data['STATUS'] = this.sTATUS;
    data['CLOSE_NOTES'] = this.cLOSENOTES;
    data['JENIS_PEMBAYARAN'] = this.jENISPEMBAYARAN;
    data['REPEAT_ORDER'] = this.rEPEATORDER;
    data['VENDOR_ID_ANGKT'] = this.vENDORIDANGKT;
    data['KET_PEMBAYARAN'] = this.kETPEMBAYARAN;
    data['JENIS_LC'] = this.jENISLC;
    data['ALAMAT_PENGIRIMAN'] = this.aLAMATPENGIRIMAN;
    data['ALAMAT_VENDOR'] = this.aLAMATVENDOR;
    data['NO_BAN'] = this.nOBAN;
    data['TGL_BAN'] = this.tGLBAN;
    data['RNUM'] = this.rNUM;
    return data;
  }
}
