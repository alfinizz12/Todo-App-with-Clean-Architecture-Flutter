class Todo {
  final int id;
  final String title;
  final String description;
  final bool isComplete;

  Todo({
    required this.id, 
    required this.title,
    required this.description,
    this.isComplete = false
  });
}