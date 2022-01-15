import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:temp_mail/feature/app_error.dart';
import 'package:temp_mail/feature/app_navigator.dart';
import 'package:temp_mail/feature/auth/view_model/access_token_view_model.dart';
import 'package:temp_mail/feature/dashboard/model/message_details_model.dart';
import 'package:temp_mail/feature/dashboard/model/message_model.dart';
import 'package:http/http.dart' as http;
import 'package:temp_mail/feature/dashboard/view_model/message_list_view_model.dart';

class MessageListRepositories {
  var res;
  Future<Either<AppError, List<MessageListModel>>> fetchMessages() async {
    var url = "https://api.mail.tm/messages";
    var token = await AccessTokenProvider().getToken();
    print("nnnnvvvvv${token}");
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': 'Bearer $token',
      },
    );
    // print('dhur ${response.body}');

    try {
      if (response.statusCode == 200) {
        debugPrint("shakikan ${response.body}", wrapWidth: 1024);
        List<MessageListModel> data = messageListModelFromJson(response.body);
        // var data2 = jsonDecode(response.body);
        // var data = MessageListModel.fromJson(data2[0]);

        // print("ddddddd${data[0]}");
        return Right(data);
      } else {
        print('else repository');
        return const Left(AppError.serverError);
      }
    } catch (e) {
      print("catch");
      return const Left(AppError.serverError);
    }
  }

  Future<Either<AppError, MessageDetailsModel>> fetchMessagesDetails(
      {String? id}) async {
    // BotToast.showLoading();
    var url = "https://api.mail.tm/messages/$id";
    var token = await AccessTokenProvider().getToken();
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': 'Bearer $token',
      },
    );
    // print('dhur ${response.body}');

    try {
      if (response.statusCode == 200) {
        // BotToast.closeAllLoading();
        debugPrint("shakikanDetails ${response.body}", wrapWidth: 1024);
        MessageDetailsModel data = messageDetailsModelFromJson(response.body);
        return Right(data);
      } else {
        // BotToast.closeAllLoading();
        print('else repository');
        return const Left(AppError.serverError);
      }
    } catch (e) {
      // BotToast.closeAllLoading();
      print("catch");
      return const Left(AppError.serverError);
    }
  }

  Future<http.Response> deleteMessages({String? id}) async {
    var token = await AccessTokenProvider().getToken();
    final http.Response response = await http.delete(
      Uri.parse('https://api.mail.tm/messages/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer $token'
      },
    );
    if (response.statusCode == 204) {}

    return response;
  }

  // Future<Either<AppError, bool>> deleteMessages({String? id}) async {
  //   var url = "https://api.mail.tm/messages/$id";
  //   print(url);
  //   var token = await AccessTokenProvider().getToken();
  //   var response = await http.delete(
  //     Uri.parse(url),
  //     headers: {
  //       'Content-type': 'application/json',
  //       'authorization': 'Bearer $token',
  //     },
  //   );
  //   // print('dhur ${response.body}');
  //
  //   return response;
  //   // try {
  //   //   if (response.statusCode == 200) {
  //   //     debugPrint("shakikanDetails ${response.body}", wrapWidth: 1024);
  //   //     MessageDetailsModel data = messageDetailsModelFromJson(response.body);
  //   //     return Right(data);
  //   //   } else {
  //   //     print('else repository');
  //   //     return const Left(AppError.serverError);
  //   //   }
  //   // } catch (e) {
  //   //   print("catch");
  //   //   return const Left(AppError.serverError);
  //   // }
  // }
}
