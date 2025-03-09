import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Step> StepList() => [
        const Step(
            title: Text('Account'),
            content: Center(
              child: Text('Account'),
            )),
        const Step(
            title: Text('Address'),
            content: Center(
              child: Text('Address'),
            )),
        const Step(
            title: Text('Confirm'),
            content: Center(
              child: Text('Confirm'),
            )),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter steper form"),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: StepList(),
      ),
    );
  }
}
