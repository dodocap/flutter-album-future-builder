import 'package:flutter/material.dart';
import 'package:orm_album_future_builder/model/photo.dart';

class DetailViewModel extends StatelessWidget {
  final Photo _photo;
  final void Function(String title, String url) onPhotoPressed;

  const DetailViewModel({
    super.key,
    required this.onPhotoPressed,
    required Photo photo,
  }) : _photo = photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPhotoPressed(_photo.title, _photo.url),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          _photo.thumbnailUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Placeholder(child: Center(child: Text('이미지 로드 실패')),);
          },
        ),
      ),
    );
  }
}
