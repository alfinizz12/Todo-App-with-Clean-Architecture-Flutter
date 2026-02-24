import 'package:clean_architecture_todo_app/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_todo_app/features/todo/domain/usecases/create_todo.dart';
import 'package:clean_architecture_todo_app/features/todo/domain/usecases/delete_todo.dart';
import 'package:clean_architecture_todo_app/features/todo/domain/usecases/get_todos.dart';
import 'package:clean_architecture_todo_app/features/todo/domain/usecases/toggle_complete.dart';
import 'package:get/get.dart';

class TodoController extends GetxController{
  final CreateTodo _createTodoUsecase;
  final DeleteTodo _deleteTodoUsecase;
  final GetTodos _getTodosUsecase;
  final ToggleComplete _toggleCompleteUsecase;

  TodoController(
    this._createTodoUsecase,
    this._getTodosUsecase,
    this._deleteTodoUsecase,
    this._toggleCompleteUsecase
  );

  @override
  void onInit() async {
    super.onInit();
    await _getAllTodos();
  }

  final RxList<Todo> _todos = <Todo>[].obs;
  final RxBool _isLoading = false.obs;

  List<Todo> get todos => _todos;
  bool get isLoading => _isLoading.value;

  Future<void> _getAllTodos() async {
    _isLoading.value = true;
    final todos = await _getTodosUsecase.call();
    _todos.assignAll(todos);
    _isLoading.value = false;
  }

  Future<void> createTodo(String title, String description) async {
    final todo = Todo(
      id: DateTime.now().millisecond, 
      title: title, 
      description: description
    );
    await _createTodoUsecase.call(todo);
    _getAllTodos();
  }

  Future<void> toggleComplete(int id) async {
    await _toggleCompleteUsecase.call(id);
  }

  Future<void> deleteTodo(int id) async {
    await _deleteTodoUsecase.call(id);
    await _getAllTodos();
  }

}