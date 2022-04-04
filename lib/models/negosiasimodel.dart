class negosiasimodel {
  String kEBUTUHANID;
  String tRADERID;
  String nAMA;
  String kETERANGAN;
  String jNSPRODUK;
  String hPS;
  String jNSPENGADAAN;
  String jNSSIUP;
  String tHNANGGARAN;
  String tGLAWLPEMILIHAN;
  String tGLAHRPEMILIHAN;
  String tGLAWLPEKERJAAN;
  String tGLAHRPEKERJAAN;
  String sTATUS;
  String hPSTAMPIL;
  String gRUP;
  String kODE;
  String uRAIAN;
  String sINGKATAN;
  String pENAWARANID;
  String nOPENAWARAN;
  String pERIHAL;
  String lAMPIRAN;
  String tGLPENAWARAN;
  String nEGOSIASIID;
  String nONEGOSIASI;
  String tGLNEGOSIASI;
  String hASIL;
  String pERSETUJUANVENDOR;
  String pOSISI;
  String status;

  negosiasimodel(
      {this.kEBUTUHANID,
        this.tRADERID,
        this.nAMA,
        this.kETERANGAN,
        this.jNSPRODUK,
        this.hPS,
        this.jNSPENGADAAN,
        this.jNSSIUP,
        this.tHNANGGARAN,
        this.tGLAWLPEMILIHAN,
        this.tGLAHRPEMILIHAN,
        this.tGLAWLPEKERJAAN,
        this.tGLAHRPEKERJAAN,
        this.sTATUS,
        this.hPSTAMPIL,
        this.gRUP,
        this.kODE,
        this.uRAIAN,
        this.sINGKATAN,
        this.pENAWARANID,
        this.nOPENAWARAN,
        this.pERIHAL,
        this.lAMPIRAN,
        this.tGLPENAWARAN,
        this.nEGOSIASIID,
        this.nONEGOSIASI,
        this.tGLNEGOSIASI,
        this.hASIL,
        this.pERSETUJUANVENDOR,
        this.pOSISI,
        this.status});

  negosiasimodel.fromJson(Map<String, dynamic> json) {
    kEBUTUHANID = json['KEBUTUHAN_ID'];
    tRADERID = json['TRADER_ID'];
    nAMA = json['NAMA'];
    kETERANGAN = json['KETERANGAN'];
    jNSPRODUK = json['JNS_PRODUK'];
    hPS = json['HPS'];
    jNSPENGADAAN = json['JNS_PENGADAAN'];
    jNSSIUP = json['JNS_SIUP'];
    tHNANGGARAN = json['THN_ANGGARAN'];
    tGLAWLPEMILIHAN = json['TGL_AWL_PEMILIHAN'];
    tGLAHRPEMILIHAN = json['TGL_AHR_PEMILIHAN'];
    tGLAWLPEKERJAAN = json['TGL_AWL_PEKERJAAN'];
    tGLAHRPEKERJAAN = json['TGL_AHR_PEKERJAAN'];
    sTATUS = json['STATUS'];
    hPSTAMPIL = json['HPS_TAMPIL'];
    gRUP = json['GRUP'];
    kODE = json['KODE'];
    uRAIAN = json['URAIAN'];
    sINGKATAN = json['SINGKATAN'];
    pENAWARANID = json['PENAWARAN_ID'];
    nOPENAWARAN = json['NO_PENAWARAN'];
    pERIHAL = json['PERIHAL'];
    lAMPIRAN = json['LAMPIRAN'];
    tGLPENAWARAN = json['TGL_PENAWARAN'];
    nEGOSIASIID = json['NEGOSIASI_ID'];
    nONEGOSIASI = json['NO_NEGOSIASI'];
    tGLNEGOSIASI = json['TGL_NEGOSIASI'];
    hASIL = json['HASIL'];
    pERSETUJUANVENDOR = json['PERSETUJUAN_VENDOR'];
    pOSISI = json['POSISI'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['KEBUTUHAN_ID'] = this.kEBUTUHANID;
    data['TRADER_ID'] = this.tRADERID;
    data['NAMA'] = this.nAMA;
    data['KETERANGAN'] = this.kETERANGAN;
    data['JNS_PRODUK'] = this.jNSPRODUK;
    data['HPS'] = this.hPS;
    data['JNS_PENGADAAN'] = this.jNSPENGADAAN;
    data['JNS_SIUP'] = this.jNSSIUP;
    data['THN_ANGGARAN'] = this.tHNANGGARAN;
    data['TGL_AWL_PEMILIHAN'] = this.tGLAWLPEMILIHAN;
    data['TGL_AHR_PEMILIHAN'] = this.tGLAHRPEMILIHAN;
    data['TGL_AWL_PEKERJAAN'] = this.tGLAWLPEKERJAAN;
    data['TGL_AHR_PEKERJAAN'] = this.tGLAHRPEKERJAAN;
    data['STATUS'] = this.sTATUS;
    data['HPS_TAMPIL'] = this.hPSTAMPIL;
    data['GRUP'] = this.gRUP;
    data['KODE'] = this.kODE;
    data['URAIAN'] = this.uRAIAN;
    data['SINGKATAN'] = this.sINGKATAN;
    data['PENAWARAN_ID'] = this.pENAWARANID;
    data['NO_PENAWARAN'] = this.nOPENAWARAN;
    data['PERIHAL'] = this.pERIHAL;
    data['LAMPIRAN'] = this.lAMPIRAN;
    data['TGL_PENAWARAN'] = this.tGLPENAWARAN;
    data['NEGOSIASI_ID'] = this.nEGOSIASIID;
    data['NO_NEGOSIASI'] = this.nONEGOSIASI;
    data['TGL_NEGOSIASI'] = this.tGLNEGOSIASI;
    data['HASIL'] = this.hASIL;
    data['PERSETUJUAN_VENDOR'] = this.pERSETUJUANVENDOR;
    data['POSISI'] = this.pOSISI;
    data['status'] = this.status;
    return data;
  }
}
