part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoLoadingState extends TodoState {}

final class TodoLoadedState extends TodoState {
  final List<Todos> todos;
  TodoLoadedState(this.todos);
}

final class TodoErrorState extends TodoState {
  final String error;
  TodoErrorState(this.error);
}

final class TodoAddedState extends TodoState {}
