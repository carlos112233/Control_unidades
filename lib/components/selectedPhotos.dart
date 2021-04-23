import 'package:flutter/material.dart';

class SelectedPhoto extends StatelessWidget {
  final int numeroOfDots;
  final int photoIndex;

  const SelectedPhoto({
    Key key,
    this.numeroOfDots,
    this.photoIndex,
  });

  Widget _inactivePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          left: 3.0,
          right: 3.0,
        ),
        child: Container(
          height: 6.0,
          width: 6.0,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 4.0, right: 4.0),
        child: Container(
          height: 8.0,
          width: 8.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.0,
                blurRadius: 2.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];
    for (var i = 0; i < numeroOfDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
