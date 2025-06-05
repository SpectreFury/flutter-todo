import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _taskInputController = TextEditingController();

  List<String> _todoList = [];

  void _addTodo() {
    if (_taskInputController.text.isNotEmpty) {
      setState(() {
        _todoList.add(_taskInputController.text);
      });
      _taskInputController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Add a new task',
                      hintText: 'Type here',
                      border: OutlineInputBorder(),
                    ),
                    controller: _taskInputController,
                  ),
                ),
                SizedBox(width: 8), // Add some spacing
                ElevatedButton(
                  onPressed: _addTodo,
                  child: const Text('Add Todo'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todoList[index]),
                  leading: Icon(Icons.check),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _todoList.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
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
