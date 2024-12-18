import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shorebird_demo/generated/l10n.dart';
import 'package:shorebird_demo/src/model/counter_model.dart';
import 'package:shorebird_demo/src/provider/provider.dart';
import 'package:shorebird_demo/src/view/view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_audioPlay);
  }

  _audioPlay(Duration _) async {
    await _audioPlayer.setAsset('assets/audios/effect_correct.mp3');
    await _audioPlayer.play();
  }

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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: Center(
          child: Consumer(
            builder: (context, ref, child) {
              final CounterModel couter =
                  ref.watch(counterProvider).value ?? CounterModel.initial();
              final color = ref.watch(appThemeProvider).isDefaultTheme
                  ? Colors.deepOrange
                  : Colors.amber;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Shorebird 06'),
                  Text(
                    '${couter.count}',
                    style: TextStyle(
                      fontSize: 40,
                      color: color,
                    ),
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap:
                            ref.read(appThemeProvider.notifier).setLightTheme,
                        child: Image.asset(
                          'assets/images/arrow_left_circle.png',
                          color: color,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const Gap(16),
                      GestureDetector(
                        onTap: ref.read(appThemeProvider.notifier).setDarkTheme,
                        child: Image.asset(
                          'assets/images/arrow_right_circle.png',
                          color: color,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: Consumer(
          builder: (context, ref, child) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  heroTag: 'audio',
                  onPressed: () async {
                    await _audioPlayer.seek(Duration.zero);
                    await _audioPlayer.play();
                  },
                  child: const Icon(Icons.audiotrack_rounded),
                ),
                const Gap(10),
                ref.watch(counterProvider).maybeWhen<Widget>(
                      data: (data) {
                        return Row(
                          children: [
                            FloatingActionButton(
                              heroTag: 'play',
                              onPressed:
                                  ref.read(counterProvider.notifier).togglePlay,
                              child: Icon(
                                data.isPlay
                                    ? Icons.pause_circle
                                    : Icons.play_circle,
                              ),
                            ),
                            const Gap(10),
                            FloatingActionButton(
                              heroTag: 'reset',
                              onPressed:
                                  ref.read(counterProvider.notifier).reset,
                              child: const Icon(
                                Icons.refresh,
                              ),
                            ),
                          ],
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    ),
              ],
            );
          },
        ),
      ),
    );
  }
}
