import 'package:flutter/cupertino.dart';
import 'package:temp_mail/feature/auth/repository/sign_up_repository.dart';

class SignUpViewModel with ChangeNotifier {
  String? _signIn;
  bool _isLoading = false;
  int? _statusCode;

  get errorTextEmail => null;
  Future<void> getSignUpData({String? username, String? password}) async {
    _isLoading = true;
    notifyListeners();
    var res = await SignUpRepository()
        .fetchUserData(username: username, password: password);
    res.fold((l) {
      _isLoading = false;
      print('signUpleft');
    }, (r) {
      print('signUpRight');
      _statusCode = 200;
      _isLoading = false;
    });
  }

  String? get signIn => _signIn;
  int? get statusCode => _statusCode;

  bool get isLoading => _isLoading;
}
