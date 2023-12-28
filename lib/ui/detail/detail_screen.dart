import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orm_album_future_builder/model/photo.dart';
import 'package:orm_album_future_builder/repository/album_repository.dart';
import 'package:orm_album_future_builder/repository/album_repository_impl.dart';
import 'package:orm_album_future_builder/ui/detail/detail_view_model.dart';

class DetailScreen extends StatelessWidget {
  final String _id;
  final String _title;
  final AlbumRepository albumRepository = AlbumRepositoryImpl();

  DetailScreen({
    super.key,
    required String id,
    required String title,
  })  : _id = id,
        _title = title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: albumRepository.getPhotos(_id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final List<Photo> photoList = (snapshot.data!)..removeWhere((element) => element.id == -1);
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
                return DetailViewModel(
                  photo: photo,
                  onPhotoPressed: (title, url) {
                    context.push(
                      Uri(
                        path: '/detail/photo',
                        queryParameters: {
                          'title': title,
                          'url': url
                        },
                      ).toString()
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
