import 'package:flutter/material.dart';

var size = const SizedBox(height: 10);
class Todo extends StatelessWidget {
   Todo({ Key? key }) : super(key: key);

final  controller1 = TextEditingController();
final  controller2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: const [],
        title: const Text(' Add new To-Do-List')
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
    return  Column(
      children: [
        Row(
          children:  [
           const Pop(),
           size,
          ],
        ),
        Form(child:
         TextFormField(

         ))
      ],
    );
  }
}

class Pop extends StatelessWidget {
  const Pop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
  
        onPressed: () {
         Navigator.pushNamed(context, '/signup');
        },
        child: const Text("back"),
      
    );
  }
}