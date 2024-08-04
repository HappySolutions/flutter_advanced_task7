part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class LoadTodosEvent extends TodoEvent {}
