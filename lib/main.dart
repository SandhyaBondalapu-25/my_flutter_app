import 'package:flutter/material.dart';
import 'package:my_app/homepage.dart';
import 'package:my_app/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(
    ProviderScope(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    ),
  );
}

final counterProvider = StateProvider<int>((ref) => 0);


class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Riverpod Counter")),
        body: Center(
          child: Text(
            '$count',
            style: TextStyle(fontSize: 40),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}