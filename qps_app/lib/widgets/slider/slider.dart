import 'package:flutter/material.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return Carousel(
      dotSize: 5.0,
      indicatorBgPadding: 5,
      images: [
        Image.asset(
          'asset/slider/3.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'asset/slider/1.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'asset/slider/5.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'asset/slider/4.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'asset/slider/2.png',
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
