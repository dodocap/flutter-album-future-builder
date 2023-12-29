import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orm_album_future_builder/model/album.dart';
import 'package:orm_album_future_builder/repository/album_repository.dart';
import 'package:orm_album_future_builder/repository/album_repository_impl.dart';

class MainViewModel {
  final AlbumRepository _albumRepository = AlbumRepositoryImpl();

  Future<List<Album>> getAlbums() async {
    final List<Album> albumList = await _albumRepository.getAlbums();
    albumList.removeWhere((element) => element.id == -1);
    return albumList;
  }
}
