import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double height;
  final String imageName;

  CircleImage({this.height, this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height,
      height: height,
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(imageName)),
          borderRadius: BorderRadius.all(Radius.circular(height / 2))),
    );
  }
}
