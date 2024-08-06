part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class LoadTodosEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final Todos todo;
  AddTodoEvent(this.todo);
}
