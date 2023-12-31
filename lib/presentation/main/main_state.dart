import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orm_album_future_builder/domain/model/album.dart';

part 'main_state.freezed.dart';
part 'main_state.g.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(false) isLoading,
    @Default([]) List<Album> albumList,
  }) = _MainState;

  factory MainState.fromJson(Map<String, Object?> json) => _$MainStateFromJson(json);
}