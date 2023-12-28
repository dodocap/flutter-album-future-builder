import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orm_album_future_builder/model/album.dart';

class MainViewModel extends StatelessWidget {
  final Album _album;
  final void Function(String) onAlbumClicked;

  const MainViewModel({
    super.key,
    required Album album,
    required this.onAlbumClicked,
  }) : _album = album;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_album.title),
      onTap: () => onAlbumClicked(_album.id.toString()),
      trailing: const Icon(Icons.navigate_next),
    );
  }
}
