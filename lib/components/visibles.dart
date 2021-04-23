import 'package:control_unidades/components/camara.dart';
import 'package:flutter/material.dart';

class Visibles extends StatelessWidget {
  final bool isVisible;
  final String numero;
  final double x;
  final double y;
  final double altura;
  final double ancho;
  final double tamanio;
  final Color sColor;
  const Visibles({
    Key key,
    this.isVisible,
    this.numero,
    this.x,
    this.y,
    this.altura,
    this.ancho,
    this.tamanio,
    this.sColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Visibility(
          visible: isVisible,
          child: Container(
            alignment: Alignment(x, y),
            child: ClipOval(
              child: Material(
                color: sColor, // button color
                child: InkWell(
                  splashColor: Colors.redAccent, // inkwell color
                  child: SizedBox(
                    width: altura,
                    height: ancho,
                    child: Stack(children: <Widget>[
                      Text(
                        numero,
                        style:
                            TextStyle(fontSize: tamanio, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Camara(),
                    ]),
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
