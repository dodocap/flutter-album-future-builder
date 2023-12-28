import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orm_album_future_builder/ui/main/main_view_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainScreen'),
        actions: [
          IconButton(onPressed: () {
            context.push('/detail');
          }, icon: Icon(Icons.navigate_next))
        ],
      ),
      body: MainViewModel(),
    );
  }
}
