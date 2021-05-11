import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LabeledCheckbox extends StatelessWidget {
  final String label;
  final EdgeInsets padding;
  final bool value;
  final bool active;
  final Function onChanged;
  final Function onChanged2;
  final String descripcion;
  final String values;
  final double ancho;
  final TextEditingController controller;
  const LabeledCheckbox({
    Key key,
    this.label,
    this.padding,
    this.value,
    this.onChanged,
    this.descripcion,
    this.values,
    this.active,
    this.ancho,
    this.onChanged2,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> radio = [];
    String label1 = '';
    if (label.contains('LlantaT') ||
        label.contains('LlantaD') ||
        label.contains('LlantaR1') ||
        label.contains('LlantaR2')) {
      if (label.contains('LlantaR')) {
        label1 = label.substring(0, 11);
      } else {
        label1 = label.substring(0, 9);
      }

      print(label1);
      radio = [
        TextFormField(
          initialValue: values,
          enabled: active,
          controller: controller,
          readOnly: false,
          decoration: InputDecoration(
            hintText: label,
            labelText: descripcion,
          ),
          onChanged: onChanged2,
        ),
        RadioSelected(
          label: label1,
        ),
      ];
    } else {
      radio = [
        TextFormField(
          initialValue: values,
          enabled: active,
          controller: controller,
          readOnly: false,
          decoration: InputDecoration(
            hintText: label,
            labelText: descripcion,
          ),
          onChanged: onChanged2,
        ),
      ];
    }
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Container(
              child: Text(label),
            ),
            Checkbox(
              value: value,
              onChanged: (newValue) async {
                onChanged(newValue);
              },
            ),
            Container(
              width: ancho,
              child: Column(
                children: [
                  Visibility(
                    visible: value,
                    child: Column(children: radio),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioSelected extends StatefulWidget {
  final String label;

  const RadioSelected({
    Key key,
    this.label,
  }) : super(key: key);
  @override
  _RadioSelectedState createState() => _RadioSelectedState();
}

class _RadioSelectedState extends State<RadioSelected> {
  String _picked = "Daño";
  void _guardar(String selected, int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String result = prefs.getString(widget.label);
    print(result);
  }

  void _selected(String selected) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //print(widget.label);
    prefs.setString(widget.label, _picked);
    setState(() {
      _picked = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RadioButtonGroup(
        orientation: GroupedButtonsOrientation.HORIZONTAL,
        labels: <String>[
          "Daño",
          "Cambio",
        ],
        onChange: _guardar,
        onSelected: _selected,
        picked: _picked,
      ),
    );
  }
}
