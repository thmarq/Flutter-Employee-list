import 'package:flutter/material.dart';

class DBox extends StatefulWidget {
  @override
  _DBoxState createState() => _DBoxState();
}

class _DBoxState extends State<DBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(

        title: Text('Welcome'),  // To display the title it is optional
        content: Text('GeeksforGeeks'),   // Message which will be pop up on the screen
        // Action widget which will provide the user to acknowledge the choice
        actions: [
          FlatButton(           // FlatButton widget is used to make a text to work like a button
            textColor: Colors.black,
            onPressed: () {},        // function used to perform after pressing the button
            child: Text('CANCEL'),
          ),
          FlatButton(
            textColor: Colors.black,
            onPressed: () {},
            child: Text('ACCEPT'),
          ),
        ],

    );
  }
}
