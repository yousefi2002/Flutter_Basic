import 'package:flutter/material.dart';

void main() => runApp( const Calculator());

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  num num1 = 0;
  num num2 = 0;
  String result = '?';

  void calculate (){
    setState(() {
      result = '${num1 + num2}';
    });
    FocusScope.of(context).requestFocus(FocusNode());
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Calculator Application",
            style: TextStyle(
              color: Colors.white,
            ),),
          backgroundColor: const Color(0xf5136bde),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                onChanged: (value){
                  setState(() {
                    num1 = double.tryParse(value) ?? 0;
                  });
                },
                keyboardType:  TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "First Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                onChanged: (value){
                  setState(() {
                    num2 = double.tryParse(value) ?? 0;
                  });
                },
                keyboardType:  TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Second Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: calculate,
              color: const Color(0xf5136bde),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ) ,
              child: const Text(
                "Calculate",
                style: TextStyle(
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Result = $result",
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
