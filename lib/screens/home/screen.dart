import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/providers/player_provider.dart';
import 'package:tictactoe/screens/game/screen.dart';
import 'package:tictactoe/screens/home/widgets/app_bar.dart';
import 'package:tictactoe/utils/get_it/locator.dart';
import 'package:tictactoe/utils/ui/size_config.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //initializing size config for the entire app
    SizeConfig().init(context);
    return Scaffold(
        appBar: HomeScreenAppBar(text: "Lets Play "),
        body: ChangeNotifierProvider(
            create: (context) => locator<PlayerProvider>(),
            child: const GameScreen()));
  }
}
