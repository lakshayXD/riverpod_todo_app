import 'package:flutter/material.dart';
import 'package:riverpod__demo/features/todo/model/todo.dart';

class TodoScreen extends StatelessWidget {

  static const id = 'TodoScreen';

  final Todo todo;
  const TodoScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(todo.title)),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Title', style: Theme.of(context).textTheme.bodyLarge,),
                  const WidgetSpan(child: const SizedBox(width: 5,)),
                  TextSpan(text: todo.title,),
                ]
              ),
            ),
            const SizedBox(height: 20,),
            Text('Description: ', style: Theme.of(context).textTheme.bodyLarge,),
            const SizedBox(height: 5,),
            Text(todo.description)
          ],
        ),
      ),
    );
  }
}
