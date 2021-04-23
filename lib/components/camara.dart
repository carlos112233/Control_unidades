import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Camara extends StatefulWidget {
  @override
  _CamaraState createState() => _CamaraState();
}

class _CamaraState extends State<Camara> {
  File _image;
  Future getImage() async {
    // ignore: deprecated_member_use
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("imagens", image.path);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: _image == null
          ? Container()
          : Image.file(
              _image,
              height: double.infinity,
              width: double.infinity,
            ),
      onTap: () {
        getImage();
      },
    );
  }
}
