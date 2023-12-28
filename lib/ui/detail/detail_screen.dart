import 'package:flutter/material.dart';
import 'package:orm_album_future_builder/ui/detail/detail_view_model.dart';

class DetailScreen extends StatelessWidget {
  final int _id;
  final String _title;

  const DetailScreen({
    super.key,
    required int id,
    required String title,
  }) : _id = id, _title = title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: DetailViewModel(),
    );
  }
}
