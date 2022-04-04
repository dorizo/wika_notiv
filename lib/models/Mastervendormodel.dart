import 'dart:convert';

import 'VendorModel.dart';

class Mastervendormodel {
  Mastervendormodel({
    this.validvendor,
    this.vendorModel,
  });

  int validvendor;
  List<VendorModel> vendorModel;

  factory Mastervendormodel.fromRawJson(String str) =>
      Mastervendormodel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mastervendormodel.fromJson(Map<String, dynamic> json) =>
      Mastervendormodel(
        validvendor: json["validvendor"],
        vendorModel: List<VendorModel>.from(
            json["VendorModel"].map((x) => VendorModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "validvendor": validvendor,
        "VendorModel": List<dynamic>.from(vendorModel.map((x) => x.toJson())),
      };
}
