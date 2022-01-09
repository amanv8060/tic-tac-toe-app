import 'package:get_it/get_it.dart';
import 'package:tictactoe/services/navigation_service.dart';

GetIt locator = GetIt.instance;

/// Setting up locator
void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
