import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/todo_model.dart';

// Handles all Firebase interactions for Todos
class TodoRepository {
  final CollectionReference todoCollection =
      FirebaseFirestore.instance.collection('todos');

  Future<List<Todo>> fetchTodos() async {
    final snapshot = await todoCollection.get();
    return snapshot.docs
        .map((doc) => Todo.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  Future<void> addTodo(Todo todo) async {
    await todoCollection.add(todo.toMap());
  }

  Future<void> updateTodo(Todo todo) async {
    await todoCollection.doc(todo.id).update(todo.toMap());
  }

  Future<void> deleteTodo(String id) async {
    await todoCollection.doc(id).delete();
  }
}
