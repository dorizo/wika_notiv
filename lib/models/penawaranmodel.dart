class penawaranmodel {
  String pENAWARANID;
  String tRADERID;
  String kEBUTUHANID;
  String nOPENAWARAN;
  String pERIHAL;
  String kETERANGAN;
  String lAMPIRAN;
  String tGLPENAWARAN;

  penawaranmodel(
      {this.pENAWARANID,
        this.tRADERID,
        this.kEBUTUHANID,
        this.nOPENAWARAN,
        this.pERIHAL,
        this.kETERANGAN,
        this.lAMPIRAN,
        this.tGLPENAWARAN});

  penawaranmodel.fromJson(Map<String, dynamic> json) {
    pENAWARANID = json['PENAWARAN_ID'];
    tRADERID = json['TRADER_ID'];
    kEBUTUHANID = json['KEBUTUHAN_ID'];
    nOPENAWARAN = json['NO_PENAWARAN'];
    pERIHAL = json['PERIHAL'];
    kETERANGAN = json['KETERANGAN'];
    lAMPIRAN = json['LAMPIRAN'];
    tGLPENAWARAN = json['TGL_PENAWARAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PENAWARAN_ID'] = this.pENAWARANID;
    data['TRADER_ID'] = this.tRADERID;
    data['KEBUTUHAN_ID'] = this.kEBUTUHANID;
    data['NO_PENAWARAN'] = this.nOPENAWARAN;
    data['PERIHAL'] = this.pERIHAL;
    data['KETERANGAN'] = this.kETERANGAN;
    data['LAMPIRAN'] = this.lAMPIRAN;
    data['TGL_PENAWARAN'] = this.tGLPENAWARAN;
    return data;
  }
}
