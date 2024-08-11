import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(home: MyApp()),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Widget buildButton(Color color, String btnText, Color textColor) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {
          calculation(btnText);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: CircleBorder(),
          padding: EdgeInsets.all(20),
        ),
        child: Text(
          btnText,
          style: TextStyle(color: textColor, fontSize: 24   ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton(Colors.grey, 'c', Colors.black),
                buildButton(Colors.grey, '#', Colors.black),
                buildButton(Colors.grey, '%', Colors.black),
                buildButton(Colors.orange, '/', Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton(Colors.grey[850]!, '7', Colors.white),
                buildButton(Colors.grey[850]!, '8', Colors.white),
                buildButton(Colors.grey[850]!, '9', Colors.white),
                buildButton(Colors.orange, 'x', Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton(Colors.grey[850]!, '4', Colors.white),
                buildButton(Colors.grey[850]!, '5', Colors.white),
                buildButton(Colors.grey[850]!, '6', Colors.white),
                buildButton(Colors.orange, '-', Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton(Colors.grey[850]!, '1', Colors.white),
                buildButton(Colors.grey[850]!, '2', Colors.white),
                buildButton(Colors.grey[850]!, '3', Colors.white),
                buildButton(Colors.orange, '+', Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton(Colors.grey, '.', Colors.black),
                buildButton(Colors.grey, '0', Colors.black),
                buildButton(Colors.grey, '&', Colors.black),
                buildButton(Colors.orange, '=', Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation( btnText){
    if (btnText == 'c'){
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    }else if (opr == '=' && btnText == '='){

      if(preOpr == '+'){
        finalResult = add();
      }else if (preOpr == '*'){
        finalResult = mul();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    }else if (btnText == '+' || btnText == 'x'){
      if(numOne == 0){
        numOne = double.parse(result);
      }else{
        numTwo = double.parse(result);
      }
      if( opr == '+'){
        finalResult = add();
      }else if(opr == '*'){
        finalResult = mul();
      }
    }
    setState(() {
      text = finalResult;
    });
  }
  String add() {
    result = (numOne+numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne*numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal( dynamic result) {
    if(result.toString().contains('.')){
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1])>0)){
        return result = splitDecimal [0].toString();
      }
    }
    return result;
  }
}
