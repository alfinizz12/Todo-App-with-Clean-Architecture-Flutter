import 'package:clean_architecture_todo_app/features/todo/domain/repositories/todo_repository.dart';

class ToggleComplete {
  final TodoRepository repository;

  ToggleComplete(this.repository);

  Future<void> call(int id) async {
    return repository.toggleTodo(id);
  }
}