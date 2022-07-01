import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tickity_boom/data/themes/dark_theme.dart';
import 'package:tickity_boom/data/themes/light_theme.dart';
import 'package:tickity_boom/presentation/pages/home_page.dart';
import 'package:tickity_boom/providers/providers.dart';

Future<void> main() async {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialize = ref.watch(firebaseinitializerProvider);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: initialize.when(
          data: (app) => const HomePage(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => const Center(child: Text('Error')),
        ));
  }
}
