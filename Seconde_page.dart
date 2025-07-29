import 'package:flutter/material.dart';
import 'package:login_proj/Login_page.dart';
import 'package:login_proj/dialog_Box.dart';
import 'package:login_proj/first_page.dart';
import 'package:login_proj/Todo_Tile.dart';
import 'package:login_proj/dialog_Box.dart';

class SecondePage extends StatefulWidget{
  const SecondePage({super.key});

  @override
  State<SecondePage> createState() => _SecondePageState();
}

class _SecondePageState extends State<SecondePage> {
  // This widget is the root of your application.
  final _controller=TextEditingController();


  List toDoList=[
    ["Read the Coran",false],
    ["Go to the Gym",false]
  ];

  void checkBox(bool? value, int index){
    setState(() {
      toDoList[index][1]=!toDoList[index][1];
    });
  }
  
  void SaveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask(){
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
            controller: _controller,
            onSave: SaveNewTask,
            onCancel: ()=>Navigator.of(context).pop(),
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          "TO DO",
          style: TextStyle(
            color: Colors.deepPurple[200],
            fontSize: 29,
          ),
        ),
        centerTitle: true,
        elevation: 30,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),


      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
          return TodoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChenged: (value) => checkBox(value, index),
          );
        }
      )
    );

  }
}