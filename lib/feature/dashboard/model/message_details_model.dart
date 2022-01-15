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
        context: json["@context"] == null ? null : json["@context"]!,
        id: json["@id"] == null ? null : json["@id"]!,
        type: json["@type"] == null ? null : json["@type"]!,
        messageDetailsModelId: json["id"] == null ? null : json["id"]!,
        accountId: json["accountId"] == null ? null : json["accountId"]!,
        msgid: json["msgid"] == null ? null : json["msgid"]!,
        from: json["from"] == null ? null : From.fromJson(json["from"]!),
        to: json["to"] == null
            ? null
            : List<From>.from(json["to"]!.map((x) => From.fromJson(x))),
        cc: json["cc"] == null
            ? null
            : List<dynamic>.from(json["cc"]!.map((x) => x)),
        bcc: json["bcc"] == null
            ? null
            : List<dynamic>.from(json["bcc"]!.map((x) => x)),
        subject: json["subject"] == null ? null : json["subject"]!,
        seen: json["seen"] == null ? null : json["seen"]!,
        flagged: json["flagged"] == null ? null : json["flagged"]!,
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"]!,
        verifications: json["verifications"] == null
            ? null
            : List<dynamic>.from(json["verifications"]!.map((x) => x)),
        retention: json["retention"] == null ? null : json["retention"]!,
        retentionDate: json["retentionDate"] == null
            ? null
            : DateTime.parse(json["retentionDate"]!),
        text: json["text"] == null ? null : json["text"]!,
        html: json["html"] == null
            ? null
            : List<String>.from(json["html"]!.map((x) => x)),
        hasAttachments:
            json["hasAttachments"] == null ? null : json["hasAttachments"]!,
        attachments: json["attachments"] == null
            ? null
            : List<dynamic>.from(json["attachments"].map((x) => x)),
        size: json["size"] == null ? null : json["size"]!,
        downloadUrl: json["downloadUrl"] == null ? null : json["downloadUrl"]!,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]!),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]!),
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
        address: json["address"] == null ? null : json["address"]!,
        name: json["name"] == null ? null : json["name"]!,
      );

  Map<String, dynamic> toJson() => {
        "address": address == null ? null : address,
        "name": name == null ? null : name,
      };
}

// import 'dart:convert';
//
// MessageDetailsModel messageDetailsModelFromJson(String str) =>
//     MessageDetailsModel.fromJson(json.decode(str));
//
// class MessageDetailsModel {
//   MessageDetailsModel({
//     this.context,
//     this.id,
//     this.type,
//     this.messageDetailsModelId,
//     this.accountId,
//     this.msgid,
//     this.from,
//     this.to,
//     this.cc,
//     this.bcc,
//     this.subject,
//     this.seen,
//     this.flagged,
//     this.isDeleted,
//     this.verifications,
//     this.retention,
//     this.retentionDate,
//     this.text,
//     this.html,
//     this.hasAttachments,
//     this.attachments,
//     this.size,
//     this.downloadUrl,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   String? context;
//   String? id;
//   String? type;
//   String? messageDetailsModelId;
//   String? accountId;
//   String? msgid;
//   From? from;
//   List<From>? to;
//   List<dynamic>? cc;
//   List<dynamic>? bcc;
//   String? subject;
//   bool? seen;
//   bool? flagged;
//   bool? isDeleted;
//   List<dynamic>? verifications;
//   bool? retention;
//   DateTime? retentionDate;
//   String? text;
//   List<String>? html;
//   bool? hasAttachments;
//   List<dynamic>? attachments;
//   int? size;
//   String? downloadUrl;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   factory MessageDetailsModel.fromJson(Map<String, dynamic> json) =>
//       MessageDetailsModel(
//         context: json["@context"]!,
//         id: json["@id"]!,
//         type: json["@type"]!,
//         messageDetailsModelId: json["id"]!,
//         accountId: json["accountId"]!,
//         msgid: json["msgid"]!,
//         from: From.fromJson(json["from"]!),
//         to: List<From>.from(json["to"]!.map((x) => From.fromJson(x))),
//         cc: List<dynamic>.from(json["cc"]!.map((x) => x)),
//         bcc: List<dynamic>.from(json["bcc"]!.map((x) => x)),
//         subject: json["subject"]!,
//         seen: json["seen"]!,
//         flagged: json["flagged"]!,
//         isDeleted: json["isDeleted"]!,
//         verifications: List<dynamic>.from(json["verifications"]!.map((x) => x)),
//         retention: json["retention"]!,
//         retentionDate: DateTime.parse(json["retentionDate"]!),
//         text: json["text"]!,
//         html: List<String>.from(json["html"]!.map((x) => x)),
//         hasAttachments: json["hasAttachments"]!,
//         attachments: List<dynamic>.from(json["attachments"]!.map((x) => x)),
//         size: json["size"]!,
//         downloadUrl: json["downloadUrl"]!,
//         createdAt: DateTime.parse(json["createdAt"]!),
//         updatedAt: DateTime.parse(json["updatedAt"]!),
//       );
// }
//
// class From {
//   From({
//     this.address,
//     this.name,
//   });
//
//   String? address;
//   String? name;
//
//   factory From.fromJson(Map<String, dynamic> json) => From(
//         address: json["address"]!,
//         name: json["name"]!,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "address": address,
//         "name": name,
//       };
// }
