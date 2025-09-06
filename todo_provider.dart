import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> _todos = [
    Todo(title: "Project retrospective", category: "Work", time: "4:50 PM"),
    Todo(title: "Evening team meeting", category: "Work", time: "4:50 PM"),
    Todo(title: "Create monthly deck", category: "Work", time: "4:50 PM"),
    Todo(title: "Shop for groceries", category: "Personal", time: "6:00 PM"),
    Todo(title: "Read book", category: "Personal", time: "10:30 PM"),
  ];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void toggleTodoStatus(int index) {
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }

  void deleteTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
