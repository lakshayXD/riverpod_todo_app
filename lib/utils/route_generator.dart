import 'package:flutter/material.dart';
import 'package:riverpod__demo/features/todo/view/todo_description.dart';
import 'package:riverpod__demo/features/todo/view/todo_screen.dart';
import 'package:riverpod__demo/features/todo/view/todolist_screen.dart';

class RouteGenerator {
  static const initialRoute = TodoListScreen.id;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as dynamic;
    switch (settings.name) {
      case TodoListScreen.id:
        return _route(TodoListScreen());
      case TodoDescription.id:
        return _route(TodoDescription());
      case TodoScreen.id:
        return _route(TodoScreen(
          todo: args['todo'],
        ));
      default:
        return _errorRoute(settings.name);
    }
  }

  static MaterialPageRoute _route(Widget widget) => MaterialPageRoute(
        builder: (_) => widget,
      );

  static Route<dynamic> _errorRoute(String? name) {
    return _route(
      Scaffold(
        body: Center(
          child: Text('ROUTE\n\n$name\n\nNOT FOUND'),
        ),
      ),
    );
  }
}
