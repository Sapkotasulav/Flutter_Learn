import 'package:flutter/material.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ("Sulav sapkota"),
      color: Colors.blue[250],
      home: const FPage(),
    );
  }
}
class FPage extends StatelessWidget {
  const FPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Sir,"),
        backgroundColor: Colors.blue[200],
      ),
      body: Sarir(),
    );

  }
}
 class Sarir extends StatelessWidget {
    Sarir({super.key});
   final TextEditingController _textcntrl = TextEditingController();

    @override
   Widget build(BuildContext context) {
     return Column(
       children:[
         Padding(padding: const EdgeInsets.all(10),
         child: TextField(
         controller: _textcntrl,
         decoration:const InputDecoration (
             labelText: "Enter any command",
             focusColor: Colors.lightBlue,
              contentPadding: EdgeInsets.all(15),
              border: OutlineInputBorder()
         ),
       ) ,
         ),
         ElevatedButton(
           child: const Text("Execuite command."),
           onPressed: () {
             _savebtn(context); // Pass context to the function
           },
         )
       ],
     );
   }
 }

 void _savebtn(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context) {
    return AlertDialog(
        title: const Text("Command Execution"),
        content: const Text("I am on it sir."),
        actions: [
    TextButton(
    child: const Text("OK"),
   onPressed: () {
   Navigator.of(context).pop(); // Close the dialog
   },
   )
        ]
   );
      }
   );
}
