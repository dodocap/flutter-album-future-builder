import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orm_album_future_builder/domain/model/photo.dart';

part 'detail_state.freezed.dart';
part 'detail_state.g.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState({
    @Default(false) isLoading,
    @Default([]) List<Photo> photoList,
  }) = _DetailState;

  factory DetailState.fromJson(Map<String, Object?> json) => _$DetailStateFromJson(json);
}