import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orm_album_future_builder/model/album.dart';
import 'package:orm_album_future_builder/ui/main/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('앨범 리스트'),
        actions: [
          IconButton(
            onPressed: viewModel.getAlbums,
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: state.albumList.length,
              itemBuilder: (context, index) {
                final Album album = state.albumList[index];
                return ListTile(
                  title: Text(album.title),
                  onTap: () => context.push(Uri(
                    path: '/detail',
                    queryParameters: {'id': album.id.toString(), 'title': album.title},
                  ).toString()),
                  trailing: const Icon(Icons.navigate_next),
                );
              },
            ),
    );
  }
}
