import 'package:control_unidades/class/mensajeregistrar.dart';
import 'package:control_unidades/components/LabeledCheckbox2.dart';
import 'package:control_unidades/homepage/consulta/consulta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class VistaPreliminar extends StatelessWidget {
  final bool visible;

  final String unidad;
  final String placaunida;
  final String motivoingreso;
  final String llanta2;
  final String llanta4;
  final String llanta6;
  final String llanta8;
  final String llanta10;
  final String defensadelantera;
  final String motor;
  final String pisodecabiba;
  final String tanquedeDiesel;
  final String cMTDer;
  final String capTanqueLTDer;
  final String trampaDer;
  final String aluminio;
  final String taponDieselDer;
  final String cabina;
  final String tanqueAire;
  final String ejeImpulsor;
  final String quintaRueda;
  final String escape;
  final String cMTIzq;
  final String capTanqueLTIzq;
  final String trampaIzq;
  final String fierro;
  final String tapondeDieselIzq;
  final String llanta1s;
  final String llanta3s;
  final String llanta5s;
  final String llanta7s;
  final String llanta9s;
  //dolly
  final String dolly;
  final String llanta1d;
  final String llanta2d;
  final String llanta3d;
  final String llanta4d;
  final String llanta5d;
  final String llanta6d;
  final String llanta7d;
  final String llanta8d;
  //rem
  final String unidadrem1;
  final String rem1placa;
  final String fmrem1;
  final String serem1;
  final String fdremrem1;
  final String partintderrem1;
  final String pisopartintrem1;
  final String llantarem1Eco0;
  final String llantarem1Eco2;
  final String llantarem1Eco4;
  final String llantarem1Eco6;
  final String pulizrem1;
  final String parinizqrem1;
  final String techointrem1;
  final String paredfrontalrem1;
  final String llantarem1Eco1;
  final String llantarem1Eco3;
  final String llantarem1Eco5;
  final String llantarem1Eco7;
  //rem2
  final String unidadrem2;
  final String rem2placa;
  final String fmrem2;
  final String serem2;
  final String fdremrem2;
  final String partintderrem2;
  final String pisopartintrem2;
  final String llantarem2Eco0;
  final String llantarem2Eco2;
  final String llantarem2Eco4;
  final String llantarem2Eco6;
  final String pulizrem2;
  final String parinizqrem2;
  final String techointrem2;
  final String paredfrontalrem2;
  final String llantarem2Eco1;
  final String llantarem2Eco3;
  final String llantarem2Eco5;
  final String llantarem2Eco7;

  const VistaPreliminar({
    Key key,
    this.visible,
    this.unidad,
    this.motivoingreso,
    this.llanta2,
    this.llanta4,
    this.llanta6,
    this.llanta8,
    this.llanta10,
    this.defensadelantera,
    this.motor,
    this.pisodecabiba,
    this.tanquedeDiesel,
    this.cMTDer,
    this.capTanqueLTDer,
    this.trampaDer,
    this.aluminio,
    this.taponDieselDer,
    this.cabina,
    this.tanqueAire,
    this.ejeImpulsor,
    this.quintaRueda,
    this.escape,
    this.cMTIzq,
    this.capTanqueLTIzq,
    this.trampaIzq,
    this.fierro,
    this.tapondeDieselIzq,
    this.llanta1s,
    this.llanta3s,
    this.llanta5s,
    this.llanta7s,
    this.llanta9s,
    this.llanta1d,
    this.llanta2d,
    this.llanta3d,
    this.llanta4d,
    this.llanta5d,
    this.llanta6d,
    this.llanta7d,
    this.llanta8d,
    this.dolly,
    this.fmrem1,
    this.serem1,
    this.fdremrem1,
    this.partintderrem1,
    this.pisopartintrem1,
    this.llantarem1Eco0,
    this.llantarem1Eco2,
    this.llantarem1Eco4,
    this.llantarem1Eco6,
    this.pulizrem1,
    this.parinizqrem1,
    this.techointrem1,
    this.paredfrontalrem1,
    this.llantarem1Eco1,
    this.llantarem1Eco3,
    this.llantarem1Eco5,
    this.llantarem1Eco7,
    this.fmrem2,
    this.serem2,
    this.fdremrem2,
    this.partintderrem2,
    this.pisopartintrem2,
    this.llantarem2Eco0,
    this.llantarem2Eco2,
    this.llantarem2Eco4,
    this.llantarem2Eco6,
    this.pulizrem2,
    this.parinizqrem2,
    this.techointrem2,
    this.paredfrontalrem2,
    this.llantarem2Eco1,
    this.llantarem2Eco3,
    this.llantarem2Eco5,
    this.llantarem2Eco7,
    this.unidadrem1,
    this.unidadrem2,
    this.placaunida,
    this.rem1placa,
    this.rem2placa,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    final Size size = MediaQuery.of(context).size;
    final List<Widget> colorCodes = <Widget>[
      Container(
        height: size.height * .45,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: size.width * .49,
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  Text(
                    "Tracto\n",
                    style: TextStyle(fontSize: 20),
                  ),
                  MyStatefulWidget(
                    unidad: unidad,
                    motivoingreso: motivoingreso,
                    llanta2: llanta2,
                    llanta4: llanta4,
                    llanta6: llanta6,
                    llanta8: llanta8,
                    llanta10: llanta10,
                    defensadelantera: defensadelantera,
                    motor: motor,
                    pisodecabiba: pisodecabiba,
                    tanquedeDiesel: tanquedeDiesel,
                    cMTDer: cMTDer,
                    capTanqueLTDer: capTanqueLTDer,
                    trampaDer: trampaDer,
                    aluminio: aluminio,
                    taponDieselDer: taponDieselDer,
                  ),
                  MyStateful2Widget(
                    cabina: cabina,
                    tanqueAire: tanqueAire,
                    ejeImpulsor: ejeImpulsor,
                    quintaRueda: quintaRueda,
                    escape: escape,
                    cMTIzq: cMTIzq,
                    capTanqueLTIzq: capTanqueLTIzq,
                    trampaIzq: trampaIzq,
                    fierro: fierro,
                    tapondeDieselIzq: tapondeDieselIzq,
                    llanta1s: llanta1s,
                    llanta3s: llanta3s,
                    llanta5s: llanta5s,
                    llanta7s: llanta7s,
                    llanta9s: llanta9s,
                  ),
                ],
              ),
            ),
            Container(
              width: size.width * .50,
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  Text(
                    "Remolque 1\n",
                    style: TextStyle(fontSize: 20),
                  ),
                  LabeledCheckbox2(
                    label: "Unidad: ",
                    values: unidadrem1,
                    active: false,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    ancho: size.height * .28,
                  ),
                  MyStateful5Widget(
                    fmrem1: fmrem1,
                    serem1: serem1,
                    fdremrem1: fdremrem1,
                    partintderrem1: partintderrem1,
                    pisopartintrem1: pisopartintrem1,
                    llantarem1Eco0: llantarem1Eco0,
                    llantarem1Eco2: llantarem1Eco2,
                    llantarem1Eco4: llantarem1Eco4,
                    llantarem1Eco6: llantarem1Eco6,
                  ),
                  MyStateful6Widget(
                    pulizrem1: pulizrem1,
                    parinizqrem1: parinizqrem1,
                    techointrem1: techointrem1,
                    paredfrontalrem1: paredfrontalrem1,
                    llantarem1Eco1: llantarem1Eco1,
                    llantarem1Eco3: llantarem1Eco3,
                    llantarem1Eco5: llantarem1Eco5,
                    llantarem1Eco7: llantarem1Eco7,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        height: size.height * .4,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Visibility(
              visible: visible,
              child: Container(
                width: size.width * .49,
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    Text(
                      "Dolly\n",
                      style: TextStyle(fontSize: 20),
                    ),
                    LabeledCheckbox2(
                      label: "Unidad: ",
                      values: dolly,
                      active: false,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      ancho: size.height * .28,
                    ),
                    MyStateful3Widget(
                      llanta1d: llanta1d,
                      llanta3d: llanta3d,
                      llanta5d: llanta5d,
                      llanta7d: llanta7d,
                    ),
                    MyStateful4Widget(
                      llanta2d: llanta2d,
                      llanta4d: llanta4d,
                      llanta6d: llanta6d,
                      llanta8d: llanta8d,
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: visible,
              child: Container(
                width: size.width * .50,
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    Text(
                      "Remolque 2\n",
                      style: TextStyle(fontSize: 20),
                    ),
                    LabeledCheckbox2(
                      label: "Unidad: ",
                      values: unidadrem2,
                      active: false,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      ancho: size.height * .28,
                    ),
                    MyStateful5Widget(
                      fmrem2: fmrem2,
                      serem2: serem2,
                      fdremrem2: fdremrem2,
                      partintderrem2: partintderrem2,
                      pisopartintrem2: pisopartintrem2,
                      llantarem2Eco0: llantarem2Eco0,
                      llantarem2Eco2: llantarem2Eco2,
                      llantarem2Eco4: llantarem2Eco4,
                      llantarem2Eco6: llantarem2Eco6,
                    ),
                    MyStateful6Widget(
                      pulizrem2: pulizrem2,
                      parinizqrem2: parinizqrem2,
                      techointrem2: techointrem2,
                      paredfrontalrem2: paredfrontalrem2,
                      llantarem2Eco1: llantarem2Eco1,
                      llantarem2Eco3: llantarem2Eco3,
                      llantarem2Eco5: llantarem2Eco5,
                      llantarem2Eco7: llantarem2Eco7,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ];
//
//
//
    bool n = true;
    return Scaffold(
      appBar: AppBar(
        title: Text("Vista preliminar de Observaciones o Daños"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 28.0),
            child: GestureDetector(
              onTap: () {
                if (n == true) {
                  n = false;
                  if (unidadrem2 == null) {
                    //unidad
                    _guardartrac([
                      unidad,
                      placaunida,
                      motivoingreso,
                      cabina,
                      defensadelantera,
                      tanqueAire,
                      motor,
                      ejeImpulsor,
                      pisodecabiba,
                      quintaRueda,
                      tanquedeDiesel,
                      escape,
                      cMTIzq,
                      cMTDer,
                      capTanqueLTDer,
                      capTanqueLTIzq,
                      trampaIzq,
                      trampaDer,
                      aluminio,
                      fierro,
                      taponDieselDer,
                      tapondeDieselIzq,
                    ]);
                    //rem
                    _guardarem([
                      unidadrem1,
                      rem1placa,
                      fmrem1,
                      serem1,
                      fdremrem1,
                      partintderrem1,
                      pisopartintrem1,
                      pulizrem1,
                      parinizqrem1,
                      techointrem1,
                      paredfrontalrem1,
                    ]);
                    _guardarllantas(
                      [
                        llanta1s,
                        llanta2,
                        llanta3s,
                        llanta4,
                        llanta5s,
                        llanta6,
                        llanta7s,
                        llanta8,
                        llanta9s,
                        llanta10
                      ],
                      "1",
                      unidad,
                    );
                    _guardarllantas(
                      [
                        llantarem1Eco0,
                        llantarem1Eco1,
                        llantarem1Eco2,
                        llantarem1Eco3,
                        llantarem1Eco4,
                        llantarem1Eco5,
                        llantarem1Eco6,
                        llantarem1Eco7,
                      ],
                      "2",
                      unidadrem1,
                    );
                    _limpiar(context);
                  } else {
                    // ---------------------------------------------------------
                    //unidad
                    _guardartrac([
                      unidad,
                      placaunida,
                      motivoingreso,
                      cabina,
                      defensadelantera,
                      tanqueAire,
                      motor,
                      ejeImpulsor,
                      pisodecabiba,
                      quintaRueda,
                      tanquedeDiesel,
                      escape,
                      cMTIzq,
                      cMTDer,
                      capTanqueLTDer,
                      capTanqueLTIzq,
                      trampaIzq,
                      trampaDer,
                      aluminio,
                      fierro,
                      taponDieselDer,
                      tapondeDieselIzq,
                    ]);
                    //remolque1
                    _guardarem([
                      unidadrem1,
                      rem1placa,
                      fmrem1,
                      serem1,
                      fdremrem1,
                      partintderrem1,
                      pisopartintrem1,
                      pulizrem1,
                      parinizqrem1,
                      techointrem1,
                      paredfrontalrem1,
                    ]);
                    // //remolque2
                    _guardarem([
                      unidadrem2,
                      rem2placa,
                      fmrem2,
                      serem2,
                      fdremrem2,
                      partintderrem2,
                      pisopartintrem2,
                      pulizrem2,
                      parinizqrem2,
                      techointrem2,
                      paredfrontalrem2,
                    ]);
                    //unidad llantas
                    _guardarllantas(
                      [
                        llanta1s,
                        llanta2,
                        llanta3s,
                        llanta4,
                        llanta5s,
                        llanta6,
                        llanta7s,
                        llanta8,
                        llanta9s,
                        llanta10
                      ],
                      "1",
                      unidad,
                    );
                    //remolque1 llantas
                    _guardarllantas(
                      [
                        unidadrem1,
                        llantarem1Eco0,
                        llantarem1Eco1,
                        llantarem1Eco2,
                        llantarem1Eco3,
                        llantarem1Eco5,
                        llantarem1Eco4,
                        llantarem1Eco6,
                        llantarem1Eco7,
                      ],
                      "2",
                      unidadrem1,
                    );
                    //Dolly
                    _guardarllantas(
                      [
                        llanta1d,
                        llanta2d,
                        llanta3d,
                        llanta4d,
                        llanta5d,
                        llanta6d,
                        llanta7d,
                        llanta8d,
                      ],
                      "3",
                      dolly,
                    );

                    //remolque2 llantas
                    _guardarllantas(
                      [
                        llantarem2Eco0,
                        llantarem2Eco1,
                        llantarem2Eco2,
                        llantarem2Eco3,
                        llantarem2Eco4,
                        llantarem2Eco5,
                        llantarem2Eco6,
                        llantarem2Eco7,
                      ],
                      "4",
                      unidadrem2,
                    );

                    _limpiar(context);
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: new Text("Alert!!"),
                        content: new Text("Ya se ha enviado anteriormente!"),
                        actions: <Widget>[
                          // ignore: deprecated_member_use
                          new FlatButton(
                            child: new Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Icon(
                Icons.save,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: colorCodes,
        ),
      ),
    );
  }

  void _limpiar(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var nombre = preferences.getString('user');
    await preferences.clear();
    // ignore: deprecated_member_use
    await preferences.commit();
    preferences.setString('user', nombre);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Alert!!"),
          content: new Text("Se ha regisrado correctamente!"),
          actions: <Widget>[
            // ignore: deprecated_member_use
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Consulta(),
                    ),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  void _guardartrac(List<String> datos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String fecha = prefs.getString('Entrada');
    String cp = prefs.getString('valor');
    String usuario = prefs.getString('user');
    var url =
        "http://supertrack-net.ddns.net:50371/Controldeunidades/php/rev_trac.php";
    var respuesta = await http.post(url, body: {
      'rev_tracs': '1',
      'tracto_eco': datos[0],
      'placas_trac': datos[1],
      'motivo_ingreso': datos[2],
      'cabina': datos[3],
      'defensa_delantera': datos[4],
      'tanque_Aire': datos[5],
      'motor': datos[6],
      'eje_impulsor': datos[7],
      'piso_cabiba': datos[8],
      'quinta_rueda': datos[9],
      'tanque_Diesel': datos[10],
      'escape': datos[11],
      'CM_T_Izq': datos[12],
      'CM_T_Der': datos[13],
      'Cap_Tanque_LT_Izq': datos[14],
      'Cap_Tanque_LT_Der': datos[15],
      'Trampa_Izq': datos[16],
      'Trampa_Der': datos[17],
      'Aluminio': datos[18],
      'Fierro': datos[19],
      'Tapon_Diesel_Der': datos[20],
      'Tapon_Diesel_Izq': datos[21],
      'fecha': fecha,
      'estatus': 'Patio',
      'cp': cp.toUpperCase(),
      'usuario': usuario,
    }, headers: {
      'Accept': 'application/javascript',
      'Content-Type': 'application/x-www-form-urlencoded'
    });
    final respuest = registrarFromJson(respuesta.body);
    print(respuest.mensaje);
  }

  void _guardarem(List<String> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String fecha = prefs.getString('Entrada');
    String cp = prefs.getString('valor');
    var url =
        "http://supertrack-net.ddns.net:50371/Controldeunidades/php/insert_rev_rems.php";
    var respuesta = await http.post(url, body: {
      'rev_rems': '1',
      'rem': list[0],
      'placa': list[1],
      'Fisicomecanica': list[2],
      'Sello_de_entrada': list[3],
      'Afuera_Debajo_remolque': list[4],
      'Par_int_lado_derecho': list[5],
      'Par_int_lado_Izq': list[6],
      'Puertas_Fuera_Dentro': list[7],
      'Techo_par_Int': list[8],
      'Pared_frontal': list[9],
      'Piso_Par_Int': list[10],
      'fecha': fecha,
      'cp': cp.toUpperCase(),
    }, headers: {
      'Accept': 'application/javascript',
      'Content-Type': 'application/x-www-form-urlencoded'
    });
    final respuest = registrarFromJson(respuesta.body);
    print(respuest.mensaje);
  }

  void _guardarllantas(List<String> list, trd, unidad) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String fecha = prefs.getString('Entrada');
    String cp = prefs.getString('valor');
    var url =
        "http://supertrack-net.ddns.net:50371/Controldeunidades/php/llantas_insert.php";
    if (trd == "1") {
      var i = 0;
      list.forEach((element) async {
        var tipo = prefs.getString("$i-LlantaT");
        var eco = prefs.getString("llantaTractoeco$i");
        var descrip = prefs.getString("llantaTracto$i");
        var marca = prefs.getString("llantaTractomarca$i");
        var pos1 = i + 1;
        String pos = pos1.toString();
        if (tipo == null) {
          tipo = '';
        }
        if (element == null) {
          element = '';
        }
        i++;
        var respuesta = await http.post(url, body: {
          'Lla_rems_dolly': '1',
          'rem_trac_dol': unidad,
          'llanta': eco.trim(),
          'posicion': pos,
          'marca_descrip': marca.trim(),
          'descrip': descrip.trim(),
          'observaciones': element,
          'fecha': fecha,
          'tipo': tipo,
          'cp': cp.toUpperCase(),
        }, headers: {
          'Accept': 'application/javascript',
          'Content-Type': 'application/x-www-form-urlencoded'
        });
        final respuest = registrarFromJson(respuesta.body);
        print(respuest.mensaje);
      });
    } else if (trd == "2") {
      var i = 0;
      list.forEach((element) async {
        var tipo = prefs.getString("$i-LlantaR1");
        var eco = prefs.getString("llantarem1Eco$i");
        var marca = prefs.getString("llantarem1marca$i");
        var descrip = prefs.getString("llantarem1descrip$i");
        var pos1 = i + 1;
        String pos = pos1.toString();
        if (tipo == null) {
          tipo = '';
        }
        if (element == null) {
          element = '';
        }
        if (descrip == null) {
          descrip = '';
        }
        i++;
        var respuesta = await http.post(url, body: {
          'Lla_rems_dolly': '1',
          'rem_trac_dol': unidad,
          'llanta': eco.trim(),
          'posicion': pos,
          'marca_descrip': marca.trim(),
          'descrip': descrip.trim(),
          'observaciones': element,
          'fecha': fecha,
          'tipo': tipo,
          'cp': cp.toUpperCase(),
        }, headers: {
          'Accept': 'application/javascript',
          'Content-Type': 'application/x-www-form-urlencoded'
        });
        final respuest = registrarFromJson(respuesta.body);
        print(respuest.mensaje);
      });
    } else if (trd == "3") {
      var i = 0;
      list.forEach((element) async {
        var tipo = prefs.getString("$i-LlantaD");
        var eco = prefs.getString("llantaDE$i");
        var marca = prefs.getString("llantaDM$i");
        var descrip = prefs.getString("llantaDDes$i");
        var pos1 = i + 1;
        String pos = pos1.toString();
        if (tipo == null) {
          tipo = '';
        }
        if (element == null) {
          element = '';
        }
        i++;
        var respuesta = await http.post(url, body: {
          'Lla_rems_dolly': '1',
          'rem_trac_dol': unidad,
          'llanta': eco.trim(),
          'posicion': pos,
          'marca_descrip': marca.trim(),
          'descrip': descrip.trim(),
          'observaciones': element,
          'fecha': fecha,
          'tipo': tipo,
          'cp': cp.toUpperCase(),
        }, headers: {
          'Accept': 'application/javascript',
          'Content-Type': 'application/x-www-form-urlencoded'
        });
        final respuest = registrarFromJson(respuesta.body);
        print(respuest.mensaje);
      });
    } else if (trd == "4") {
      var i = 0;
      list.forEach((element) async {
        var tipo = prefs.getString("$i-LlantaR2");
        var eco = prefs.getString("llantarem2Eco$i");
        var marca = prefs.getString("llantarem2marca$i");
        var descrip = prefs.getString("llantarem2descrip$i");

        var pos1 = i + 1;
        String pos = pos1.toString();
        if (tipo == null) {
          tipo = '';
        }
        if (element == null) {
          element = '';
        }
        i++;
        var respuesta = await http.post(url, body: {
          'Lla_rems_dolly': '1',
          'rem_trac_dol': unidad,
          'llanta': eco.trim(),
          'posicion': pos,
          'marca_descrip': marca.trim(),
          'descrip': descrip.trim(),
          'observaciones': element,
          'fecha': fecha,
          'tipo': tipo,
          'cp': cp.toUpperCase(),
        }, headers: {
          'Accept': 'application/javascript',
          'Content-Type': 'application/x-www-form-urlencoded'
        });
        final respuest = registrarFromJson(respuesta.body);
        print(respuest.mensaje);
      });
    }
  }
}

class MyStatefulWidget extends StatefulWidget {
  final String unidad;
  final String motivoingreso;
  final String llanta2;
  final String llanta4;
  final String llanta6;
  final String llanta8;
  final String llanta10;
  final String defensadelantera;
  final String motor;
  final String pisodecabiba;
  final String tanquedeDiesel;
  final String cMTDer;
  final String capTanqueLTDer;
  final String trampaDer;
  final String aluminio;
  final String taponDieselDer;
  const MyStatefulWidget({
    key,
    this.unidad,
    this.motivoingreso,
    this.llanta2,
    this.llanta4,
    this.llanta6,
    this.llanta8,
    this.llanta10,
    this.defensadelantera,
    this.motor,
    this.pisodecabiba,
    this.tanquedeDiesel,
    this.cMTDer,
    this.capTanqueLTDer,
    this.trampaDer,
    this.aluminio,
    this.taponDieselDer,
  }) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _isSelected = false;
  bool _isSelected2 = false;
  bool _isSelected4 = false;
  bool _isSelected5 = false;
  bool _isSelected6 = false;
  bool _isSelected7 = false;
  bool _isSelected8 = false;
  bool _isSelected9 = false;
  bool _isSelected10 = false;
  bool _isSelected11 = false;
  bool _isSelected12 = false;
  bool _isSelected13 = false;
  bool _isSelected14 = false;
  bool _isSelected15 = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        LabeledCheckbox2(
          label: "Unidad: ",
          values: widget.unidad,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.height * .28,
        ),
        LabeledCheckbox2(
          label: "Motivo de  ingreso: ",
          descripcion: "Motivo del daño",
          values: widget.motivoingreso,
          value: true,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Defensa delantera:",
          descripcion: "Motivo del daño",
          value: _isSelected,
          active: false,
          values: widget.defensadelantera,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Motor:",
          descripcion: "Motivo del daño",
          value: _isSelected2,
          active: false,
          values: widget.motor,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected2 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Piso de cabiba :",
          descripcion: "Motivo del daño",
          value: _isSelected4,
          active: false,
          values: widget.pisodecabiba,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected4 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Tanque de Diesel:",
          descripcion: "Motivo del daño",
          value: _isSelected5,
          active: false,
          values: widget.tanquedeDiesel,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected5 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "CM T. Der.:",
          descripcion: "Motivo del daño",
          value: _isSelected6,
          active: false,
          values: widget.cMTDer,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected6 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Cap. Tanque LT. Der.:",
          descripcion: "Motivo del daño",
          value: _isSelected7,
          active: false,
          values: widget.capTanqueLTDer,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected7 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Trampa Der.:",
          descripcion: "Motivo del daño",
          value: _isSelected8,
          active: false,
          values: widget.trampaDer,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected8 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Aluminio:",
          descripcion: "Motivo del daño",
          value: _isSelected9,
          active: false,
          values: widget.aluminio,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected9 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Tapon de Diesel Der.:",
          descripcion: "Motivo del daño",
          value: _isSelected10,
          active: false,
          values: widget.taponDieselDer,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected10 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 2:",
          descripcion: "Motivo del daño",
          value: _isSelected11,
          active: false,
          values: widget.llanta2,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected11 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 4:",
          descripcion: "Motivo del daño",
          value: _isSelected12,
          active: false,
          values: widget.llanta4,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected12 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 6:",
          descripcion: "Motivo del daño",
          value: _isSelected13,
          active: false,
          values: widget.llanta6,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected13 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 8:",
          descripcion: "Motivo del daño",
          value: _isSelected14,
          active: false,
          values: widget.llanta8,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected14 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 10:",
          descripcion: "Motivo del daño",
          value: _isSelected15,
          active: false,
          values: widget.llanta10,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected15 = values;
            });
          },
        ),
      ],
    );
  }

  // Future<void> _doSomething(String text) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   setState(() {
  //     prefs.setString("valor", text);
  //   });
  // }
}

class MyStateful2Widget extends StatefulWidget {
  final String cabina;
  final String tanqueAire;
  final String ejeImpulsor;
  final String quintaRueda;
  final String escape;
  final String cMTIzq;
  final String capTanqueLTIzq;
  final String trampaIzq;
  final String fierro;
  final String tapondeDieselIzq;
  final String llanta1s;
  final String llanta3s;
  final String llanta5s;
  final String llanta7s;
  final String llanta9s;
  const MyStateful2Widget(
      {key,
      this.cabina,
      this.tanqueAire,
      this.ejeImpulsor,
      this.quintaRueda,
      this.escape,
      this.cMTIzq,
      this.capTanqueLTIzq,
      this.trampaIzq,
      this.fierro,
      this.tapondeDieselIzq,
      this.llanta1s,
      this.llanta3s,
      this.llanta5s,
      this.llanta7s,
      this.llanta9s})
      : super(key: key);

  @override
  _MyStateful2WidgetState createState() => _MyStateful2WidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStateful2WidgetState extends State<MyStateful2Widget> {
  bool _isSelected = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected4 = false;
  bool _isSelected5 = false;
  bool _isSelected6 = false;
  bool _isSelected7 = false;
  bool _isSelected8 = false;
  bool _isSelected9 = false;
  bool _isSelected10 = false;
  bool _isSelected11 = false;
  bool _isSelected12 = false;
  bool _isSelected13 = false;
  bool _isSelected14 = false;
  bool _isSelected15 = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        LabeledCheckbox2(
          label: "Cabina:",
          descripcion: "Motivo del daño",
          value: _isSelected,
          values: widget.cabina,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Tanque de Aire:",
          descripcion: "Motivo del daño",
          value: _isSelected2,
          active: false,
          values: widget.tanqueAire,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected2 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Eje impulsor:",
          descripcion: "Motivo del daño",
          value: _isSelected3,
          active: false,
          values: widget.ejeImpulsor,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected3 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Quinta rueda :",
          descripcion: "Motivo del daño",
          value: _isSelected4,
          active: false,
          values: widget.quintaRueda,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected4 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Escape :",
          descripcion: "Motivo del daño",
          value: _isSelected5,
          active: false,
          values: widget.escape,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected5 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "CM T. Izq.:",
          descripcion: "Motivo del daño",
          value: _isSelected6,
          active: false,
          values: widget.cMTIzq,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected6 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Cap. Tanque LT. Izq.:",
          descripcion: "Motivo del daño",
          value: _isSelected7,
          active: false,
          values: widget.capTanqueLTIzq,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected7 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Trampa Izq.:",
          descripcion: "Motivo del daño",
          value: _isSelected8,
          active: false,
          values: widget.trampaIzq,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected8 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Fierro:",
          descripcion: "Motivo del daño",
          value: _isSelected9,
          active: false,
          values: widget.fierro,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected9 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Tapon de Diesel Izq:",
          descripcion: "Motivo del daño",
          value: _isSelected10,
          active: false,
          values: widget.tapondeDieselIzq,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected10 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 1:",
          descripcion: "Motivo del daño",
          value: _isSelected11,
          active: false,
          values: widget.llanta1s,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected11 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 3:",
          descripcion: "Motivo del daño",
          value: _isSelected12,
          active: false,
          values: widget.llanta1s,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected12 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 5:",
          descripcion: "Motivo del daño",
          value: _isSelected13,
          active: false,
          values: widget.llanta5s,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected13 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 7:",
          descripcion: "Motivo del daño",
          value: _isSelected14,
          active: false,
          values: widget.llanta7s,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected14 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 9:",
          descripcion: "Motivo del daño",
          value: _isSelected15,
          active: false,
          values: widget.llanta9s,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected15 = values;
            });
          },
        ),
      ],
    );
  }

  // Future<void> _doSomething(String text) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   setState(() {
  //     prefs.setString("valor", text);
  //   });
  // }
}

