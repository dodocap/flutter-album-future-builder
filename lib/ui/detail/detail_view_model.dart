import 'dart:async';

import 'package:flutter/material.dart';
import 'package:orm_album_future_builder/model/photo.dart';
import 'package:orm_album_future_builder/repository/album_repository.dart';
import 'package:orm_album_future_builder/ui/detail/detail_state.dart';

class DetailViewModel extends ChangeNotifier {
  final AlbumRepository _albumRepository;

  DetailViewModel({required AlbumRepository albumRepository})
      : _albumRepository = albumRepository;

  DetailState _state = const DetailState();
  DetailState get state => _state;

  Future<void> getPhotos(String id) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final List<Photo> photoList = await _albumRepository.getPhotos(id);
    photoList.removeWhere((element) => element.id == -1);
    _state = _state.copyWith(isLoading: false, photoList: photoList);

    notifyListeners();
  }
}