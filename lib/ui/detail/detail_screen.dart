import 'package:flutter/material.dart';
import 'package:orm_album_future_builder/ui/detail/detail_view_model.dart';

class DetailScreen extends StatelessWidget {
  final int _id;

  const DetailScreen({
    super.key,
    required int id,
  }) : _id = id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailScreen $_id'),
      ),
      body: DetailViewModel(),
    );
  }
}
