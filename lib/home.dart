import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_parrot/theme.dart';

import 'widgets/app_bar.dart';
import 'widgets/home_button.dart';
import 'widgets/parrot_image.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.lightTheme.colorScheme.background,
      appBar: MyAppBar(
        title: const Text('Music Parrot'),
        widgets: [popupMenu()],
      ),
      body:
          homeBody(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  PopupMenuButton<String> popupMenu() {
    return PopupMenuButton<String>(
      color: const Color.fromARGB(255, 205, 255, 148),
      padding: const EdgeInsets.all(20),
      elevation: 1,
      onSelected: handleClick,
      itemBuilder: (BuildContext context) {
        return {'Settings', 'Share', 'About us', 'Contact us'}
            .map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  Center homeBody() {
    return Center(
        child: Container(
      margin: const EdgeInsets.all(20),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ParrotImage(
              height: constraints.maxHeight * 0.5,
              width: constraints.maxWidth * 0.8,
            ),
            HomeButton(
              height: constraints.maxHeight * 0.2,
              title: "Let's parrot!",
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Expanded(
                child: HomeButton(
                  height: constraints.maxHeight * 0.13,
                  title: 'Sandbox',
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: HomeButton(
                  height: constraints.maxHeight * 0.13,
                  title: 'Get inspire',
                ),
              )
            ])
          ],
        );
      }),
    ));
  }
}
