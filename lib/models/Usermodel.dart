class UserModel {
  String nIP;
  String fNAME;
  String lNAME;
  String fULLNAME;
  String jBT;
  String kDGAS;
  String kDJBT;
  String kDWIL;
  String kOTAPAT;
  String uSER;
  String uSRGROUP;
  String wBSESSID;
  String wIL;
  String wILAYAH;
  String rOLEID;
  String aPPLVL;

  UserModel(
      {this.nIP,
      this.fNAME,
      this.lNAME,
      this.fULLNAME,
      this.jBT,
      this.kDGAS,
      this.kDJBT,
      this.kDWIL,
      this.kOTAPAT,
      this.uSER,
      this.uSRGROUP,
      this.wBSESSID,
      this.wIL,
      this.wILAYAH,
      this.rOLEID,
      this.aPPLVL});

  UserModel.fromJson(Map<String, dynamic> json) {
    nIP = json['NIP'];
    fNAME = json['FNAME'];
    lNAME = json['LNAME'];
    fULLNAME = json['FULLNAME'];
    jBT = json['JBT'];
    kDGAS = json['KDGAS'];
    kDJBT = json['KDJBT'];
    kDWIL = json['KDWIL'];
    kOTAPAT = json['KOTAPAT'];
    uSER = json['USER'];
    uSRGROUP = json['USRGROUP'];
    wBSESSID = json['WBSESSID'];
    wIL = json['WIL'];
    wILAYAH = json['WILAYAH'];
    rOLEID = json['ROLE_ID'];
    aPPLVL = json['APP_LVL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NIP'] = this.nIP;
    data['FNAME'] = this.fNAME;
    data['LNAME'] = this.lNAME;
    data['FULLNAME'] = this.fULLNAME;
    data['JBT'] = this.jBT;
    data['KDGAS'] = this.kDGAS;
    data['KDJBT'] = this.kDJBT;
    data['KDWIL'] = this.kDWIL;
    data['KOTAPAT'] = this.kOTAPAT;
    data['USER'] = this.uSER;
    data['USRGROUP'] = this.uSRGROUP;
    data['WBSESSID'] = this.wBSESSID;
    data['WIL'] = this.wIL;
    data['WILAYAH'] = this.wILAYAH;
    data['ROLE_ID'] = this.rOLEID;
    data['APP_LVL'] = this.aPPLVL;
    return data;
  }
}
