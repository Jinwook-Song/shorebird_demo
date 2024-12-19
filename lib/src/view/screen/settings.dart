import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shorebird_demo/generated/l10n.dart';
import 'package:shorebird_demo/src/provider/app_theme.dart';
import 'package:shorebird_demo/src/provider/shorebird_update.dart';
import 'package:shorebird_demo/src/util/extension/string.dart';
import 'package:shorebird_demo/src/util/util.dart';

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
    final appTheme = ref.watch(appThemeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settingsTitle),
      ),
      body: ref.watch(shorebirdUpdateProvider).when(
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
            error: (error, stackTrace) => Center(
              child: Center(child: Text(error.toString())),
            ),
            data: (data) {
              if (!data) ref.invalidate(shorebirdUpdateProvider);

              return Column(
                children: [
                  ListTile(
                    leading: appTheme.isDefaultTheme
                        ? const Icon(Icons.light_mode_rounded)
                        : const Icon(Icons.dark_mode_rounded),
                    title: const Text('App Theme'),
                    subtitle: Text(
                      '//${appTheme.theme.name.toCapitalize()} (Default: Light)',
                    ),
                    trailing: Switch.adaptive(
                      value: appTheme.isDefaultTheme,
                      onChanged: (_) =>
                          ref.read(appThemeProvider.notifier).toggleTheme(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: data ? AndroidChannel.restartApp : null,
                    child: const Text('Update'),
                  ),
                ],
              );
            },
          ),
    );
  }
}
