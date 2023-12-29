import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orm_album_future_builder/model/album.dart';
import 'package:orm_album_future_builder/ui/main/main_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainViewModel _mainViewModel = MainViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('앨범 리스트'),
      ),
      body: FutureBuilder<List<Album>>(
        future: _mainViewModel.getAlbums(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final List<Album> albumList = snapshot.data!;
          return ListView.builder(
            itemCount: albumList.length,
            itemBuilder: (context, index) {
              final Album album = albumList[index];
              return ListTile(
                title: Text(album.title),
                onTap: () => context.push(Uri(
                  path: '/detail',
                  queryParameters: {
                    'id': album.id.toString(),
                    'title': album.title
                  },
                ).toString()),
                trailing: const Icon(Icons.navigate_next),
              );
            },
          );
        },
      ),
    );
  }
}
