import 'package:cached_network_image/cached_network_image.dart';
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
      onTap: () {
        onPhotoPressed(_photo.title, _photo.url);
      },
      child: CachedNetworkImage(
        imageUrl: _photo.thumbnailUrl,
      ),
    );
  }
}
