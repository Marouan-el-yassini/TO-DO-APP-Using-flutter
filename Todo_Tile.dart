import 'package:flutter/material.dart';
import 'package:login_proj/Login_page.dart';
import 'package:login_proj/first_page.dart';


class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChenged;

  TodoTile({super.key,required this.taskName,required this.taskCompleted,required this.onChenged});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Container(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChenged),
            Text(
              taskName,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                decoration: taskCompleted? TextDecoration.lineThrough : TextDecoration.none
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.deepPurple[200],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
