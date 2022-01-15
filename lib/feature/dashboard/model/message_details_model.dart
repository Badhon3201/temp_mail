// To parse this JSON data, do
//
//     final messageDetailsModel = messageDetailsModelFromJson(jsonString);

import 'dart:convert';

MessageDetailsModel messageDetailsModelFromJson(String str) =>
    MessageDetailsModel.fromJson(json.decode(str));

class MessageDetailsModel {
  MessageDetailsModel({
    this.context,
    this.id,
    this.type,
    this.messageDetailsModelId,
    this.accountId,
    this.msgid,
    this.from,
    this.to,
    this.cc,
    this.bcc,
    this.subject,
    this.seen,
    this.flagged,
    this.isDeleted,
    this.verifications,
    this.retention,
    this.retentionDate,
    this.text,
    this.html,
    this.hasAttachments,
    this.attachments,
    this.size,
    this.downloadUrl,
    this.createdAt,
    this.updatedAt,
  });

  String? context;
  String? id;
  String? type;
  String? messageDetailsModelId;
  String? accountId;
  String? msgid;
  From? from;
  List<From>? to;
  List<dynamic>? cc;
  List<dynamic>? bcc;
  String? subject;
  bool? seen;
  bool? flagged;
  bool? isDeleted;
  List<dynamic>? verifications;
  bool? retention;
  DateTime? retentionDate;
  String? text;
  List<String>? html;
  bool? hasAttachments;
  List<dynamic>? attachments;
  int? size;
  String? downloadUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory MessageDetailsModel.fromJson(Map<String, dynamic> json) =>
      MessageDetailsModel(
        context: json["@context"]!,
        id: json["@id"]!,
        type: json["@type"]!,
        messageDetailsModelId: json["id"]!,
        accountId: json["accountId"]!,
        msgid: json["msgid"]!,
        from: From.fromJson(json["from"]!),
        to: List<From>.from(json["to"]!.map((x) => From.fromJson(x))),
        cc: List<dynamic>.from(json["cc"]!.map((x) => x)),
        bcc: List<dynamic>.from(json["bcc"]!.map((x) => x)),
        subject: json["subject"]!,
        seen: json["seen"]!,
        flagged: json["flagged"]!,
        isDeleted: json["isDeleted"]!,
        verifications: List<dynamic>.from(json["verifications"]!.map((x) => x)),
        retention: json["retention"]!,
        retentionDate: DateTime.parse(json["retentionDate"]!),
        text: json["text"]!,
        html: List<String>.from(json["html"]!.map((x) => x)),
        hasAttachments: json["hasAttachments"]!,
        attachments: List<dynamic>.from(json["attachments"]!.map((x) => x)),
        size: json["size"]!,
        downloadUrl: json["downloadUrl"]!,
        createdAt: DateTime.parse(json["createdAt"]!),
        updatedAt: DateTime.parse(json["updatedAt"]!),
      );
}

class From {
  From({
    this.address,
    this.name,
  });

  String? address;
  String? name;

  factory From.fromJson(Map<String, dynamic> json) => From(
        address: json["address"]!,
        name: json["name"]!,
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "name": name,
      };
}
