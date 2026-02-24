import 'package:clean_architecture_todo_app/features/todo/presentation/controllers/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTodoPage extends GetView<TodoController> {
  AddTodoPage({super.key});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add todo"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hint: Text("Todo title"),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hint: Text("Todo description"),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder()
                ),
                onPressed: () async {
                  await controller.createTodo(_titleController.text, _descriptionController.text);
                  Get.back();
                }, 
                child: Text("Add"),
              ),
            )
          ],
        ),
      ),
    );
  }
}