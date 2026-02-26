import 'package:clean_architecture_todo_app/features/todo/data/models/todo_model.dart';
import 'package:clean_architecture_todo_app/features/todo/presentation/bindings/todo_bindings.dart';
import 'package:clean_architecture_todo_app/features/todo/presentation/pages/add_todo_page.dart';
import 'package:clean_architecture_todo_app/features/todo/presentation/pages/todo_page.dart';
import 'package:clean_architecture_todo_app/features/todo/presentation/pages/update_todo_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/todos',
      getPages: [
        GetPage(
          name: '/todos', 
          page: () => TodoPage(),
          binding: TodoBindings()
        ),

        GetPage(
          name: '/add-todo', 
          page: () => AddTodoPage()
        ),

        GetPage(
          name: '/update-todo', 
          page: () => UpdateTodoPage()
        )
      ],
    );
  }
}
