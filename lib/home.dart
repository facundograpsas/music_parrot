import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_parrot/theme.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const ParrotImage(),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Ink(
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

              // color: const Color.fromARGB(255, 181, 255, 97),
              width: 300,
              height: 100,
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onTap: () => setState(() {
                  Get.toNamed(
                    '/levels',
                  );
                }),
                child: const Center(
                    child: Text(
                  "Let's parrot!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ParrotImage extends StatelessWidget {
  const ParrotImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'parrot',
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/parrot.png'),
        )),
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 3,
      ),
    );
  }
}

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
