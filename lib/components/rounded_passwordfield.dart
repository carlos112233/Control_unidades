import 'package:control_unidades/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyInput();
  }
}

class MyInput extends StatefulWidget {
  @override
  _MyInputState createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  final passwords = TextEditingController();

  bool hidden = true;
  @override
  Widget build(BuildContext context) {
    store.set("titleTextValue", titleTextValue);
    return TextFieldContainer(
      child: TextField(
        controller: passwords,
        obscureText: hidden,
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            hintText: "Contraseña",
            hintStyle: TextStyle(color: Colors.white),
            suffixIcon: InkWell(
              onTap: _toggleHidem,
              child: Icon(
                Icons.visibility,
                color: Colors.white,
              ),
            ),
            border: InputBorder.none),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  void _toggleHidem() {
    hidden = !hidden;

    setState(() {});
  }

  titleTextValue() {
    return passwords.text;
  }

  @override
  void initState() {
    super.initState();
    passwords.addListener(titleTextValue);
  }
}

class GlobalState {
  final Map<dynamic, dynamic> _data = <dynamic, dynamic>{};

  static GlobalState instance = GlobalState._();
  GlobalState._();

  set(dynamic key, dynamic value) => _data[key] = value;
  get(dynamic key) => _data[key];
}

final GlobalState store = GlobalState.instance;
