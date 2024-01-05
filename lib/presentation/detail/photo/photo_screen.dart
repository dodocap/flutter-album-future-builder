import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  final String _title;
  final String _url;

  const PhotoScreen({
    super.key,
    required String title,
    required String url,
  })  : _title = title,
        _url = url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: Center(
        child: Hero(
          tag: _title,
          child: CachedNetworkImage(
            imageUrl: _url,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
