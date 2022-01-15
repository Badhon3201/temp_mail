// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

class Account {
  Account({
    this.context,
    this.id,
    this.type,
    this.accountId,
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
  String? accountId;
  String? address;
  int? quota;
  int? used;
  bool? isDisabled;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        context: json["@context"] == null ? null : json["@context"]!,
        id: json["@id"] == null ? null : json["@id"]!,
        type: json["@type"] == null ? null : json["@type"]!,
        accountId: json["id"] == null ? null : json["id"]!,
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
