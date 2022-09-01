import 'package:flutter/material.dart';

class ParrotImage extends StatelessWidget {
  final double? height;
  final double? width;

  const ParrotImage({
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'parrot',
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/parrot.png'),
        )),
        width: width,
        height: height,
      ),
    );
  }
}
