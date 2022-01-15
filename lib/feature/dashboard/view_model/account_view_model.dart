import 'package:flutter/cupertino.dart';
import 'package:temp_mail/feature/dashboard/model/account_model.dart';
import 'package:temp_mail/feature/dashboard/repository/account_repository.dart';

import '../../app_error.dart';

class AccountViewModel extends ChangeNotifier {
  bool _isLoading = false;
  AppError? _appError;

  Account? _account;
  Future getData({String? id}) async {
    _isLoading = true;
    var res = await AccountRepository().fetchAccountDetails(id: id);

    // notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isLoading = false;
      _account = r;
      notifyListeners();
    });
  }

  Account? get messageDetailsModel => _account;
}