class MyStateful4Widget extends StatefulWidget {
  final String llanta2d;
  final String llanta4d;
  final String llanta6d;
  final String llanta8d;
  const MyStateful4Widget({
    key,
    this.llanta2d,
    this.llanta4d,
    this.llanta6d,
    this.llanta8d,
  }) : super(key: key);

  @override
  _MyStateful4WidgetState createState() => _MyStateful4WidgetState();
}

/// This is the private State class that goes with MyStateful4Widget.
class _MyStateful4WidgetState extends State<MyStateful4Widget> {
  bool _isSelected11 = false;
  bool _isSelected12 = false;
  bool _isSelected13 = false;
  bool _isSelected14 = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(widget.llanta2d);
    return Column(
      children: <Widget>[
        LabeledCheckbox2(
          label: "Llanta 2:",
          descripcion: "Motivo del daño",
          values: widget.llanta2d,
          value: _isSelected11,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected11 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 4:",
          descripcion: "Motivo del daño",
          values: widget.llanta4d,
          value: _isSelected12,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected12 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 6:",
          descripcion: "Motivo del daño",
          values: widget.llanta6d,
          value: _isSelected13,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected13 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 8:",
          descripcion: "Motivo del daño",
          values: widget.llanta8d,
          value: _isSelected14,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected14 = values;
            });
          },
        ),
      ],
    );
  }

  // Future<void> _doSomething(String text) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   setState(() {
  //     prefs.setString("valor", text);
  //   });
  // }
}

