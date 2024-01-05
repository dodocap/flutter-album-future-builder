import 'dart:async';
import 'package:flutter/material.dart';
import 'package:orm_album_future_builder/core/result.dart';
import 'package:orm_album_future_builder/core/ui_event.dart';
import 'package:orm_album_future_builder/domain/model/album.dart';
import 'package:orm_album_future_builder/domain/use_case/get_album_use_case.dart';
import 'package:orm_album_future_builder/presentation/main/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final GetAlbumUseCase _getAlbumUseCase;

  MainViewModel({required GetAlbumUseCase getAlbumUseCase}) : _getAlbumUseCase = getAlbumUseCase;

  MainState _state = const MainState();
  MainState get state => _state;

  final StreamController<UiEvent> _eventController = StreamController();
  Stream<UiEvent> get eventStream => _eventController.stream;

  Future<void> getAlbums() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Album>> albumListResult = await _getAlbumUseCase.execute();
    albumListResult.when(
      success: (data) {
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
