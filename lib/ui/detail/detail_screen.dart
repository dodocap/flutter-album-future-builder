import 'package:flutter/material.dart';
import 'package:orm_album_future_builder/ui/detail/detail_view_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailScreen'),
      ),
      body: DetailViewModel(),
    );
  }
}
