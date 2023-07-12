import 'enums.dart';

class BaseModelState<T> {
  ModelState _state = ModelState.initial;
  T? _data;
  String? _error;

  ModelState get state => _state;
  T? get data => _data;
  String? get getError => _error;

  void loading() {
    _state = ModelState.loading;
    _data = null;
    _error = null;
  }

  void success(T data) {
    _state = ModelState.success;
    this._data = data;
    _error = null;
  }

  void error(String? error) {
    _state = ModelState.error;
    _data = null;
    this._error = error;
  }

  void reset() {
    _state = ModelState.initial;
    _data = null;
    _error = null;
  }
}
