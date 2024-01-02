import 'dart:async';
import 'package:flutter/material.dart';
import 'package:orm_album_future_builder/model/photo.dart';
import 'package:orm_album_future_builder/repository/album_repository.dart';

class DetailViewModel extends ChangeNotifier {
  final AlbumRepository _albumRepository;

  DetailViewModel({required AlbumRepository albumRepository})
      : _albumRepository = albumRepository;

  List<Photo> _photoList = [];
  List<Photo> get photoList => List.unmodifiable(_photoList);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getPhotos(String id) async {
    _isLoading = true;
    notifyListeners();

    _photoList = await _albumRepository.getPhotos(id);
    _photoList.removeWhere((element) => element.id == -1);

    _isLoading = false;
    notifyListeners();
  }
}