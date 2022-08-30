import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeButton extends StatelessWidget {
  final double height;
  final String title;
  const HomeButton({required this.height, this.title = '', Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Ink(
        height: height,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 205, 255, 148),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 185, 255, 120),
                spreadRadius: 0.5,
                blurRadius: 0.3,
                offset: Offset(1, 2))
          ],
        ),
        child: InkWell(
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onTap: () => {Get.toNamed('/levels')},
          child: Center(
              child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )),
        ),
      ),
    );
  }
}
