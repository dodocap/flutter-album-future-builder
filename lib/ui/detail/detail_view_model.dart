import 'dart:async';

import 'package:flutter/material.dart';
import 'package:orm_album_future_builder/core/result.dart';
import 'package:orm_album_future_builder/core/ui_event.dart';
import 'package:orm_album_future_builder/model/photo.dart';
import 'package:orm_album_future_builder/repository/album_repository.dart';
import 'package:orm_album_future_builder/ui/detail/detail_state.dart';

class DetailViewModel extends ChangeNotifier {
  final AlbumRepository _albumRepository;

  DetailViewModel({required AlbumRepository albumRepository})
      : _albumRepository = albumRepository;

  DetailState _state = const DetailState();
  DetailState get state => _state;

  final StreamController<UiEvent> _eventController = StreamController();
  Stream<UiEvent> get eventStream => _eventController.stream;

  Future<void> getPhotos(String id) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Photo>> photoListResult = await _albumRepository.getPhotos(id);
    photoListResult.when(
      success: (data) {
        data.removeWhere((element) => element.id == -1);
        _state = _state.copyWith(isLoading: false, photoList: data);
      },
      error: (e) {
        _state = _state.copyWith(isLoading: false, photoList: List.empty());
        _eventController.add(UiEvent.showSnackBar(e));
      },
    );
    notifyListeners();
  }
}