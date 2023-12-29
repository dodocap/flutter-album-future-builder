import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:orm_album_future_builder/model/photo.dart';
import 'package:orm_album_future_builder/repository/album_repository.dart';
import 'package:orm_album_future_builder/repository/album_repository_impl.dart';

class DetailViewModel {
  final AlbumRepository albumRepository = AlbumRepositoryImpl();

  Future<List<Photo>> getPhotos(String id) async {
    List<Photo> photoList = await albumRepository.getPhotos(id);
    photoList.removeWhere((element) => element.id == -1);
    return photoList;
  }
}