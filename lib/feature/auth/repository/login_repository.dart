import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:temp_mail/feature/app_error.dart';
import 'package:temp_mail/feature/auth/model/auth_model.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future<Either<AppError, AuthModel>> fetchUserData(
      {String? username, String? password}) async {
    // BotToast.showLoading();
    var url = "https://api.mail.tm/token";
    var body = {"address": "$username", "password": "$password"};
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        });
    if (response.statusCode == 200) {
      AuthModel data = authModelFromJson(response.body);
      return Right(data);
    } else {
      return const Left(AppError.serverError);
    }
  }
}
