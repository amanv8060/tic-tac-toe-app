import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/screens/help/screen.dart';
import 'package:tictactoe/screens/history/screen.dart';
import 'package:tictactoe/services/navigation_service.dart';
import 'package:tictactoe/utils/get_it/locator.dart';
import 'package:tictactoe/utils/theme/app_theme.dart';
import 'package:tictactoe/utils/theme/font_style.dart';

class HomeScreenAppBar extends AppBar {
  HomeScreenAppBar({required String text})
      : super(
            key: UniqueKey(),
            title: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(text,
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 100)),
              ],
              totalRepeatCount: 1,
            ),
            actions: [
              PopupMenuButton(
                icon: const Icon(Icons.more_horiz_outlined),
                color: AppTheme.primaryColor,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text(
                      "How to Play?",
                      style: CustomFontStyle.getTextStyle(),
                    ),
                    onTap: () => Future(
                      () => locator<NavigationService>()
                          .pushScreen(HelpScreen.routeName),
                    ),
                  ),
                  PopupMenuItem(
                      onTap: () => Future(
                            () => locator<NavigationService>()
                                .pushScreen(HistoryScreen.routeName),
                          ),
                      child: Text(
                        "View History",
                        style: CustomFontStyle.getTextStyle(),
                      ))
                ],
              )
            ]);
}
