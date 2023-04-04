import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod__demo/features/todo/model/todo.dart';
import 'package:riverpod__demo/features/todo/provider/todo_notifier.dart';
import 'package:riverpod__demo/features/todo/view/todo_description.dart';
import 'package:riverpod__demo/features/todo/view/todo_screen.dart';
import 'package:riverpod__demo/features/todo/widget/todo_card.dart';

//stateprovider to keep track of all the selected Todos
final selectedTodoProvider = StateProvider<List<int>>((ref) => <int>[]);

class TodoListScreen extends ConsumerStatefulWidget {
  static const id = 'TodoListScreen';

  const TodoListScreen({Key? key}) : super(key: key);

  @override
  TodoListScreenState createState() => TodoListScreenState();
}

class TodoListScreenState extends ConsumerState<TodoListScreen> {

  List<int> selectedIndexList = [];

  @override
  Widget build(BuildContext context) {
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

                  ref.read(selectedTodoProvider.notifier).update((state) => state = []);
                  setState(() {
                    selectedIndexList = [];
                  });
                },
                child: const Text('Delete'))
          ],
        ),
        body: (todoList.isEmpty) ? const Center(child: Text('No Item Found!'),) : Container(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return TodoCard(
                    onPressed: () {
                      Navigator.pushNamed(context, TodoScreen.id, arguments: {'todo': todoList[index]});
                    },
                    isChecked: selectedIndexList.contains(index),
                    onChanged: (val) {
                      if(val){
                            ref
                                .read(selectedTodoProvider.notifier)
                                .update((state) {
                              state = [...state, todoList[index].id];
                              return state;
                            });
                            setState(() {
                              selectedIndexList.add(index);
                            });
                          }
                      else{
                        ref.read(selectedTodoProvider.notifier).update((state){
                          state = [
                            for(final i in state)
                              if(i != todoList[index].id) i
                          ];
                          return state;
                        });
                        setState(() {
                          selectedIndexList.remove(index);
                        });
                      }
                        },
                    todoTitle: todoList[index].title);
              },
            )),
      ),
    );
  }
}
