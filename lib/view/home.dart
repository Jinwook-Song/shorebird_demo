import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shorebird_demo/generated/l10n.dart';
import 'package:shorebird_demo/view/view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AudioPlayer _audioPlayer = AudioPlayer()
    ..setAsset('assets/audios/effect_correct.mp3')
    ..play();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).title),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ));
              },
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/arrow_left_circle.png',
                    width: 40,
                    height: 40,
                  ),
                  const Gap(20),
                  Image.asset(
                    'assets/images/arrow_right_circle.png',
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _audioPlayer.seek(Duration.zero).then(
                  (_) => _audioPlayer.play(),
                );
          },
          child: const Icon(
            Icons.play_circle,
          ),
        ),
      ),
    );
  }
}
