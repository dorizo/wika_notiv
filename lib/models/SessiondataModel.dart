class SessiondataModel {
  bool status;
  String sessionid;
  String userId;
  String userName;
  String kdPat;
  String kdGas;
  String kdJbt;

  SessiondataModel(
      {this.status,
      this.sessionid,
      this.userId,
      this.userName,
      this.kdPat,
      this.kdGas,
      this.kdJbt});

  SessiondataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sessionid = json['sessionid'];
    userId = json['user_id'];
    userName = json['user_name'];
    kdPat = json['kd_pat'];
    kdGas = json['kd_gas'];
    kdJbt = json['kd_jbt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['sessionid'] = this.sessionid;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['kd_pat'] = this.kdPat;
    data['kd_gas'] = this.kdGas;
    data['kd_jbt'] = this.kdJbt;
    return data;
  }
}
