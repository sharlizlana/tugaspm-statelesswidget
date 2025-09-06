import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../models/todo.dart';

class TaskFormDialog extends StatefulWidget {
  const TaskFormDialog({super.key});

  @override
  State<TaskFormDialog> createState() => _TaskFormDialogState();
}

class _TaskFormDialogState extends State<TaskFormDialog> {
  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();
  final _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Create Task"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Title"),
          ),
          TextField(
            controller: _categoryController,
            decoration: const InputDecoration(labelText: "Category"),
          ),
          TextField(
            controller: _timeController,
            decoration: const InputDecoration(
                labelText: "Time (e.g., 10:30 AM)"),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: const Text("Add"),
          onPressed: () {
            if (_titleController.text.isNotEmpty &&
                _timeController.text.isNotEmpty) {
              final newTodo = Todo(
                title: _titleController.text,
                category: _categoryController.text,
                time: _timeController.text,
              );
              Provider.of<TodoProvider>(context, listen: false)
                  .addTodo(newTodo);
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}
