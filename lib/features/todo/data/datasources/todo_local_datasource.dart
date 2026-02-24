import 'package:clean_architecture_todo_app/features/todo/data/models/todo_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoLocalDatasource {
  static const String boxName = 'todoBox';

  Future<Box<TodoModel>> _openBox() async {
    return await Hive.openBox<TodoModel>(boxName);
  }

  Future<List<TodoModel>> getTodos() async {
    final box = await _openBox();

    return box.values.toList();
  }

  Future<void> createTodo(TodoModel todo) async {
    final box = await _openBox();

    await box.put(todo.id, todo);
  }

  Future<void> deleteTodo(int id) async {
    final box = await _openBox();

    await box.delete(id);
  }

  Future<void> updateTodo(TodoModel todo) async {
    final box = await _openBox();

    await box.put(todo.id, todo);
  }

  Future<void> toggleTodo(int id) async {
    final box = await _openBox();
    final todo = box.get(id);
    

    if(todo != null){
      final updatedTodo = TodoModel(
        id: todo.id, 
        title: todo.title, 
        description: todo.description,
        isComplete: !(todo.isComplete)
      );

      await box.put(todo.id, updatedTodo);
    }
  }
}