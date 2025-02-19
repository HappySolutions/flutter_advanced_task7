import 'package:flutter/material.dart';
import 'package:flutter_advanced_task7/bloc/todo_bloc.dart';
import 'package:flutter_advanced_task7/pages/add_todo/add_todo_page.dart';
import 'package:flutter_advanced_task7/widgets/todo_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<TodoBloc>().add(LoadTodosEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Todo List')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTodoPage()));
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: BlocBuilder<TodoBloc, TodoState>(
          buildWhen: (prev, curr) => curr is! TodoAddedState,
          builder: (context, state) {
            if (state is TodosLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is TodosLoadedState) {
              if (state.todos.isEmpty) {
                return const Center(
                  child: Text('No Data Availble'),
                );
              } else {
                return TodoList(todos: state.todos);
              }
            }
            if (state is TodosErrorState) {
              return Text('Message: ${state.error}');
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
