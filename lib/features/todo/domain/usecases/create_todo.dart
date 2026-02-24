import 'package:clean_architecture_todo_app/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_todo_app/features/todo/domain/repositories/todo_repository.dart';

class CreateTodo {
  final TodoRepository repository;

  CreateTodo(this.repository);

  Future<void> call(Todo todo) async {
    return repository.createTodo(todo);
  }
}