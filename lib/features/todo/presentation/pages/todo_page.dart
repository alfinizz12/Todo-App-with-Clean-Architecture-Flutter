import 'package:clean_architecture_todo_app/features/todo/presentation/controllers/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoPage extends GetView<TodoController> {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),

      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Obx(() {
          if(controller.todos.isEmpty){
            return Center(
              child: Text("No todo yet!"),
            );
          }
        
          return ListView.separated(
            itemCount: controller.todos.length,
            separatorBuilder: (context, index) => SizedBox(height: 5,),
            itemBuilder: (_, index) {
              final todo = controller.todos[index];
              return Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.task),
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                  trailing: IconButton(
                    onPressed: () async {
                      await controller.deleteTodo(todo.id);
                    }, 
                    icon: Icon(Icons.delete)
                  ),
                  onTap: () {
                    Get.toNamed('/update-todo', arguments: todo);
                  },
                ),
              );
            },
          );
        }),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Get.toNamed('/add-todo'),
      ),
    );
  }
}
