import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

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
        );
}
