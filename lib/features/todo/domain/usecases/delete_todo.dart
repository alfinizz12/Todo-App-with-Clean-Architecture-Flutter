import 'package:clean_architecture_todo_app/features/todo/domain/repositories/todo_repository.dart';

class DeleteTodo {
  final TodoRepository repository;

  DeleteTodo(this.repository);

  Future<void> call(int id) async {
    return repository.deleteTodo(id);
  }
}