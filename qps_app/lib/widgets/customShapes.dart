import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customshape1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 75);
    path.quadraticBezierTo(width / 2, height + 75, width, height - 75);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class Customshape2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height * 1);
    path.lineTo(width, height * 0.7);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class Customshape3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height * 1);
    path.lineTo(width, height * 0.7);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class Customshape4 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path0 = Path();
    path0.moveTo(0, height * 1);
    path0.lineTo(0, height * 1);
    path0.lineTo(width, height * 1);
    path0.lineTo(width, height * 0);
    path0.lineTo(0, height * 0.3);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class Customshape5 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.quadraticBezierTo(
        size.width * -0.1, size.height * 0.6, 0, size.height * 0.6);
    path0.quadraticBezierTo(size.width * 0.0100000, size.height * 0.4,
        size.width * 0.1, size.height * 0.4);
    path0.lineTo(size.width * 0.9, size.height * 0.4);
    path0.quadraticBezierTo(
        size.width * 1, size.height * 0.4, size.width, size.height * 0.6);
    path0.quadraticBezierTo(
        size.width * 1, size.height * 0.6, size.width, size.height);
    path0.lineTo(0, size.height);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
