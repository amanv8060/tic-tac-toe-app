import 'package:flutter/material.dart';
import 'package:tictactoe/utils/ui/size_config.dart';

class Dummy extends StatelessWidget {
  final Widget widget;
  const Dummy({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return widget;
  }
}
