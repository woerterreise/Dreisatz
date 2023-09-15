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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dreisatz'),
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
  int? ergebnis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(children: [
            TextFormField(
              controller: controllerA,
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: controllerB,
              keyboardType: TextInputType.number,
            )
          ]),
          Row(children: [
            TextFormField(
              controller: controllerC,
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: controllerD,
              keyboardType: TextInputType.number,
            )
          ]),
          Row(children: [
            TextButton(
              onPressed: (() {
                controllerA.clear();
                controllerB.clear();
                controllerC.clear();
                controllerD.clear();
                setState(() {});
              }),
              child: const Text("löschen"),
            ),
            TextButton(
              onPressed: (() {
                print(controllerA.value);
                if (controllerA.value == null) {
                  getSolution(controllerC.value as int, controllerD.value as int, controllerB.value as int);
                }
                setState(() {});
              }),
              child: const Text("berechnen"),
            )
          ]),
          ergebnis == null ? const SizedBox.shrink() : Padding(padding: EdgeInsets.fromLTRB(20, 30, 20, 30), child: Text("$ergebnis"))
        ]),
      ),
    );
  }

  getSolution(int a, int b, int c) {
    ergebnis = (a / b * c) as int?;
  }
}
