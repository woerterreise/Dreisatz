import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dreisatz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'rule of proportion'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();
  TextEditingController controllerC = TextEditingController();
  TextEditingController controllerD = TextEditingController();
  double? ergebnis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(mainAxisSize: MainAxisSize.min, children: [
            TextWidget(controller: controllerA),
            TextWidget(controller: controllerB)
          ]),
          Row(mainAxisSize: MainAxisSize.min, children: [
            TextWidget(controller: controllerC),
            TextWidget(controller: controllerD)
          ]),
          Row(mainAxisSize: MainAxisSize.min, children: [
            TextButton(
              onPressed: (() {
                controllerA.clear();
                controllerB.clear();
                controllerC.clear();
                controllerD.clear();
                setState(() {
                  ergebnis = null;
                });
              }),
              child: const Text("clear"),
            ),
            TextButton(
              onPressed: (() {
                double? erg = getSolution(controllerA.text, controllerB.text,
                    controllerC.text, controllerD.text);
                setState(() {
                  ergebnis = erg;
                });
              }),
              child: const Text("calculate"),
            )
          ]),
          ergebnis == null
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                  child: Text(
                    ergebnis!.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 20),
                  ))
        ]),
      ),
    );
  }

  double? getSolution(String alpha, String beta, String gamma, String delta) {
    if (alpha.isEmpty &&
        beta.isNotEmpty &&
        gamma.isNotEmpty &&
        delta.isNotEmpty) {
      print("alpha");
      double b = double.parse(beta);
      double c = double.parse(gamma);
      double d = double.parse(delta);
      return (b / d * c);
    }
    if (beta.isEmpty &&
        alpha.isNotEmpty &&
        gamma.isNotEmpty &&
        delta.isNotEmpty) {
      print("beta");
      double a = double.parse(alpha);
      double c = double.parse(gamma);
      double d = double.parse(delta);
      return (a / c * d);
    }
    if (gamma.isEmpty &&
        alpha.isNotEmpty &&
        beta.isNotEmpty &&
        delta.isNotEmpty) {
      print("gamma");
      double a = double.parse(alpha);
      double b = double.parse(beta);
      double d = double.parse(delta);
      return (d / b * a);
    }
    if (delta.isEmpty &&
        alpha.isNotEmpty &&
        beta.isNotEmpty &&
        gamma.isNotEmpty) {
      print("delta");
      double a = double.parse(alpha);
      double b = double.parse(beta);
      double c = double.parse(gamma);
      return (c / a * b);
    } else {
      print("Error");
      return null;
    }
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
