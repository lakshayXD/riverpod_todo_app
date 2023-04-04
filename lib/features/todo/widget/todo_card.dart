import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod__demo/features/todo/provider/todo_notifier.dart';

class TodoCard extends StatefulWidget {
  final String todoTitle;
  final VoidCallback onPressed;
  final bool isChecked;
  var onChanged;

  TodoCard(
      {Key? key, required this.onPressed, required this.isChecked, required this.onChanged, required this.todoTitle})
      : super(key: key);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white60, width: 0.7),
      ),
      child: Row(
        children: [
          Checkbox(value: widget.isChecked, onChanged: widget.onChanged, checkColor: Colors.white, activeColor: Colors.redAccent,),
          const SizedBox(width: 15,),
          GestureDetector(
            onTap: widget.onPressed,
            child: SizedBox(
              child: Text(
                widget.todoTitle,
                style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