class MyStateful3Widget extends StatefulWidget {
  final String llanta1d;
  final String llanta3d;
  final String llanta5d;
  final String llanta7d;

  const MyStateful3Widget({
    key,
    this.llanta1d,
    this.llanta3d,
    this.llanta5d,
    this.llanta7d,
  }) : super(key: key);

  @override
  _MyStateful3WidgetState createState() => _MyStateful3WidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStateful3WidgetState extends State<MyStateful3Widget> {
  bool _isSelected11 = false;
  bool _isSelected12 = false;
  bool _isSelected13 = false;
  bool _isSelected14 = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(widget.llanta1d);
    return Column(
      children: <Widget>[
        LabeledCheckbox2(
          label: "Llanta 1:",
          descripcion: "Motivo del daño",
          values: widget.llanta1d,
          value: _isSelected11,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected11 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 3:",
          descripcion: "Motivo del daño",
          values: widget.llanta3d,
          value: _isSelected12,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected12 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 5:",
          descripcion: "Motivo del daño",
          values: widget.llanta5d,
          value: _isSelected13,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected13 = values;
            });
          },
        ),
        LabeledCheckbox2(
          label: "Llanta 7:",
          descripcion: "Motivo del daño",
          values: widget.llanta7d,
          value: _isSelected14,
          active: false,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ancho: size.width * .23,
          onChanged: (bool values) {
            setState(() {
              this._isSelected14 = values;
            });
          },
        ),
      ],
    );
  }

  // Future<void> _doSomething(String text) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   setState(() {
  //     prefs.setString("valor", text);
  //   });
  // }
}

