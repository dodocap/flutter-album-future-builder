import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orm_album_future_builder/model/album.dart';
import 'package:orm_album_future_builder/repository/album_repository.dart';
import 'package:orm_album_future_builder/repository/album_repository_impl.dart';

class MainScreen extends StatelessWidget {
  final AlbumRepository albumRepository = AlbumRepositoryImpl();

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('앨범 리스트'),
      ),
      body: FutureBuilder<List<Album>>(
        future: albumRepository.getAlbums(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final List<Album> albumList = (snapshot.data!)..removeWhere((element) => element.id == -1);
          return ListView.builder(
            itemCount: albumList.length,
            itemBuilder: (context, index) {
              final Album album = albumList[index];
              return ListTile(
                title: Text(album.title),
                onTap: () {
                  context.push(
                    Uri(
                      path: '/detail',
                      queryParameters: { 'id' : album.id.toString() }
                    ).toString()
                  );
                },
                trailing: const Icon(Icons.navigate_next),
              );
            },
          );
        },
      ),
    );
  }
}
