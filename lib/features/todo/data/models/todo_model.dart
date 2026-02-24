import 'package:clean_architecture_todo_app/features/todo/domain/entities/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends Todo {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @override
  @HiveField(3)
  final bool isComplete;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    this.isComplete = false,
  }) : super(
          id: id,
          title: title,
          description: description,
          isComplete: isComplete,
        );
}
