import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://pub.dev/packages/url_launcher';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.green,
      ),
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
       
            child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children:  [
             const Padding(padding: EdgeInsets.all(5.0)),
             const Text("Hello",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23.0)),
             const SizedBox(height: 5.0,),
             const Text("Please login to Your Account",style:TextStyle(color: Colors.grey)),
              const SizedBox(height: 10.0,),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 10.0,),
             TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter secure password',
                prefixIcon: Icon(Icons.password_sharp)
              ),
            ),
            const SizedBox(height: 10.0,),
         const ElevatedButton(onPressed: _launchURL, child: Text('Forget Password'))
           ],
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

