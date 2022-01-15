import 'package:flutter/cupertino.dart';
import 'package:temp_mail/feature/auth/repository/sign_up_repository.dart';

class SignUpViewModel with ChangeNotifier {
  String? _signIn;
  bool _isLoading = false;

  get errorTextEmail => null;
  Future<void> getSignUpData({String? username, String? password}) async {
    _isLoading = true;
    notifyListeners();
    var res = await SignUpRepository()
        .fetchUserData(username: username, password: password);
    res.fold((l) {
      _isLoading = false;
    }, (r) {
      _isLoading = false;
      _signIn = r.id;
    });
  }

  String? get signIn => _signIn;

  bool get isLoading => _isLoading;
}
