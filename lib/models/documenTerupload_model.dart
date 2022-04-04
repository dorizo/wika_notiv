class DocumenTerupload_model {
  String dOKUMENTRADERID;
  String tRADERID;
  String tIPEDOKUMEN;
  String nAMAFILE;
  String uPLOADAT;
  String nOMOR;
  String tGLTERBIT;
  String tGLKADALUARSA;
  String jENISLAPKEU;
  String nAMA;
  String rEGIONAL;
  String aLAMAT;
  String tELEPON;
  String fAX;
  String eMAIL;
  String sTATUS;
  String tIPETRADER;
  String bADANUSAHA;
  String pIMPINANNAMA;
  String pIMPINANNPWP;
  String pIMPINANEMAIL;
  String pIMPINANPHONE;
  String pIMPINANJABATAN;
  String tIPEPRODUK;
  String vENDORID;
  String bOBOTPENILAIAN01;
  String pENILAIAN01;
  String bOBOTPENILAIAN02;
  String pENILAIAN02;
  String bOBOTPENILAIAN03;
  String pENILAIAN03;
  String bOBOTPENILAIAN04;
  String pENILAIAN04;
  String cATATANPENILAIAN;

  DocumenTerupload_model(
      {this.dOKUMENTRADERID,
      this.tRADERID,
      this.tIPEDOKUMEN,
      this.nAMAFILE,
      this.uPLOADAT,
      this.nOMOR,
      this.tGLTERBIT,
      this.tGLKADALUARSA,
      this.jENISLAPKEU,
      this.nAMA,
      this.rEGIONAL,
      this.aLAMAT,
      this.tELEPON,
      this.fAX,
      this.eMAIL,
      this.sTATUS,
      this.tIPETRADER,
      this.bADANUSAHA,
      this.pIMPINANNAMA,
      this.pIMPINANNPWP,
      this.pIMPINANEMAIL,
      this.pIMPINANPHONE,
      this.pIMPINANJABATAN,
      this.tIPEPRODUK,
      this.vENDORID,
      this.bOBOTPENILAIAN01,
      this.pENILAIAN01,
      this.bOBOTPENILAIAN02,
      this.pENILAIAN02,
      this.bOBOTPENILAIAN03,
      this.pENILAIAN03,
      this.bOBOTPENILAIAN04,
      this.pENILAIAN04,
      this.cATATANPENILAIAN});

  DocumenTerupload_model.fromJson(Map<String, dynamic> json) {
    dOKUMENTRADERID = json['DOKUMEN_TRADER_ID'];
    tRADERID = json['TRADER_ID'];
    tIPEDOKUMEN = json['TIPE_DOKUMEN'];
    nAMAFILE = json['NAMA_FILE'];
    uPLOADAT = json['UPLOAD_AT'];
    nOMOR = json['NOMOR'];
    tGLTERBIT = json['TGL_TERBIT'];
    tGLKADALUARSA = json['TGL_KADALUARSA'];
    jENISLAPKEU = json['JENIS_LAPKEU'];
    nAMA = json['NAMA'];
    rEGIONAL = json['REGIONAL'];
    aLAMAT = json['ALAMAT'];
    tELEPON = json['TELEPON'];
    fAX = json['FAX'];
    eMAIL = json['EMAIL'];
    sTATUS = json['STATUS'];
    tIPETRADER = json['TIPE_TRADER'];
    bADANUSAHA = json['BADAN_USAHA'];
    pIMPINANNAMA = json['PIMPINAN_NAMA'];
    pIMPINANNPWP = json['PIMPINAN_NPWP'];
    pIMPINANEMAIL = json['PIMPINAN_EMAIL'];
    pIMPINANPHONE = json['PIMPINAN_PHONE'];
    pIMPINANJABATAN = json['PIMPINAN_JABATAN'];
    tIPEPRODUK = json['TIPE_PRODUK'];
    vENDORID = json['VENDOR_ID'];
    bOBOTPENILAIAN01 = json['BOBOT_PENILAIAN_01'];
    pENILAIAN01 = json['PENILAIAN_01'];
    bOBOTPENILAIAN02 = json['BOBOT_PENILAIAN_02'];
    pENILAIAN02 = json['PENILAIAN_02'];
    bOBOTPENILAIAN03 = json['BOBOT_PENILAIAN_03'];
    pENILAIAN03 = json['PENILAIAN_03'];
    bOBOTPENILAIAN04 = json['BOBOT_PENILAIAN_04'];
    pENILAIAN04 = json['PENILAIAN_04'];
    cATATANPENILAIAN = json['CATATAN_PENILAIAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DOKUMEN_TRADER_ID'] = this.dOKUMENTRADERID;
    data['TRADER_ID'] = this.tRADERID;
    data['TIPE_DOKUMEN'] = this.tIPEDOKUMEN;
    data['NAMA_FILE'] = this.nAMAFILE;
    data['UPLOAD_AT'] = this.uPLOADAT;
    data['NOMOR'] = this.nOMOR;
    data['TGL_TERBIT'] = this.tGLTERBIT;
    data['TGL_KADALUARSA'] = this.tGLKADALUARSA;
    data['JENIS_LAPKEU'] = this.jENISLAPKEU;
    data['NAMA'] = this.nAMA;
    data['REGIONAL'] = this.rEGIONAL;
    data['ALAMAT'] = this.aLAMAT;
    data['TELEPON'] = this.tELEPON;
    data['FAX'] = this.fAX;
    data['EMAIL'] = this.eMAIL;
    data['STATUS'] = this.sTATUS;
    data['TIPE_TRADER'] = this.tIPETRADER;
    data['BADAN_USAHA'] = this.bADANUSAHA;
    data['PIMPINAN_NAMA'] = this.pIMPINANNAMA;
    data['PIMPINAN_NPWP'] = this.pIMPINANNPWP;
    data['PIMPINAN_EMAIL'] = this.pIMPINANEMAIL;
    data['PIMPINAN_PHONE'] = this.pIMPINANPHONE;
    data['PIMPINAN_JABATAN'] = this.pIMPINANJABATAN;
    data['TIPE_PRODUK'] = this.tIPEPRODUK;
    data['VENDOR_ID'] = this.vENDORID;
    data['BOBOT_PENILAIAN_01'] = this.bOBOTPENILAIAN01;
    data['PENILAIAN_01'] = this.pENILAIAN01;
    data['BOBOT_PENILAIAN_02'] = this.bOBOTPENILAIAN02;
    data['PENILAIAN_02'] = this.pENILAIAN02;
    data['BOBOT_PENILAIAN_03'] = this.bOBOTPENILAIAN03;
    data['PENILAIAN_03'] = this.pENILAIAN03;
    data['BOBOT_PENILAIAN_04'] = this.bOBOTPENILAIAN04;
    data['PENILAIAN_04'] = this.pENILAIAN04;
    data['CATATAN_PENILAIAN'] = this.cATATANPENILAIAN;
    return data;
  }
}
