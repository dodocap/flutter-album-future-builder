import 'dart:async';
import 'package:flutter/material.dart';
import 'package:orm_album_future_builder/model/album.dart';
import 'package:orm_album_future_builder/repository/album_repository.dart';
import 'package:orm_album_future_builder/ui/main/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final AlbumRepository _albumRepository;

  MainViewModel({required AlbumRepository albumRepository})
      : _albumRepository = albumRepository {
    getAlbums();
  }

  MainState _state = const MainState();
  MainState get state => _state;

  Future<void> getAlbums() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final List<Album> albumList = await _albumRepository.getAlbums();
    albumList.removeWhere((element) => element.id == -1);
    _state = _state.copyWith(isLoading: false, albumList: albumList);

    notifyListeners();
  }
}
