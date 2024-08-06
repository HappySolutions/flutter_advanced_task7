import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_advanced_task7/models/todos.dart';
import 'package:flutter_advanced_task7/repository/todo_repository.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepo _todoRepo;

  TodoBloc(this._todoRepo) : super(TodosLoadingState()) {
    on<LoadTodosEvent>(loadTodos);
    on<AddTodoEvent>(addTodos);
  }

  FutureOr<void> loadTodos(
      LoadTodosEvent event, Emitter<TodoState> emit) async {
    emit(TodosLoadingState());
    await _todoRepo.getTodos().then((todos) {
      emit(TodosLoadedState(todos));
    }).catchError((error) {
      emit(TodosErrorState(error.toString()));
    });
  }

  FutureOr<void> addTodos(AddTodoEvent event, Emitter<TodoState> emit) async {
    emit(TodoAddingLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    TodoRepo.todosList.add(event.todo);
    var newList = TodoRepo.todosList;

    emit(TodosLoadedState(newList));
    emit(TodoAddingSuccessfulyState());
  }
}
