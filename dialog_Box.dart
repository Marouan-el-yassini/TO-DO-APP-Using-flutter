import 'package:flutter/material.dart';
import 'package:login_proj/myButton.dart';


class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key,required this.controller,required this.onCancel,required this.onSave});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[200],
      content: Container(
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Add a new task",
                hintStyle: TextStyle(
                  color: Colors.black87,
                ),
                fillColor: Colors.deepPurple[200],
                filled: true,


              ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Mybutton(text: "Save", onPressed: onSave),

                SizedBox(width: 6),

                Mybutton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),

      ),
    );
  }
}
