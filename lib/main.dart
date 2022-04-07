import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://pub.dev/packages/url_launcher';

var size = const SizedBox(height: 10);
void main() {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  // Created a text controller to retrieve the current values from a textfield
final myController = TextEditingController();

@override 
void dispose(){
  //this method cleans up the controller when the widget is removed fromt the widget tree
  myController.dispose();
  super.dispose();
}

void _printLatestValue(){
  // this method is called every time the text changes, it prints the current value of 
  // the text field.
  print('Second text field : ${myController.text}');
}

@override
void initState(){
  super.initState();

  //Start listeening to changes as sooon as 
  //the app starts and stop when it this stateless widget is disposed.
  myController.addListener(_printLatestValue);
}



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar:AppBar(
        title:const Text(
          "HomePage"),
      ),
    body:SafeArea(
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
               onChanged: (text) => print(text),
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
                 controller: myController,
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
       ElevatedButton(onPressed: _launchURL, child: 
       const Text('Sign up'),style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.pink),backgroundColor: MaterialStateProperty.all(Colors.amber))
       )],
              ),
            ),
        
          ),
        ),

        ]),
      
           )
           )
           );
      
  }
}

GlobalKey<FormState> formkey = GlobalKey<FormState>();


void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

