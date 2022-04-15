import 'package:flutter/material.dart';

class TodoActivity extends StatelessWidget {
    
 const TodoActivity({Key? key, required this.title, required this.what}) : super(key: key);
final String title;
final bool what;
  @override
  Widget build(BuildContext context) {
  TextEditingController controller = TextEditingController();

@override 
void dispose(){
  
  controller.dispose();
}
  return TextFormField(
    controller: TextEditingController(text: title) ,
     validator: ((value) => value == null || value.isEmpty ? 'Please enter some text' : null),
        textAlign: TextAlign.start,
                decoration:  InputDecoration(
                // labelText: "new todo",
                 enabled: what,
                 ),
                //  initialValue: title,
  );
  }





}