import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod__demo/features/todo/model/todo.dart';
import 'package:riverpod__demo/features/todo/provider/todo_notifier.dart';

//stateprovider for generating the id for every newTodo
final todoIdProvider = StateProvider<int>((ref) => 0);

//widget for making a newTodo
class TodoDescription extends ConsumerWidget {
  static const id = 'TodoDescription';

  TodoDescription({Key? key}) : super(key: key);

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Your Todo'),
            actions: [
              TextButton(
                  onPressed: () {
                    int id = ref
                        .read(todoIdProvider.notifier)
                        .update((state) => state + 1);
                    Todo todo = Todo(
                        id: id,
                        title: _titleController.text,
                        description: _descriptionController.text);
                    ref.read(todosProvider.notifier).add(todo);
                  },
                  child: const Text('Save')),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'ToDo',
                ),
                style: Theme.of(context).textTheme.bodyLarge,
                controller: _titleController,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'ToDo',
                  ),
                  controller: _descriptionController,
                  maxLength: 500,
                ),
              ),
            ],
          )),
    );
  }
}
