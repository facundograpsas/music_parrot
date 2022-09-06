import 'package:flutter/material.dart';

class NoteButton extends StatelessWidget {
  final String number;
  final Function(TapDownDetails) onTapDown;
  final Function(TapUpDetails) onTapUp;

  const NoteButton({
    required this.number,
    required this.onTapDown,
    required this.onTapUp,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double unitWidthtValue = MediaQuery.of(context).size.width * 0.015;

    double multiplier = 8;

    return Ink(
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 187, 255, 190), width: 1),
            color: const Color.fromARGB(255, 76, 158, 55)),
        height: unitHeightValue * multiplier,
        width: unitWidthtValue * multiplier,
        child: InkWell(
          onTapUp: (details) => onTapUp(details),
          onTapDown: (details) => onTapDown(details),
          // onTap: () => onTap,
          child: Center(
              child: Text(
            number,
            style: const TextStyle(color: Colors.white),
          )),
        ));
  }
}
