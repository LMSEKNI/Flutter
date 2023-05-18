import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/db_model.dart';
import '../models/todo_model.dart';
import '../widgets/user_input.dart';
import '../widgets/todo_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  // create a database object to access to database functions
  var db = DatabaseConnect();

  // function to add todo
  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  // function to delete todo
  void deleteItem(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text('TODO APP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,

          ),),
          leading: Image.asset(
            'assets/images/tick.png',
          ),
          backgroundColor:Color.fromRGBO(210, 180, 140, 1.0),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed('loginScreen');
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 16.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpeg'),
              ),
            ),
          ],
        ),


      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          Todolist(insertFunction: addItem, deleteFunction: deleteItem),
          // we will add our widgets here.
          UserInput(insertFunction: addItem),
        ],
      ),
    );
  }
}
