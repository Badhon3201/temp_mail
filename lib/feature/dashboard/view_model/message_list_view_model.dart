import 'package:flutter/cupertino.dart';
import 'package:temp_mail/feature/dashboard/model/message_details_model.dart';
import 'package:temp_mail/feature/dashboard/model/message_model.dart';
import 'package:temp_mail/feature/dashboard/repository/message_repository.dart';

import '../../app_error.dart';

class MessageListViewModel extends ChangeNotifier {
  bool _isLoading = false;
  AppError? _appError;
  List<MessageListModel>? _messageListModel;
  MessageDetailsModel? _messageDetailsModel;
  Future getMessageData() async {
    _isLoading = true;
    var res = await MessageListRepositories().fetchMessages();

    // notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isLoading = false;
      _messageListModel = r;
      notifyListeners();
    });
  }

  Future getMessageDetailsData({String? id}) async {
    _isLoading = true;
    var res = await MessageListRepositories().fetchMessagesDetails(id: id);

    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isLoading = false;
      _messageDetailsModel = r;
      notifyListeners();
    });
  }

  List<MessageListModel>? get messageListModel => _messageListModel;
  MessageDetailsModel? get messageDetailsModel => _messageDetailsModel;
}
