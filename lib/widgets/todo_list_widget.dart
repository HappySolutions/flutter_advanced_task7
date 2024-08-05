import 'package:flutter/material.dart';
import 'package:flutter_advanced_task7/bloc/todo_bloc.dart';
import 'package:flutter_advanced_task7/models/todos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoList extends StatefulWidget {
  final List<Todos> todos;
  const TodoList({super.key, required this.todos});
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: widget.todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                widget.todos[index].title ?? '',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(widget.todos[index].description ?? ''),
            );
          },
        );
      },
    );
  }
}
