import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LabeledCheckbox.dart';

class LabeledCheckbox2 extends StatelessWidget {
  final String label;
  final EdgeInsets padding;
  final bool value;
  final bool active;
  final Function onChanged;
  final String descripcion;
  final String values;
  final double ancho;
  final TextEditingController controller;
  const LabeledCheckbox2({
    Key key,
    this.label,
    this.padding,
    this.value,
    this.onChanged,
    this.descripcion,
    this.values,
    this.active,
    this.ancho,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController();
    _controller.text = values;
    return InkWell(
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Container(
              child: Text(label),
            ),
            Container(
              width: ancho,
              child: TextFormField(
                enabled: active,
                controller: _controller,
                readOnly: false,
                decoration: InputDecoration(
                  hintText: label,
                  labelText: descripcion,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyStateful2Widget extends StatefulWidget {
  const MyStateful2Widget({key}) : super(key: key);

  @override
  _MyStateful2WidgetState createState() => _MyStateful2WidgetState();
}

class _MyStateful2WidgetState extends State<MyStateful2Widget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm:ss');
    String formatted = formatter.format(now); // <-- Desired date
    return Column(
      children: <Widget>[
        LabeledCheckbox(
          label: "Entrada:",
          descripcion: "Fecha",
          value: _isSelected,
          values: formatted,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .20,
          onChanged: (bool values) {
            _guardar(values, formatted);
            setState(() {
              this._isSelected = values;
            });
          },
        ),
        Text("\n"),
      ],
    );
  }

  void _guardar(bool values, String fecha) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('fecha', values);
    prefs.setString('Entrada', fecha);
  }
}
