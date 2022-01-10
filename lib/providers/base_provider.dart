import 'package:flutter/material.dart';
import 'package:tictactoe/enums/provider_enums.dart';

/// Base Provider to handle the state for provider
class BaseProvider extends ChangeNotifier {
  ///Current state of provider
  ProviderState _state = ProviderState.idle;

  ///Error if any
  String? _error;
  String? get error => _error;
  bool get hasError => _error != null;

  ProviderState get state => _state;
  bool get isBusy => _state == ProviderState.busy;

  /// Updates the current state of the provider and notifies the listeners
  void setState(ProviderState providerState, {String? error}) {
    _state = providerState;
    _error = error;
    notifyListeners();
  }
}
