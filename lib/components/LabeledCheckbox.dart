import 'package:flutter/material.dart';

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
              child: Visibility(
                visible: value,
                child: TextFormField(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
