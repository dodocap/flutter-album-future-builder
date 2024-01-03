import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'photo.freezed.dart';

part 'photo.g.dart';

@freezed
class Photo with _$Photo {
  const factory Photo({
    required int id,
    required String title,
    required String url,
    required String thumbnailUrl,
  }) = _Photo;

  factory Photo.fromJson(Map<String, Object?> json) => _$PhotoFromJson(json);
}