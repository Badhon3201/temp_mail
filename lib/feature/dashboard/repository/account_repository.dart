import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:temp_mail/feature/auth/view_model/access_token_view_model.dart';
import 'package:temp_mail/feature/dashboard/model/account_model.dart';
import 'package:http/http.dart' as http;
import '../../app_error.dart';

class AccountRepository {
  Future<Either<AppError, Account>> fetchAccountDetails({String? id}) async {
    var url = "https://api.mail.tm/accounts/$id";
    print("id account $id");
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
        debugPrint("shakikanDetails ${response.body}", wrapWidth: 1024);
        Account data = accountFromJson(response.body);
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
}
