import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:temp_mail/feature/auth/model/domain_model.dart';
import 'package:temp_mail/feature/auth/view_model/access_token_view_model.dart';
import 'package:http/http.dart' as http;
import '../../app_error.dart';

class DomainRepository {
  Future<Either<AppError, List<DomainModel>>> fetchDomain() async {
    var url = "https://api.mail.tm/domains";
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    print('dhur ${response.body}');

    try {
      if (response.statusCode == 200) {
        debugPrint("shakikan ${response.body}", wrapWidth: 1024);
        List<DomainModel> data = domainModelFromJson(response.body);
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
