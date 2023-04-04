
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod__demo/features/todo/model/todo.dart';

//StateNotifier for handling the Todos functionalities
class TodosNotifier extends StateNotifier<List<Todo>>{
  TodosNotifier() : super([]);

  //method for adding Todos
  void add(Todo todo){
    state = [...state, todo];
  }

  //method for removing Todos
  void remove(List<int> todoIdList){
    state = [
      for(final todo in state)
        if(!todoIdList.contains(todo.id)) todo
    ];
  }
}

//provider that exposes the TodosNotifier for it to be used in UI
final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});