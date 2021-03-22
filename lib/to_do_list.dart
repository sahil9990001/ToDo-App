import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<String> _todoItems = [];

  void _addToDoItems(String text) {
    if (text.length > 0) {
      setState(() => _todoItems.add(text));
    }
  }

  void _removeListItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _alertRemoveItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are You Sure To Delete?'),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel')),
              FlatButton(
                child: Text('Confirm'),
                onPressed: () {
                  _removeListItem(index);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget _toDoList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index < _todoItems.length) {
          return _buildToDoList(_todoItems[index], index);
        }
      },
    );
  }

  Widget _buildToDoList(String value, int index) {
    int index1 = index + 1;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 4.0,
          child: ListTile(
            title: Text('$index1)  $value'),
            onTap: () => _alertRemoveItem(index),
            trailing: Icon(Icons.delete),
          )),
    );
  }

  void _pushToDoItems() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: Text('Add Your Wish Item')),
        body: Container(
          color: Colors.black26,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Card(
                  elevation: 4.0,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Your Text & Press Enter To Save....',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red, //this has no effect
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onSubmitted: (val) {
                      _addToDoItems(val);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          'ToDo List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      )),
      body: Container(
        child: _todoItems.length == 0
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' Your ToDo List is \n\t\t\t\t\t\t\t\t\tEmpty! ',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0),
                  ),
                ),
              )
            : _toDoList(),
        color: Colors.black26,
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text('Add Item'),
        onPressed: _pushToDoItems,
      ),
    );
  }
}
