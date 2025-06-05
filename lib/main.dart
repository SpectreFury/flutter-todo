import 'package:flutter/material.dart';
import 'package:todo/data/notifiers.dart';
import 'package:todo/screens/widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDark, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: isDark ? Brightness.dark : Brightness.light,
          ),
        ),
        home: const WidgetTree(),
      ),
    );
  }
}
