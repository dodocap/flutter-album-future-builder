import 'package:flutter/material.dart';
import 'package:orm_album_future_builder/di/di_setup.dart';
import 'package:orm_album_future_builder/ui/routes.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      title: '퓨처빌더를 활용한 앨범',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}