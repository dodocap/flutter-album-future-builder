import 'dart:async';
import 'package:flutter/material.dart';
import 'package:orm_album_future_builder/core/result.dart';
import 'package:orm_album_future_builder/core/ui_event.dart';
import 'package:orm_album_future_builder/model/album.dart';
import 'package:orm_album_future_builder/repository/album_repository.dart';
import 'package:orm_album_future_builder/ui/main/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final AlbumRepository _albumRepository;

  MainViewModel({required AlbumRepository albumRepository})
      : _albumRepository = albumRepository;

  MainState _state = const MainState();
  MainState get state => _state;

  final StreamController<UiEvent> _eventController = StreamController();
  Stream<UiEvent> get eventStream => _eventController.stream;

  Future<void> getAlbums() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Album>> albumListResult = await _albumRepository.getAlbums();
    albumListResult.when(
      success: (data) {
        data.removeWhere((element) => element.id == -1);
        _state = _state.copyWith(isLoading: false, albumList: data);
      },
      error: (e) {
        _state = _state.copyWith(isLoading: false, albumList: List.empty());
        _eventController.add(UiEvent.showSnackBar(e));
      },
    );

    notifyListeners();
  }
}
