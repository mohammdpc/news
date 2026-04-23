import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/blocks/settings_block.dart';

import 'screens/Main Screen/main_screen.dart';

import 'theme.dart';

void main() {
  runApp(BlocProvider(create: (BuildContext context)=>SettingsBlock(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: context.watch<SettingsBlock>().state.theme?ThemeMode.dark:ThemeMode.light,
      home: MainScreen(),
    );
  }
}
