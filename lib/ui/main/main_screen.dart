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
  void initState() {
    _mainViewModel.getAlbums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('앨범 리스트'),
      ),
      body: StreamBuilder<bool>(
        initialData: false,
        stream: _mainViewModel.isLoading,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return const Center(child: CircularProgressIndicator());
          }
          final List<Album> albumList = _mainViewModel.albumList;
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
