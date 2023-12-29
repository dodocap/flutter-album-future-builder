import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orm_album_future_builder/model/photo.dart';
import 'package:orm_album_future_builder/ui/detail/detail_view_model.dart';

class DetailScreen extends StatefulWidget {
  final String _id;
  final String _title;

  const DetailScreen({
    super.key,
    required String id,
    required String title,
  })  : _id = id,
        _title = title;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final DetailViewModel _detailViewModel = DetailViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: _detailViewModel.getPhotos(widget._id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final List<Photo> photoList = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              itemCount: photoList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 32,
                mainAxisSpacing: 32,
              ),
              itemBuilder: (context, index) {
                final Photo photo = photoList[index];
                return GestureDetector(
                  onTap: () {
                    context.push(Uri(
                      path: '/detail/photo',
                      queryParameters: {'title': photo.title, 'url': photo.url},
                    ).toString());
                  },
                  child: CachedNetworkImage(
                    imageUrl: photo.thumbnailUrl,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
