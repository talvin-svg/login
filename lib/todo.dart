import 'package:flutter/material.dart';


class Todo extends StatelessWidget {
  const Todo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' My Todo App')
      ),
      body:const Todoos() ,
    );
  }
}

class Todoos extends StatefulWidget {
  const Todoos({ Key? key }) : super(key: key);

  @override
  State<Todoos> createState() => _TodoosState();
}

class _TodoosState extends State<Todoos> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("back"),
      ),
    );
  }
}