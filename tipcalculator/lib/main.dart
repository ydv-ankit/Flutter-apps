import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  late TextEditingController _billAmount;
  dynamic tip = 0.0;
  
  void calculateTip(bill, {tipPercent = 12}) {
    setState(() {
      tip =  tipPercent * double.parse(bill) / 100.0;
    });
  }

  @override
  void initState() {
    super.initState();
    _billAmount = TextEditingController();
  }

  @override
  void dispose() {
    _billAmount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 250,
              child: TextField(
                controller: _billAmount,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bill Amount',
                ),
                onSubmitted: (value) => calculateTip(value),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Tip : $tip")
          ],
        ),
      ),
    );
  }
}