class MyStateful5Widget extends StatefulWidget {
  //rem
  final String fmrem1;
  final String serem1;
  final String fdremrem1;
  final String partintderrem1;
  final String pisopartintrem1;
  final String llantarem1Eco0;
  final String llantarem1Eco2;
  final String llantarem1Eco4;
  final String llantarem1Eco6;
  //rem2
  final String fmrem2;
  final String serem2;
  final String fdremrem2;
  final String partintderrem2;
  final String pisopartintrem2;
  final String llantarem2Eco0;
  final String llantarem2Eco2;
  final String llantarem2Eco4;
  final String llantarem2Eco6;

  const MyStateful5Widget({
    key,
    this.fmrem2,
    this.serem2,
    this.fdremrem2,
    this.partintderrem2,
    this.pisopartintrem2,
    this.llantarem2Eco0,
    this.llantarem2Eco2,
    this.llantarem2Eco4,
    this.llantarem2Eco6,
    this.fmrem1,
    this.serem1,
    this.fdremrem1,
    this.partintderrem1,
    this.pisopartintrem1,
    this.llantarem1Eco0,
    this.llantarem1Eco2,
    this.llantarem1Eco4,
    this.llantarem1Eco6,
  }) : super(key: key);

  @override
  _MyStateful5WidgetState createState() => _MyStateful5WidgetState();
}

