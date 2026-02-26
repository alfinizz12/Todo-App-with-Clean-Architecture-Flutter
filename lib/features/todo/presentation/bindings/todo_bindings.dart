import 'package:clean_architecture_todo_app/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:clean_architecture_todo_app/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:clean_architecture_todo_app/features/todo/domain/repositories/todo_repository.dart';
import 'package:clean_architecture_todo_app/features/todo/domain/usecases/create_todo.dart';
import 'package:clean_architecture_todo_app/features/todo/domain/usecases/delete_todo.dart';
import 'package:clean_architecture_todo_app/features/todo/domain/usecases/get_todos.dart';
import 'package:clean_architecture_todo_app/features/todo/domain/usecases/toggle_complete.dart';
import 'package:clean_architecture_todo_app/features/todo/domain/usecases/update_todo.dart';
import 'package:clean_architecture_todo_app/features/todo/presentation/controllers/todo_controller.dart';
import 'package:get/get.dart';

class TodoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoLocalDatasource());

    Get.lazyPut<TodoRepository>(() => TodoRepositoryImpl(Get.find()));

    Get.lazyPut(() => CreateTodo(Get.find<TodoRepository>()));
    Get.lazyPut(() => DeleteTodo(Get.find<TodoRepository>()));
    Get.lazyPut(() => UpdateTodo(Get.find<TodoRepository>()));
    Get.lazyPut(() => GetTodos(Get.find<TodoRepository>()));
    Get.lazyPut(() => ToggleComplete(Get.find<TodoRepository>()));

    Get.lazyPut(
      () => TodoController(
        createTodoUsecase: Get.find<CreateTodo>(),
        deleteTodoUsecase: Get.find<DeleteTodo>(),
        getTodosUsecase: Get.find<GetTodos>(),
        updateTodoUsecase: Get.find<UpdateTodo>(),
        toggleCompleteUsecase: Get.find<ToggleComplete>()
      ),
    );
  }
}
