import 'package:flutter/material.dart';
import 'package:tictactoe/enums/provider_enums.dart';

class BaseProvider extends ChangeNotifier {
  ProviderState _state = ProviderState.idle;

  String? _error;
  String? get error => _error;
  bool get hasError => _error != null;

  ProviderState get state => _state;
  bool get isBusy => _state == ProviderState.busy;

  void setState(ProviderState providerState, {String? error}) {
    _state = providerState;
    _error = error;
    notifyListeners();
  }
}