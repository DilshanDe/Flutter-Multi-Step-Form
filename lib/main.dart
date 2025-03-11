import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentStep = 0;

  List<Step> stepList() => [
        Step(
          title: const Text('Account'),
          content: const Center(
            child: Text('Account Information'),
          ),
          isActive: _currentStep >= 0,
        ),
        Step(
          title: const Text('Address'),
          content: const Center(
            child: Text('Address Information'),
          ),
          isActive: _currentStep >= 1,
        ),
        Step(
          title: const Text('Confirm'),
          content: const Center(
            child: Text('Confirmation'),
          ),
          isActive: _currentStep >= 2,
        ),
      ];

  void _moveToNextStep() {
    if (_currentStep < stepList().length - 1) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _moveToPreviousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  void _onStepContinue() {
    if (_currentStep == stepList().length - 1) {
      // Perform form submission or final action
      print('Form Completed');
    } else {
      _moveToNextStep();
    }
  }

  void _onStepCancel() {
    _moveToPreviousStep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Stepper Form"),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: stepList(),
        currentStep: _currentStep,
        onStepContinue: _onStepContinue,
        onStepCancel: _onStepCancel,
      ),
    );
  }
}
