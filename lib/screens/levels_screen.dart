import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_parrot/widgets/note_player.dart';
import 'package:music_parrot/screens/game_screen.dart';

import '../controllers/scales_controller.dart';
import '../theme.dart';
import '../widgets/app_bar.dart';

class LevelsPage extends StatefulWidget {
  const LevelsPage({Key? key}) : super(key: key);

  @override
  State<LevelsPage> createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScalesController());

    return Scaffold(
      backgroundColor: Themes.lightTheme.colorScheme.background,
      appBar: MyAppBar(widgets: [
        Hero(
          tag: 'parrot',
          child: Container(
            margin:
                EdgeInsets.only(right: MediaQuery.of(context).size.width / 10),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/parrot.png'),
            )),
            width: 50,
            height: 50,
          ),
        )
      ], title: const Text("Levels")),
      body: ListView(
        children: [
          NotePlayer(),
          const Center(
              child: Hero(
            tag: 'level',
            child: LevelCard(
              scale: 'C Major',
              octaves: '1',
            ),
          )),
          const Center(
              child: LevelCard(
            scale: 'C Minor',
            octaves: '1',
          )),
          const Center(
              child: LevelCard(
            scale: 'C Cromatic',
            octaves: '1',
          )),
          const Center(child: LevelCard2()),
        ],
      ),
    );
  }
}

class LevelCard extends StatelessWidget {
  final String scale;
  final String octaves;

  const LevelCard({required this.scale, required this.octaves, super.key});

  @override
  Widget build(BuildContext context) {
    final otherController = Get.put(ScalesController());
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 7,
      child: Card(
        color: const Color.fromARGB(255, 234, 255, 175),
        child: InkWell(
          onTap: () async => {
            // otherController.startPlaying()
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  scale,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'Octaves: $octaves',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LevelCard2 extends StatelessWidget {
  const LevelCard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        middleColor: const Color.fromARGB(255, 234, 255, 175),
        openColor: const Color.fromARGB(255, 234, 255, 175),
        transitionType: ContainerTransitionType.fadeThrough,
        transitionDuration: const Duration(milliseconds: 500),
        closedElevation: 2,
        closedColor: const Color.fromARGB(255, 234, 255, 175),
        // closedShape: ContinuousRectangleBorder(
        //     borderRadius: BorderRadius.circular(16),
        //     side: BorderSide(color: Colors.red, width: 1)),
        openBuilder: (context, _) => const GameScreen(),
        closedBuilder: (context, action) => Ink(
              color: const Color.fromARGB(255, 234, 255, 175),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 7,
              child: InkWell(
                onTap: () async => {
                  // otherController.startPlaying()
                  action.call()
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'C Major',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        'Octaves: 1',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
