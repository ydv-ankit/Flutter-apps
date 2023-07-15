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
      debugShowCheckedModeBanner: false,
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
  late TextEditingController _tipPercent;

  num tip = 0.0;
  bool roundUp = false;

  void calculateTip() {
    setState(() {
      var calculatedTip =
          double.parse(_tipPercent.text) * double.parse(_billAmount.text) / 100;
      tip = roundUp ? calculatedTip.round() : calculatedTip;
    });
  }

  @override
  void initState() {
    super.initState();
    _billAmount = TextEditingController();
    _tipPercent = TextEditingController();
  }

  @override
  void dispose() {
    _billAmount.dispose();
    _tipPercent.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Tip Calculator"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 250,
              child: TextField(
                controller: _billAmount,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bill Amount',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 250,
              child: TextField(
                controller: _tipPercent,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tip Percent',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                onSubmitted: (value) => calculateTip(),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Round Up ?",
                  style: TextStyle(fontSize: 20),
                ),
                Switch(
                    value: roundUp,
                    onChanged: (bool value) {
                      setState(() {
                        roundUp = !roundUp;
                      });
                    }),
              ],
            ),
            const Spacer(),
            Text(
              "Bonus Tip : $tip",
              style: const TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}

class Spacer extends StatelessWidget {
  const Spacer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}
