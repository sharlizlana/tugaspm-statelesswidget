import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';
import '../screens/task_detail.dart'; // ✅ pakai file baru

class TodoCard extends StatelessWidget {
  final int index;
  final Todo todo;

  const TodoCard({super.key, required this.index, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 249, 204, 221),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TaskDetail(todo: todo), // ✅ arahkan ke TaskDetail
            ),
          );
        },
        leading: Checkbox(
          value: todo.isDone,
          activeColor: const Color(0xFFFFC1CC),
          onChanged: (_) {
            Provider.of<TodoProvider>(context, listen: false)
                .toggleTodoStatus(index);
          },
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text("${todo.time} • ${todo.category}"),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: () {
            Provider.of<TodoProvider>(context, listen: false).deleteTodo(index);
          },
        ),
      ),
    );
  }
}
