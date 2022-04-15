
import 'activity.dart';
import 'package:flutter/material.dart';

var size = const SizedBox(height: 10);
class Todo extends StatelessWidget {
   Todo({ Key? key }) : super(key: key);


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


TextEditingController contollerInput = TextEditingController();

@override 
void dispose(){
  //this method cleans up the controller when the widget is removed fromt the widget tree
  contollerInput.dispose();
  super.dispose();
}

   List<String> entries = <String>['yo','me','pull'];
  // final List<TodoActivity> todooos = <TodoActivity>[];
final List<int> colorCodes = <int>[100,200,600];
  bool _isEnabled = true;
  bool _notEnabled = false;
void addItemToList(){
  setState(() {
    entries.insert(0, contollerInput.text);
    colorCodes.insert(0, 600);
  });
}
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
    Expanded(
     
      child: ListView.builder(
           padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder:(context, index) =>
          //  Container(
          //          height: 50,
          //          color: Colors.blue[colorCodes[index]],
          //          child:  Row(
                    
          //            children: [
          //            const MyStatefulWidget(),
          //               Text(entries[index]),
          //               const Spacer(),
          //              GestureDetector(
          //                child:
          //                 const Icon(
          //                   Icons.edit))
          //            ],
                     
          //  ),
          //  )
         Row(
           children: [
             const MyStatefulWidget(),
             Expanded(child: TodoActivity(title: entries[index], what: _notEnabled)),
             const SizedBox(width: 30,),
               GestureDetector(
                //  onTap: () {
                //    setState(() {
                //      what : _isEnabeld;
                //    });
                //  },
                         child:
                          const Icon(
                            Icons.edit))
           ],
         )
    ),
    
      
    ),
    ElevatedButton(
      onPressed: (){
     showDialog(context: context, builder: (buildContext){
      return AlertDialog(
        title: const Text("Create new TODO"),
        content: TextFormField(
          enabled: true,
          controller: contollerInput,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter todo',
           ),
        ),
       actions: [
          ElevatedButton(
            onPressed: (){
          addItemToList();
          Navigator.pop(context);
          contollerInput.clear();
       
            }, 
            child: const Text('OK'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)
            ),
            ),ElevatedButton(
            onPressed: (){
       Navigator.pop(context);
       contollerInput.clear();
    
            }, 
            child: const Text('Cancel'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)
            ),
            )
        ],
      );
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
        child: const Text("backk"),
      
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