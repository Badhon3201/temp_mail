import 'package:flutter/cupertino.dart';
import 'package:temp_mail/feature/auth/model/domain_model.dart';
import 'package:temp_mail/feature/auth/repository/domain_repository.dart';


import '../../app_error.dart';

class DomainViewModel extends ChangeNotifier {
  bool _isLoading = false;
  AppError? _appError;
  List<DomainModel>? _domainModel;

  Future getData() async {
    _isLoading = true;
    var res = await DomainRepository().fetchDomain();

    // notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isLoading = false;
      _domainModel = r;
      notifyListeners();
    });
  }

  List<DomainModel>? get domainModel => _domainModel;

}
