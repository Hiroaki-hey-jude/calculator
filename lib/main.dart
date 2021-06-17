import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  buttonPressed(String buttonText){
    if(buttonText == "Clear"){
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    }else if(buttonText == '+' || buttonText == '-' || buttonText == 'X' || buttonText == '/'){
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    }else if(buttonText == '.'){
      if(_output.contains('.')){
        print('it already contains, I am sorry, am i correct?');
        return;
      }else{
        _output = _output + buttonText;
      }
    }else if(buttonText == '='){
      num2 = double.parse(output);

      if(operand == '+'){
        _output = (num1 + num2).toString();
      }
      if(operand == '-'){
        _output = (num1 - num2).toString();
      }
      if(operand == 'X'){
        _output = (num1 * num2).toString();
      }
      if(operand == '/'){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    }else{
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget materialButton(String buttonText){
    return Expanded(
        child: OutlineButton(
          padding: EdgeInsets.all(24.0),
          child: Text(buttonText,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          ),
          onPressed: () => {
            buttonPressed(buttonText),
          },
        ),
    );
  }

  String output = '0';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title: Text('calculator'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0
              ),
              child: Text(output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Expanded(
                child: Divider(),
            ),
            Row(
              children: [
                materialButton('7'),
                materialButton('8'),
                materialButton('9'),
                materialButton('/'),
              ],
            ),
            Row(
              children: [
                materialButton('4'),
                materialButton('5'),
                materialButton('6'),
                materialButton('X'),
              ],
            ),
            Row(
              children: [
                materialButton('1'),
                materialButton('2'),
                materialButton('3'),
                materialButton('-'),
              ],
            ),
            Row(
              children: [
                materialButton('.'),
                materialButton('0'),
                materialButton('00'),
                materialButton('+'),
              ],
            ),
            Row(
              children: [
                materialButton('Clear'),
                materialButton('='),
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }
}