/// This is the private State class that goes with MyStateful5Widget.
class _MyStateful5WidgetState extends State<MyStateful5Widget> {
  bool _isSelected = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected4 = false;
  bool _isSelected6 = false;
  bool _isSelected11 = false;
  bool _isSelected12 = false;
  bool _isSelected13 = false;
  bool _isSelected14 = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (widget.fmrem1 != null) {
      return Column(
        children: <Widget>[
          LabeledCheckbox2(
            label: "Fisicomecanica:",
            descripcion: "Motivo del daño",
            values: widget.fmrem1,
            value: _isSelected,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Sello de entrada:",
            descripcion: "Motivo del daño",
            values: widget.serem1,
            value: _isSelected2,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected2 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Afuera/Debajo del remolque:",
            descripcion: "Motivo del daño",
            values: widget.fdremrem1,
            value: _isSelected3,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .21,
            onChanged: (bool values) {
              setState(() {
                this._isSelected3 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Parte int. lado derecho :",
            descripcion: "Motivo del daño",
            values: widget.partintderrem1,
            value: _isSelected4,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected4 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Piso Parte Int.:",
            descripcion: "Motivo del daño",
            values: widget.partintderrem1,
            value: _isSelected6,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected6 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 1:",
            descripcion: "Motivo del daño",
            values: widget.llantarem1Eco0,
            value: _isSelected11,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected11 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 3:",
            descripcion: "Motivo del daño",
            values: widget.llantarem1Eco2,
            value: _isSelected12,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected12 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 5:",
            descripcion: "Motivo del daño",
            values: widget.llantarem1Eco4,
            value: _isSelected13,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected13 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 7:",
            descripcion: "Motivo del daño",
            values: widget.llantarem1Eco6,
            value: _isSelected14,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected14 = values;
              });
            },
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          LabeledCheckbox2(
            label: "Fisicomecanica:",
            descripcion: "Motivo del daño",
            values: widget.fmrem2,
            value: _isSelected,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Sello de entrada:",
            descripcion: "Motivo del daño",
            values: widget.serem2,
            value: _isSelected2,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected2 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Afuera/Debajo del remolque:",
            descripcion: "Motivo del daño",
            values: widget.fdremrem2,
            value: _isSelected3,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .21,
            onChanged: (bool values) {
              setState(() {
                this._isSelected3 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Parte int. lado derecho :",
            descripcion: "Motivo del daño",
            values: widget.partintderrem2,
            value: _isSelected4,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected4 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Piso Parte Int.:",
            descripcion: "Motivo del daño",
            values: widget.partintderrem2,
            value: _isSelected6,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected6 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 1:",
            descripcion: "Motivo del daño",
            values: widget.llantarem2Eco0,
            value: _isSelected11,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected11 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 3:",
            descripcion: "Motivo del daño",
            values: widget.llantarem2Eco2,
            value: _isSelected12,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected12 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 5:",
            descripcion: "Motivo del daño",
            values: widget.llantarem2Eco4,
            value: _isSelected13,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected13 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 7:",
            descripcion: "Motivo del daño",
            values: widget.llantarem2Eco6,
            value: _isSelected14,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected14 = values;
              });
            },
          ),
        ],
      );
    }
  }
}

