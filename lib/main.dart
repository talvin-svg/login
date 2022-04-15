import 'package:flutter/material.dart';
import 'package:login/todo.dart';
import 'package:url_launcher/url_launcher.dart';
const _url = 'https://pub.dev/packages/url_launcher';

var size = const SizedBox(height: 10);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/second' :  (context) =>   Todo(),
        '/signup' : (context) => const MyApp()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
   
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, }) : super(key: key);


  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

// key that track the state of the form
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
 

  // Created a text controller to retrieve the current values from a textfield
final myController1 = TextEditingController();
final myController2 = TextEditingController();

@override 
void dispose(){
  //this method cleans up the controller when the widget is removed fromt the widget tree
  myController1.dispose();
  myController2.dispose();
  super.dispose();
}
void _printLatestValue1(){
  // this method is called every time the text changes, it prints the current value of 
  // the text field.
  print('Second text field : ${myController1.text}');
}
void _printLatestValue2(){
  // this method is called every time the text changes, it prints the current value of 
  // the text field.
  print('Second text field : ${myController2.text}');
}

@override
void initState(){
  super.initState();

  // //Start listeening to changes as sooon as 
  // //the app starts and stops when it this stateless widget is disposed.
  // myController2.addListener(_printLatestValue2);
  // myController1.addListener(_printLatestValue1);
}


  

  @override
  Widget build(BuildContext context) {

   return Scaffold(
        backgroundColor: Colors.grey,
        appBar:AppBar(
        title:const Text(
          "HomePage"),
      ),
    body:SafeArea(
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            const SizedBox(height: 15.0,),
          Expanded(flex:1,
            child: Container(
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/logo.jpg"))),
            constraints: const BoxConstraints(maxHeight: 100.0,maxWidth: 50.0),
            ),
          ),
          Expanded(
            flex: 3,
            // ignore: avoid_unnecessary_containers
            child: Container(
              decoration: const BoxDecoration(color: Colors.white,borderRadius:BorderRadius.all(Radius.circular(10)) ),
              margin: const EdgeInsets.all(20.0),
              height: 180.0,
              width: 150.0,
         
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children:  [
                 const Padding(padding: EdgeInsets.all(5.0)),
                 const Text("Hello",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23.0,color: Colors.black)),
                const SizedBox(height: 5.0,),
                  const Text("Please login to Your Account",style:TextStyle(color: Colors.grey)),
                  const SizedBox(height: 10.0,),
                TextFormField(
               validator: ((value) => value == null || value.isEmpty ? 'Please enter some text' : null),
                controller: myController1,
                textAlign: TextAlign.start,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter your email',
               suffixIcon: Icon(Icons.email),
            
      ),
    ),
                const SizedBox(height: 10.0,),
                 TextFormField(
                   validator: ((value) => value == null || value.isEmpty ? 'Please enter some text' : null),
                   controller: myController2,
                   obscureText: true,
                   decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                    suffixIcon: Icon(Icons.password_sharp)
                  ),
                ),
                const SizedBox(height: 10.0,),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // textBaseline: TextBaseline.,
                children: [
                  size,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(onTap: _launchURL, child: const Text('Forget Password')),
                  ),
                ],
            ),
         ElevatedButton(onPressed: () {
           if(_formkey.currentState!.validate()){
             showDialog(context: context, builder: (buildContext){
               return AlertDialog(
                 title: const Text('alert'),
              // Retrieve the text that the user has entered by using the TextEditingController
              content: Text(" ${myController1.text} You're all set, press okay to proceed or cancel to exit " ),
              actions: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   ElevatedButton(
                     onPressed: (){
                       Navigator.pushNamed(context, '/second');
                     }, 
                     child: Row(
                      
                       children: const [
                         Icon(Icons.thumb_up),
                         Text("ok")
                       ],
                     ),
                   ),
                   ElevatedButton(
                 onPressed: (){
                   Navigator.pop(context);
                 }, 
                 child: Row(
                   
                   children: const [
                     Icon(Icons.thumb_up),
                     Text("cancel")
                   ],
                 ),
               ),
                 ],
                 
               ),
               
                
              ],
               );
             },);
           }
         },
          
          child: 
         const Text('Sign up'),
         style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.pink),
         backgroundColor: MaterialStateProperty.all(Colors.amber))
         )],
                ),
              ),
          
            ),
          ),
      
          ]),
      ),
      
           )
           );
  }
}


void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';