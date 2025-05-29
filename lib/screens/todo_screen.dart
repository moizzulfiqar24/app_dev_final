import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/todo_bloc.dart';
import '../models/todo_model.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            return ListView(
              children: state.todos
                  .map(
                    (todo) => ListTile(
                      title: Text(todo.title),
                      subtitle: Text(todo.description),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              titleController.text = todo.title;
                              descController.text = todo.description;
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text('Edit Todo'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: titleController,
                                        decoration: const InputDecoration(
                                            labelText: 'Title'),
                                      ),
                                      TextField(
                                        controller: descController,
                                        decoration: const InputDecoration(
                                            labelText: 'Description'),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        context.read<TodoBloc>().add(
                                              UpdateTodo(
                                                Todo(
                                                  id: todo.id,
                                                  title: titleController.text,
                                                  description:
                                                      descController.text,
                                                ),
                                              ),
                                            );
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Update'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              context.read<TodoBloc>().add(DeleteTodo(todo.id));
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            );
          } else if (state is TodoError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          titleController.clear();
          descController.clear();
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Add Todo'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: descController,
                    decoration: const InputDecoration(labelText: 'Description'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.read<TodoBloc>().add(
                          AddTodo(
                            Todo(
                              id: '', // Will be generated by Firestore
                              title: titleController.text,
                              description: descController.text,
                            ),
                          ),
                        );
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
