import 'package:flutter/material.dart';
import 'package:flutter_advanced_task7/bloc/todo_bloc.dart';
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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is TodoLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is TodoLoadedState) {
              return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(
                          state.todos[index].title ?? '',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(state.todos[index].description ?? ''),
                      ));
            }
            if (state is TodoErrorState) {
              return Text('Message: ${state.error}');
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
