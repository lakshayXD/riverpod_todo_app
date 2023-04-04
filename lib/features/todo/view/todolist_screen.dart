import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod__demo/features/todo/model/todo.dart';
import 'package:riverpod__demo/features/todo/provider/todo_notifier.dart';
import 'package:riverpod__demo/features/todo/view/todo_description.dart';
import 'package:riverpod__demo/features/todo/widget/todo_card.dart';

class TodoListScreen extends ConsumerWidget {
  static const id = 'TodoListScreen';

  TodoListScreen({Key? key}) : super(key: key);

  //stateprovider to keep track of all the selected Todos
  final selectedTodoProvider = StateProvider<List<int>>((ref) => <int>[]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the todolist changes
    List<Todo> todoList = ref.watch(todosProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ToDo List Screen'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, TodoDescription.id);
                },
                child: const Text('Add')),
            TextButton(
                onPressed: () {
                  List<int> selectedTodos =
                      ref.read(selectedTodoProvider.notifier).state;
                  ref.read(todosProvider.notifier).remove(selectedTodos);
                },
                child: const Text('Delete'))
          ],
        ),
        body: Container(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return TodoCard(
                    onPressed: () {
                      Navigator.pushNamed(context, TodoListScreen.id, arguments: {'todo': todoList[index]});
                    },
                    isChecked: false,
                    onChanged: (val) {
                      ref.read(selectedTodoProvider.notifier).update((state) {
                        state = [...state, todoList[index].id];
                        return state;
                      });
                    },
                    todoTitle: todoList[index].title);
              },
            )),
      ),
    );
  }
}
