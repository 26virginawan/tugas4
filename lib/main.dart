import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  final inputController = TextEditingController();

  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      _kelvin = _inputUser + 273;
      _reamur = (4 / 5) * _inputUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            children: [
              TextFormField(
                controller: inputController,
                decoration:
                    InputDecoration(hintText: 'Masukkan Suhu Dalam Celcius'),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text('Suhu dalam Kelvin',
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          child: Text(
                            '$_kelvin',
                            style: TextStyle(fontSize: 30.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text('Suhu dalam Reamour',
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          child: Text(
                            '$_reamur',
                            style: TextStyle(fontSize: 30.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _inputUser = double.parse(inputController.text);
                    _kelvin = _inputUser + 273;
                    _reamur = (4 / 5) * _inputUser;
                  });
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Container(
                  height: 50,
                  width: 510,
                  alignment: Alignment.center,
                  child: Text("Konversi Suhu", style: TextStyle(fontSize: 17)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
