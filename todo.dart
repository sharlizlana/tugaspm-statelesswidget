class Todo {
  String title;
  String category;
  String time;
  bool isDone;

  Todo({
    required this.title,
    required this.category,
    required this.time,
    this.isDone = false,
  });
}
