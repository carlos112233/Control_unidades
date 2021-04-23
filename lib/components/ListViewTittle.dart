import 'package:flutter/material.dart';

class ListViewTittle extends StatelessWidget {
  final Text texto;
  final Text descripcion;
  final Icon icono;
  final Function press;
  const ListViewTittle({
    Key key,
    this.texto,
    this.descripcion,
    this.icono,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // Tiene muchas propiedades que nos ayudan a ordenar la información.
      // Titulo
      title: texto,
      // Subtitulo
      subtitle: descripcion,
      // Icono inicial del bloque
      leading: icono,
      // Funcion que se ejecuta al hacer click en él
      onTap: press,
    );
  }
}
