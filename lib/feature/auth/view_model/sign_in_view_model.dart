import 'package:flutter/cupertino.dart';
import 'package:temp_mail/feature/auth/repository/login_repository.dart';

class SignInViewModel with ChangeNotifier {
  String? _accessToken;
  String? _groupName;
  String? _refreshToken;
  bool _isLoading = false;

  get errorTextEmail => null;
  Future<void> getSignInData({String? username, String? password}) async {
    print(username);
    _isLoading = true;
    notifyListeners();
    var res = await LoginRepository()
        .fetchUserData(username: username, password: password);
    res.fold((l) {
      _isLoading = false;
    }, (r) {
      _isLoading = false;
      _accessToken = r.token;
      _groupName = r.id;
    });
  }

  String? get accessToken => _accessToken;
  String? get groupName => _groupName;
  String? get refreshToken => _refreshToken;
  bool get isLoading => _isLoading;
}
