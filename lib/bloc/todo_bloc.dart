import 'package:bloc/bloc.dart';
import 'package:flutter_advanced_task7/models/todos.dart';
import 'package:flutter_advanced_task7/repository/todo_repository.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepo _todoRepo;

  TodoBloc(this._todoRepo) : super(TodoLoadingState()) {
    on<TodoEvent>((event, emit) {
      emit(TodoLoadingState());
      _todoRepo.getTodos().then((todos) {
        emit(TodoLoadedState(todos));
      }).catchError((error) {
        emit(TodoErrorState(error.toString()));
      });
    });
  }
}
