import 'package:flutter/cupertino.dart';
import 'package:hubtel_coding_challenge_repo/utils/base.model.state.dart';
import 'package:injectable/injectable.dart';

///View model class for handling state management
@lazySingleton
class HistoryViewModel extends ChangeNotifier {
  BaseModelState getHistoryState = BaseModelState();

  Future<void> getHistory() async {
    getHistoryState.loading();

    Future.delayed(const Duration(milliseconds: 1500)).then((value) {
      getHistoryState.success(null);
      notifyListeners();
    });

    notifyListeners();
  }
}
