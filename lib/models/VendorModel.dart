class VendorModel {
  String vENDORID;
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
  String cREATEDBY;
  String cREATEDDATE;
  String lASTUPDATEBY;
  String lASTUPDATEDATE;
  String vALID;
  String nPWP;
  String bERELASI;
  String sYNCEQC;

  VendorModel(
      {this.vENDORID,
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
      this.cREATEDBY,
      this.cREATEDDATE,
      this.lASTUPDATEBY,
      this.lASTUPDATEDATE,
      this.vALID,
      this.nPWP,
      this.bERELASI,
      this.sYNCEQC});

  VendorModel.fromJson(Map<String, dynamic> json) {
    vENDORID = json['VENDOR_ID'];
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
    cREATEDBY = json['CREATED_BY'];
    cREATEDDATE = json['CREATED_DATE'];
    lASTUPDATEBY = json['LAST_UPDATE_BY'];
    lASTUPDATEDATE = json['LAST_UPDATE_DATE'];
    vALID = json['VALID'];
    nPWP = json['NPWP'];
    bERELASI = json['BERELASI'];
    sYNCEQC = json['SYNC_EQC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VENDOR_ID'] = this.vENDORID;
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
    data['CREATED_BY'] = this.cREATEDBY;
    data['CREATED_DATE'] = this.cREATEDDATE;
    data['LAST_UPDATE_BY'] = this.lASTUPDATEBY;
    data['LAST_UPDATE_DATE'] = this.lASTUPDATEDATE;
    data['VALID'] = this.vALID;
    data['NPWP'] = this.nPWP;
    data['BERELASI'] = this.bERELASI;
    data['SYNC_EQC'] = this.sYNCEQC;
    return data;
  }
}
