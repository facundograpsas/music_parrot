import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> widgets;
  final Text title;

  const MyAppBar({required this.widgets, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: widgets,
        title: title);
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
