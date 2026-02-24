import 'package:clean_architecture_todo_app/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:clean_architecture_todo_app/features/todo/data/models/todo_model.dart';
import 'package:clean_architecture_todo_app/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_todo_app/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository{
  final TodoLocalDatasource localDatasource;

  TodoRepositoryImpl(this.localDatasource);

  @override
  Future<void> createTodo(Todo todo) async {
    final data = TodoModel(id: todo.id, title: todo.title, description: todo.description);
    await localDatasource.createTodo(data);
  }

  @override
  Future<void> deleteTodo(int id) async {
    await localDatasource.deleteTodo(id);
  }

  @override
  Future<List<Todo>> getTodos() async {
    return await localDatasource.getTodos();
  }

  @override
  Future<void> toggleTodo(int id) async {
    await localDatasource.toggleTodo(id);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final data = TodoModel(id: todo.id, title: todo.title, description: todo.description, isComplete: !(todo.isComplete));
    await localDatasource.updateTodo(data);
  }
}