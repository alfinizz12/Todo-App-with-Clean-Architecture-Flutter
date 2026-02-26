import 'package:clean_architecture_todo_app/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_todo_app/features/todo/presentation/controllers/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateTodoPage extends GetView<TodoController> {
  UpdateTodoPage({super.key});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Todo todo = Get.arguments;
    _titleController.text = todo.title;
    _descriptionController.text = todo.description;

    return Scaffold(
      appBar: AppBar(title: Text("Update todo")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hint: Text("Todo title"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hint: Text("Todo description"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                ),
                onPressed: () {
                  controller.updateTodo(
                    Todo(
                      id: todo.id,
                      title: _titleController.text,
                      description: _descriptionController.text,
                    ),
                  );

                  Get.back();
                },
                child: Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
