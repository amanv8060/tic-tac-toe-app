import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/services/navigation_service.dart';
import 'package:tictactoe/utils/get_it/locator.dart';
import 'package:tictactoe/utils/navigation/routes.dart';
import 'package:tictactoe/utils/theme/app_theme.dart';

import 'dummy_container.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget, {List<Provider>? providers}) {
    return (providers == null)
        ? pumpWidget(
            MaterialApp(
              theme: AppTheme.globalTheme,
              onGenerateRoute: RouteGenerator.generateRoute,
              navigatorKey: locator<NavigationService>().navigatorKey,
              home: Dummy(widget: widget),
            ),
          )
        : pumpWidget(
            MultiProvider(
              providers: providers,
              child: MaterialApp(
                theme: AppTheme.globalTheme,
                onGenerateRoute: RouteGenerator.generateRoute,
                navigatorKey: locator<NavigationService>().navigatorKey,
                home: Dummy(widget: widget),
              ),
            ),
          );
  }
}




