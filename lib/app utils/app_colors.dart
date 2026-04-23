import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/blocks/settings_block.dart';

class AppColors {
  //general
  static const Color secTextColor = Color(0xffA0A0A0);

//light
  static const Color lightMainText = Color(0xff1C1C1C);
  static const Color lightBackground = Color(0xffffffff);
  static const Color lightStroke = Color(0xff171717);
  static const Color red = Color(0xffFF3232);

//dark

  static const Color darkMainText = Color(0xffFFFFFF);
  static const Color darkBackground = Color(0xff171717);
  static const Color darkStroke = Color(0xffffffff);

  static Color mainText(BuildContext context)=>!context.watch<SettingsBlock>().state.theme?lightMainText:darkMainText;
  static Color mainTextReversed(BuildContext context)=>context.watch<SettingsBlock>().state.theme?lightMainText:darkMainText;
  static Color background(BuildContext context)=>!context.watch<SettingsBlock>().state.theme?lightBackground:darkBackground;
  static Color backgroundReversed(BuildContext context)=>context.watch<SettingsBlock>().state.theme?lightBackground:darkBackground;
  static Color stroke(BuildContext context)=>!context.watch<SettingsBlock>().state.theme?lightStroke:darkStroke;

}