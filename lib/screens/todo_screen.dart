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
    return Column(
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
          child: ReorderableListView.builder(
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }
                final String item = _todoList.removeAt(oldIndex);
                _todoList.insert(newIndex, item);
              });
            },
            itemCount: _todoList.length,
            itemBuilder: (context, index) {
              return Container(
                key: Key('todo_${_todoList[index]}_$index'),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 8.0,
                ),
                child: ListTile(
                  title: Text(_todoList[index]),
                  leading: Icon(Icons.drag_handle),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _todoList.removeAt(index);
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
