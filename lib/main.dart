import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shorebird_demo/core/storage/preference.dart';
import 'package:shorebird_demo/generated/l10n.dart';
import 'package:shorebird_demo/src/provider/app_theme.dart';
import 'package:shorebird_demo/src/util/util.dart';
import 'package:shorebird_demo/src/view/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferencesWithCache prefsWithCache =
      await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(),
  );

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefsWithCache),
      ],
      // observers: [ProviderLogger()],
      child: const App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ref.watch(appThemeProvider).themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      localizationsDelegates: const [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko'),
        Locale('en'),
      ],
      home: const HomeScreen(),
    );
  }
}
