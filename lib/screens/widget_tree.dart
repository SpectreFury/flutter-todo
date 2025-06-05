import 'package:flutter/material.dart';
import 'package:todo/data/notifiers.dart';
import 'package:todo/screens/help_screen.dart';
import 'package:todo/screens/todo_screen.dart';
import 'package:todo/widgets/navbar_widget.dart';

List<Widget> pages = [TodoScreen(), HelpScreen()];

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        leading: Icon(Icons.home),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      bottomNavigationBar: NavbarWidget(),
      floatingActionButton: ValueListenableBuilder(
        valueListenable: isDarkModeNotifier,
        builder: (context, isDark, child) => FloatingActionButton(
          onPressed: () {
            isDarkModeNotifier.value = !isDark;
          },
          child: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) =>
            pages.elementAt(selectedPage),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text('Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
