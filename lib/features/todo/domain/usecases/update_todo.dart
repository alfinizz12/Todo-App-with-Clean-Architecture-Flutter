import 'package:clean_architecture_todo_app/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_todo_app/features/todo/domain/repositories/todo_repository.dart';

class UpdateTodo {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  Future<void> call(Todo todo) async {
    return repository.updateTodo(todo);
  }
}