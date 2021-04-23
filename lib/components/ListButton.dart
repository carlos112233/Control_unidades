import 'package:control_unidades/class/mensaje.dart';
import 'package:control_unidades/components/round_input_field.dart';
import 'package:control_unidades/components/rounded_button.dart';
import 'package:control_unidades/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import 'ListViewTittle.dart';

class ListButton extends StatelessWidget {
  final Icon icono;
  final Color color;
  final String id;
  final String productoClave;
  final String productoDescrip;
  final String unidadClave;
  final Function onpress;
  const ListButton({
    Key key,
    this.color = kPrimaryColor,
    this.icono,
    this.id,
    this.productoClave,
    this.productoDescrip,
    this.unidadClave,
    this.onpress,
  }) : super(key: key);

  // ignore: non_constant_identifier_names

  Future<void> registrar(
      String productoClave, String cantidadConteo, BuildContext context) async {
    var url =
        "http://supertrack-net.ddns.net:50371/impbarcodeapp/src/php/Apibarcode/insert_conteo.php";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String conteo = prefs.getString('conteo');
    String inventario = prefs.getString('inventario');
    String user = prefs.getString('user');
    final result = await http.post(url, body: {
      'producto_clave': productoClave,
      'num_conteo': conteo,
      'num_inv': inventario,
      'cantidad_conteo': cantidadConteo,
      'name_user': user
    });
    print(result.body);

    final mensaje = mensajeFromJson(result.body);

    if (mensaje.mesaje != 'Se registro correctamente') {
      prefs.setString('id', "");
      prefs.setString('productoClave', "");
      prefs.setString('productoDescrip', "");
      prefs.setString('unidadClave', "");
      return showDialog<void>(
        context: context,
        barrierDismissible:
            false, //this means the user must tap a button to exit the Alert Dialog
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('EL proceso fue:'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(mensaje.mesaje),
                ],
              ),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('ok'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                      (Route<dynamic> route) => false);
                },
              ),
            ],
          );
        },
      );
    } else if (mensaje.the0.conteo != null) {
      return showDialog<void>(
        context: context,
        barrierDismissible:
            false, //this means the user must tap a button to exit the Alert Dialog
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('EL proceso fue:'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(mensaje.mesaje),
                ],
              ),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('ok'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    } else if (mensaje.the0.conteo == null) {
      return showDialog<void>(
        context: context,
        barrierDismissible:
            false, //this means the user must tap a button to exit the Alert Dialog
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('EL proceso fue:'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(mensaje.mesaje),
                ],
              ),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('ok'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog<void>(
        context: context,
        barrierDismissible:
            false, //this means the user must tap a button to exit the Alert Dialog
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Hubo un error interno '),
                ],
              ),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController cantidad = TextEditingController();
    TextEditingController productos = TextEditingController();
    productos.text = productoClave;
    Size size = MediaQuery.of(context).size;
    Function onpresss = onpress;
    if (productoDescrip == null || productoDescrip == '') {
      onpresss = () {
        return showDialog<void>(
          context: context,
          barrierDismissible:
              false, //this means the user must tap a button to exit the Alert Dialog
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('No hay detalles del producto'),
                  ],
                ),
              ),
              actions: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                  child: Text('ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      };
    } else {
      onpresss = () {
        registrar(productoClave, cantidad.text, context);
      };
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      width: size.width * 0.8,
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                ListViewTittle(
                  descripcion: Text(
                      "Descripción del producto: \n$productoDescrip\n\nUnidad de medida:\n$unidadClave",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  icono: icono,
                ),
                RoundedInputField(
                  controllers: cantidad,
                  enabled: true,
                  hintText: "Cantidad",
                  icon: Icons.list,
                  type: TextInputType.number,
                ),
                SizedBox(
                  height: 2,
                ),
                RoundButton(
                  text: "Registrar",
                  press: onpresss,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
