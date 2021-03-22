import 'package:flutter/material.dart';
import '../to_do_list.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.teal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                    'https://media.istockphoto.com/vectors/clipboard-with-checklist-icon-checklist-complete-tasks-todo-list-vector-id1127173985?k=6&m=1127173985&s=612x612&w=0&h=ZOzj1lJiSak50tasqcBjp3RSdlGt39foWbFUXEoX3Go='),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Welcome To \n\t\t\tToDo App',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w300),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.forward),
                  hoverColor: Colors.blue,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ToDoList()));
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
