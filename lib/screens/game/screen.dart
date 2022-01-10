import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/providers/game_provider.dart';
import 'package:tictactoe/screens/game/widgets/game_widget.dart';
import 'package:tictactoe/screens/game/widgets/reset_button.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameProvider _gameProvider = GameProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: _gameProvider,
        child: Column(
          children: const [Expanded(child: GameWidget()), ResetButton()],
        ));
  }
}
