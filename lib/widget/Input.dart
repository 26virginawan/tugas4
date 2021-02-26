import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.inputUserController,
  }) : super(key: key);

  final TextEditingController inputUserController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputUserController,
      decoration: InputDecoration(hintText: 'Masukkan Suhu Dalam Celcius'),
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ),
    );
  }
}
