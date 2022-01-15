import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

class SignUpModel {
  SignUpModel({
    this.context,
    this.id,
    this.type,
    this.signUpModelId,
    this.address,
    this.quota,
    this.used,
    this.isDisabled,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  String? context;
  String? id;
  String? type;
  String? signUpModelId;
  String? address;
  int? quota;
  int? used;
  bool? isDisabled;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        context: json["@context"] == null ? null : json["@context"]!,
        id: json["@id"] == null ? null : json["@id"]!,
        type: json["@type"] == null ? null : json["@type"]!,
        signUpModelId: json["id"] == null ? null : json["id"]!,
        address: json["address"] == null ? null : json["address"]!,
        quota: json["quota"] == null ? null : json["quota"]!,
        used: json["used"] == null ? null : json["used"]!,
        isDisabled: json["isDisabled"] == null ? null : json["isDisabled"]!,
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"]!,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]!),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]!),
      );
}
