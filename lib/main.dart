import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widget/Convert.dart';
import 'widget/Input.dart';
import 'widget/Result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;

  double _kelvin = 0;

  double _reamur = 0;

  TextEditingController inputUserController = TextEditingController();

  String _newValue = "Kelvin";

  double _result = 0;

  void _konversi() {
    setState(() {
      _inputUser = double.parse(inputUserController.text);
      if (_newValue == "Kelvin") {
        _result = _inputUser + 273;
        listViewItem.add("kelvin: " + '$_result');
      } else {
        _result = (4 / 5) * _inputUser;
        listViewItem.add("reamur: " + '$_result');
      }
    });
  }

  var listItem = ["Kelvin", "Reamur"];
  List<String> listViewItem = List<String>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(inputUserController: inputUserController),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: (String changeValue) {
                  setState(() {
                    _konversi();
                    _newValue = changeValue;
                  });
                },
              ),
              Result(result: _result),
              Convert(konvertHandler: _konversi),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: ListView(
                  children: listViewItem.map((String value) {
                    return Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 15),
                        ));
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
