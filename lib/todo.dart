import 'package:flutter/material.dart';

var size = const SizedBox(height: 10);
class Todo extends StatelessWidget {
   Todo({ Key? key }) : super(key: key);

// final  controller1 = TextEditingController();
// final  controller2 = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
       
        title: const Text('To-Do-List'),
         actions:  [
           GestureDetector(
             onTap: (() { }),
             child: const Icon(Icons.add))
         ],
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

  final List<String> entries = <String>['yo','me','pull'];
final List<int> colorCodes = <int>[100,200,600];
bool _value = false;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
    Expanded(
   
      child: ListView.builder(
           padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder:(context, index) =>
           Container(
                   height: 50,
                   color: Colors.blue[colorCodes[index]],
                   child:  Row(
                     children: [
                     const MyStatefulWidget(),
                        Text(entries[index])
                     ],
                     
           ),
           )
    ),
    
      
    ),
    ElevatedButton(onPressed: (){
    setState(() {
      entries.add("new text");
    });
    }, child: const Icon(Icons.add))
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

class MyStatefulWidget extends StatefulWidget {
 const MyStatefulWidget({Key? key}) : super(key: key);

 @override
 State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
 bool isChecked = false; // This holds the state of the checkbox, we call setState and update this whenever a user taps the checkbox

 @override
 Widget build(BuildContext context) {
   return Checkbox(
     value: isChecked,
     onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
       setState(() {
         isChecked = value!;
       });
     },
   );
 }
}