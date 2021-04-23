import 'package:control_unidades/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChaged;
  final TextEditingController controllers;
  final TextInputType type;
  final bool enabled;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon,
    this.onChaged,
    this.controllers,
    this.type,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        enabled: enabled,
        controller: controllers,
        onChanged: onChaged,
        keyboardType: type,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
