import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: -60,
              left: -60,
              child: Image.asset("assets/images/sun.png"),
              width: size.width * 0.55,
            ),
            Positioned(
              top: -60,
              right: -75,
              child: Image.asset("assets/images/clouds.png"),
              width: size.width * 0.55,
            ),
            child
          ],
        ),
      ),
    );
  }
}
