import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/todo_model.dart';
import '../repositories/todo_repository.dart';

// States
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;
  TodoLoaded(this.todos);
}

class TodoError extends TodoState {
  final String message;
  TodoError(this.message);
}

// Events
abstract class TodoEvent {}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final Todo todo;
  AddTodo(this.todo);
}

class UpdateTodo extends TodoEvent {
  final Todo todo;
  UpdateTodo(this.todo);
}

class DeleteTodo extends TodoEvent {
  final String id;
  DeleteTodo(this.id);
}

// Bloc
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  TodoBloc(this.repository) : super(TodoInitial()) {
    on<LoadTodos>((event, emit) async {
      emit(TodoLoading());
      try {
        final todos = await repository.fetchTodos();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });

    on<AddTodo>((event, emit) async {
      if (state is TodoLoaded) {
        try {
          await repository.addTodo(event.todo);
          add(LoadTodos());
        } catch (e) {
          emit(TodoError(e.toString()));
        }
      }
    });

    on<UpdateTodo>((event, emit) async {
      if (state is TodoLoaded) {
        try {
          await repository.updateTodo(event.todo);
          add(LoadTodos());
        } catch (e) {
          emit(TodoError(e.toString()));
        }
      }
    });

    on<DeleteTodo>((event, emit) async {
      if (state is TodoLoaded) {
        try {
          await repository.deleteTodo(event.id);
          add(LoadTodos());
        } catch (e) {
          emit(TodoError(e.toString()));
        }
      }
    });
  }
}
