import 'dart:async';
import 'package:flutter/material.dart';
import 'package:orm_album_future_builder/model/album.dart';
import 'package:orm_album_future_builder/repository/album_repository.dart';

class MainViewModel extends ChangeNotifier {
  final AlbumRepository _albumRepository;

  List<Album> _albumList = [];
  List<Album> get albumList => List.unmodifiable(_albumList);

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  MainViewModel({required AlbumRepository albumRepository})
      : _albumRepository = albumRepository {
    getAlbums();
  }

  Future<void> getAlbums() async {
    _isLoading = true;
    notifyListeners();

    _albumList = await _albumRepository.getAlbums();
    _albumList.removeWhere((element) => element.id == -1);

    _isLoading = false;
    notifyListeners();
  }
}
