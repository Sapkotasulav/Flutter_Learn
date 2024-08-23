import 'package:flutter/material.dart';

void main() => runApp(const landpage());

class landpage extends StatelessWidget {
  const landpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sulav',
      home: const page1(),
    );
  }
}

class page1 extends StatelessWidget {
  const page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DOTM Nepal."),
        ),
        body:new();
  }
}

class new extends StatefulWidget {
  const new({super.key});

  @override
  State<new> createState() => _newState();
}

class _newState extends State<new> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(

    );
  }
}
