// To parse this JSON data, do
//
//     final domainModel = domainModelFromJson(jsonString);

import 'dart:convert';

List<DomainModel> domainModelFromJson(String str) => List<DomainModel>.from(
    json.decode(str).map((x) => DomainModel.fromJson(x)));

class DomainModel {
  DomainModel({
    this.id,
    this.type,
    this.domainModelId,
    this.domain,
    this.isActive,
    this.isPrivate,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? type;
  String? domainModelId;
  String? domain;
  bool? isActive;
  bool? isPrivate;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory DomainModel.fromJson(Map<String, dynamic> json) => DomainModel(
        id: json["@id"] == null ? null : json["@id"]!,
        type: json["@type"] == null ? null : json["@type"]!,
        domainModelId: json["id"] == null ? null : json["id"]!,
        domain: json["domain"] == null ? null : json["domain"]!,
        isActive: json["isActive"] == null ? null : json["isActive"]!,
        isPrivate: json["isPrivate"] == null ? null : json["isPrivate"]!,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]!),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]!),
      );
}
