import 'package:get_it/get_it.dart';
import 'package:tictactoe/providers/player_provider.dart';
import 'package:tictactoe/services/game_history_service.dart';
import 'package:tictactoe/services/game_service.dart';
import 'package:tictactoe/services/navigation_service.dart';
import 'package:tictactoe/utils/storage/shared_preferences_manager.dart';

import '../mocks/game_history_service_mock.dart';
import '../mocks/shared_preferences_mocks.dart';

GetIt locator = GetIt.instance;

/// Setting up locator
void setupLocatorWithMockServices() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton<SharedPreferenceManager>(
      () => SharedPreferencesManagerMock());
  locator.registerLazySingleton(() => AiGameService());
  locator.registerLazySingleton<GameHistoryService>(
      () => GameHistoryServiceMock());
  locator.registerLazySingleton(() => PlayerProvider());
}
