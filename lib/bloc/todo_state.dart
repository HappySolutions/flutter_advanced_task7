part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

@immutable
sealed class TodoAddedState extends TodoState {}

final class TodosLoadingState extends TodoState {}

final class TodosLoadedState extends TodoState {
  final List<Todos> todos;
  TodosLoadedState(this.todos);
}

final class TodosErrorState extends TodoState {
  final String error;
  TodosErrorState(this.error);
}

// Adding Todo satats

final class TodoAddingState extends TodoAddedState {}

final class TodoAddingLoadingState extends TodoAddedState {}

final class TodoAddingSuccessfulyState extends TodoAddedState {}

final class TodoAddingErrorState extends TodoAddedState {
  final String error;
  TodoAddingErrorState(this.error);
}
