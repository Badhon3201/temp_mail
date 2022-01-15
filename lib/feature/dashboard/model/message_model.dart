import 'dart:convert';

List<MessageListModel> messageListModelFromJson(String str) =>
    List<MessageListModel>.from(
        json.decode(str).map((x) => MessageListModel.fromJson(x)));

class MessageListModel {
  MessageListModel({
    this.id,
    this.accountId,
    this.msgid,
    this.from,
    this.to,
    this.subject,
    this.seen,
    this.isDeleted,
    this.hasAttachments,
    this.size,
    this.downloadUrl,
    this.createdAt,
    this.updatedAt,
    this.intro,
  });

  String? id;
  String? accountId;
  String? msgid;
  From? from;
  List<From>? to;
  String? subject;
  bool? seen;
  bool? isDeleted;
  bool? hasAttachments;
  int? size;
  String? downloadUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? intro;

  factory MessageListModel.fromJson(Map<String, dynamic> json) =>
      MessageListModel(
        id: json["id"] == null ? null : json["id"]!,
        accountId: json["accountId"] == null ? null : json["accountId"]!,
        msgid: json["msgid"] == null ? null : json["msgid"]!,
        from: json["from"] == null ? null : From.fromJson(json["from"]!),
        to: json["to"] == null
            ? null
            : List<From>.from(json["to"]!.map((x) => From.fromJson(x))),
        subject: json["subject"] == null ? null : json["subject"]!,
        seen: json["seen"] == null ? null : json["seen"]!,
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"]!,
        hasAttachments:
            json["hasAttachments"] == null ? null : json["hasAttachments"]!,
        size: json["size"] == null ? null : json["size"]!,
        downloadUrl: json["downloadUrl"] == null ? null : json["downloadUrl"]!,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]!),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]!),
        intro: json["intro"] == null ? null : json["intro"]!,
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

// // To parse this JSON data, do
// //
// //     final messageListModel = messageListModelFromJson(jsonString);
//
// import 'dart:convert';
//
// List<MessageListModel> messageListModelFromJson(String str) =>
//     List<MessageListModel>.from(
//         json.decode(str).map((x) => MessageListModel.fromJson(x)));
//
// class MessageListModel {
//   MessageListModel({
//     this.id,
//     this.accountId,
//     this.msgid,
//     this.from,
//     this.to,
//     this.subject,
//     this.intro,
//     this.seen,
//     this.isDeleted,
//     this.hasAttachments,
//     this.size,
//     this.downloadUrl,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   String? id;
//   String? accountId;
//   String? msgid;
//   From? from;
//   List<From>? to;
//   String? subject;
//   String? intro;
//   bool? seen;
//   bool? isDeleted;
//   bool? hasAttachments;
//   int? size;
//   String? downloadUrl;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   factory MessageListModel.fromJson(Map<String, dynamic> json) =>
//       MessageListModel(
//         id: json["id"]!,
//         accountId: json["accountId"]!,
//         msgid: json["msgid"]!,
//         from: From.fromJson(json["from"]!),
//         to: List<From>.from(json["to"]!.map((x) => From.fromJson(x))),
//         subject: json["subject"]!,
//         intro: json["intro"]!,
//         seen: json["seen"]!,
//         isDeleted: json["isDeleted"]!,
//         hasAttachments: json["hasAttachments"]!,
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
// }
