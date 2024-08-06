import 'package:flutter/material.dart';
import 'package:flutter_advanced_task7/bloc/todo_bloc.dart';
import 'package:flutter_advanced_task7/models/todos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController? titleController;
  TextEditingController? descreptionController;

  @override
  void initState() {
    titleController = TextEditingController();
    descreptionController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Todo')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey, //TODO Add validation
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Todo title'),
                    controller: titleController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Todo description'),
                    controller: descreptionController,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  var todo = Todos.fromJson({
                    "id": 6,
                    "title": titleController?.text,
                    "description": descreptionController?.text,
                    "is_complete": false
                  });
                  context.read<TodoBloc>().add(AddTodoEvent(todo));
                },
                child: BlocBuilder<TodoBloc, TodoState>(
                  buildWhen: (prev, curr) => curr is TodoAddedState,
                  builder: (context, state) {
                    if (state is TodoAddingLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    if (state is TodoAddingErrorState) {
                      return Text('Message: ${state.error}');
                    }
                    if (state is TodoAddingSuccessfulyState) {
                      Navigator.pop(context);
                      return const SizedBox.shrink();
                    }
                    return const Text('Add Todo');
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
