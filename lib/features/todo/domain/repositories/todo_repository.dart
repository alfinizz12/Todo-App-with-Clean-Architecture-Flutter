import 'package:clean_architecture_todo_app/features/todo/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> createTodo(Todo todo);
  Future<void> deleteTodo(int id);
  Future<void> updateTodo(Todo todo);
  Future<void> toggleTodo(int id);
}