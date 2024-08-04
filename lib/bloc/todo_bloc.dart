import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_advanced_task7/models/todos.dart';
import 'package:flutter_advanced_task7/repository/todo_repository.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepo _todoRepo;

  TodoBloc(this._todoRepo) : super(TodoLoadingState()) {
    on<LoadTodosEvent>(loadTodos);
    on<AddTodosEvent>(addTodos);
  }

  FutureOr<void> loadTodos(
      LoadTodosEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoadingState());
    await _todoRepo.getTodos().then((todos) {
      emit(TodoLoadedState(todos));
    }).catchError((error) {
      emit(TodoErrorState(error.toString()));
    });
  }

  FutureOr<void> addTodos(AddTodosEvent event, Emitter<TodoState> emit) async {
    var todo = Todos.fromJson({
      "id": 6,
      "title": "Test todo",
      "description": "test todo description",
      "is_complete": false
    });
    TodoRepo.todosList.add(todo);
    var newList = TodoRepo.todosList;
    emit(TodoLoadedState(newList));
  }
}