class MyStateful6Widget extends StatefulWidget {
  //rem
  final String pulizrem1;
  final String parinizqrem1;
  final String techointrem1;
  final String paredfrontalrem1;
  final String llantarem1Eco1;
  final String llantarem1Eco3;
  final String llantarem1Eco5;
  final String llantarem1Eco7;
  //rem2
  final String pulizrem2;
  final String parinizqrem2;
  final String techointrem2;
  final String paredfrontalrem2;
  final String llantarem2Eco1;
  final String llantarem2Eco3;
  final String llantarem2Eco5;
  final String llantarem2Eco7;
  const MyStateful6Widget({
    key,
    this.pulizrem2,
    this.parinizqrem2,
    this.techointrem2,
    this.paredfrontalrem2,
    this.llantarem2Eco1,
    this.llantarem2Eco3,
    this.llantarem2Eco5,
    this.llantarem2Eco7,
    this.pulizrem1,
    this.parinizqrem1,
    this.techointrem1,
    this.paredfrontalrem1,
    this.llantarem1Eco1,
    this.llantarem1Eco3,
    this.llantarem1Eco5,
    this.llantarem1Eco7,
  }) : super(key: key);

  @override
  _MyStateful6WidgetState createState() => _MyStateful6WidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStateful6WidgetState extends State<MyStateful6Widget> {
  bool _isSelected = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected5 = false;
  bool _isSelected11 = false;
  bool _isSelected12 = false;
  bool _isSelected13 = false;
  bool _isSelected14 = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (widget.pulizrem1 != null) {
      return Column(
        children: <Widget>[
          LabeledCheckbox2(
            label: "Puertas por Fuera/Dentro:",
            descripcion: "Motivo del daño",
            values: widget.pulizrem1,
            value: _isSelected,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .20,
            onChanged: (bool values) {
              setState(() {
                this._isSelected = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Parte int. lado Izq.:",
            descripcion: "Motivo del daño",
            values: widget.parinizqrem1,
            value: _isSelected2,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected2 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Techo parte Int.:",
            descripcion: "Motivo del daño",
            values: widget.techointrem1,
            value: _isSelected3,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected3 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Pared Frontal:",
            descripcion: "Motivo del daño",
            values: widget.paredfrontalrem1,
            value: _isSelected5,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected5 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 2:",
            descripcion: "Motivo del daño",
            values: widget.llantarem1Eco1,
            value: _isSelected11,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected11 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 4:",
            descripcion: "Motivo del daño",
            values: widget.llantarem1Eco3,
            value: _isSelected12,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected12 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 6:",
            descripcion: "Motivo del daño",
            values: widget.llantarem1Eco5,
            value: _isSelected13,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected13 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 8:",
            descripcion: "Motivo del daño",
            values: widget.llantarem1Eco7,
            value: _isSelected14,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected14 = values;
              });
            },
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          LabeledCheckbox2(
            label: "Puertas por Fuera/Dentro:",
            descripcion: "Motivo del daño",
            values: widget.pulizrem2,
            value: _isSelected,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .20,
            onChanged: (bool values) {
              setState(() {
                this._isSelected = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Parte int. lado Izq.:",
            descripcion: "Motivo del daño",
            values: widget.parinizqrem2,
            value: _isSelected2,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected2 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Techo parte Int.:",
            descripcion: "Motivo del daño",
            values: widget.techointrem2,
            value: _isSelected3,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected3 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Pared Frontal:",
            descripcion: "Motivo del daño",
            values: widget.paredfrontalrem2,
            value: _isSelected5,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected5 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 2:",
            descripcion: "Motivo del daño",
            values: widget.llantarem2Eco1,
            value: _isSelected11,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected11 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 4:",
            descripcion: "Motivo del daño",
            values: widget.llantarem2Eco3,
            value: _isSelected12,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected12 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 6:",
            descripcion: "Motivo del daño",
            values: widget.llantarem2Eco5,
            value: _isSelected13,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected13 = values;
              });
            },
          ),
          LabeledCheckbox2(
            label: "Llanta 8:",
            descripcion: "Motivo del daño",
            values: widget.llantarem2Eco7,
            value: _isSelected14,
            active: false,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ancho: size.width * .23,
            onChanged: (bool values) {
              setState(() {
                this._isSelected14 = values;
              });
            },
          ),
        ],
      );
    }
  }
}
