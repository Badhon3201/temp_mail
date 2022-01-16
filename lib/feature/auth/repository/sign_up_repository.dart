import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:temp_mail/feature/app_error.dart';

import 'package:http/http.dart' as http;
import 'package:temp_mail/feature/auth/model/sign_up_model.dart';

class SignUpRepository {
  static int? statusCode;

  Future<Either<AppError, SignUpModel>> fetchUserData(
      {String? username, String? password}) async {
    var url = "https://api.mail.tm/accounts";
    var body = {"address": "$username", "password": "$password"};
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        });

    if (response.statusCode == 200) {
      statusCode = response.statusCode;
      SignUpModel data = signUpModelFromJson(response.body);
      print("200${response.body}");
      return Right(data);
    } else {
      return const Left(AppError.serverError);
    }
  }
}
