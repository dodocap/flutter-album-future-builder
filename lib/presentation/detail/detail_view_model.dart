import 'dart:async';

import 'package:flutter/material.dart';
import 'package:orm_album_future_builder/core/result.dart';
import 'package:orm_album_future_builder/core/ui_event.dart';
import 'package:orm_album_future_builder/domain/model/photo.dart';
import 'package:orm_album_future_builder/domain/use_case/get_photo_by_id_use_case.dart';
import 'package:orm_album_future_builder/presentation/detail/detail_state.dart';

class DetailViewModel extends ChangeNotifier {
  final GetPhotoByIdUseCase _getPhotoByIdUseCase;

  DetailViewModel({required GetPhotoByIdUseCase getPhotoByIdUseCase}) : _getPhotoByIdUseCase = getPhotoByIdUseCase;

  DetailState _state = const DetailState();
  DetailState get state => _state;

  final StreamController<UiEvent> _eventController = StreamController();
  Stream<UiEvent> get eventStream => _eventController.stream;

  Future<void> getPhotos(String id) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Photo>> photoListResult = await _getPhotoByIdUseCase.execute(id);
    photoListResult.when(
      success: (data) {
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