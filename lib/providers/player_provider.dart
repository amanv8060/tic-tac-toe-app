import 'package:tictactoe/enums/provider_enums.dart';
import 'package:tictactoe/providers/base_provider.dart';
import 'package:tictactoe/utils/get_it/locator.dart';
import 'package:tictactoe/utils/storage/shared_preference_keys.dart';
import 'package:tictactoe/utils/storage/shared_preferences_manager.dart';

class PlayerProvider extends BaseProvider {
  final SharedPreferenceManager _sharedPreferenceManager =
      locator<SharedPreferenceManager>();

  /// Stores if Human is playing as X
  bool isHumanX = false;

  PlayerProvider() {
    loadSymbol();
  }

  void loadSymbol() async {
    bool? val = await _sharedPreferenceManager
        .getBoolValueOrNull(SharedPreferenceKeys.playerSymbol);
    if (val == null) {
      //Setting default as X
      await _sharedPreferenceManager.setBoolValue(
          SharedPreferenceKeys.playerSymbol, true);
    }
    isHumanX = val ?? true;
    setState(ProviderState.idle);
  }

  /// Updates the player symbol
  void updateSymbol(bool val) async {
    setState(ProviderState.busy);
    isHumanX = val;
    await _sharedPreferenceManager.setBoolValue(
        SharedPreferenceKeys.playerSymbol, val);

    setState(ProviderState.idle);
  }
}
