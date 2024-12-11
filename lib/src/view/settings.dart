import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shorebird_demo/generated/l10n.dart';
import 'package:shorebird_demo/src/provider/app_theme.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_audioPlay);
  }

  _audioPlay(Duration _) async {
    await _audioPlayer.setAsset('assets/audios/effect_fail.mp3');
    await _audioPlayer.play();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settingsTitle),
      ),
      body: ListTile(
        title: const Text('App Theme'),
        subtitle: const Text('Light/Dark (Default: Light)'),
        trailing: Switch.adaptive(
          value: ref.watch(appThemeProvider).isDefaultTheme,
          onChanged: (_) => ref.read(appThemeProvider.notifier).toggleTheme(),
        ),
      ),
    );
  }
}
