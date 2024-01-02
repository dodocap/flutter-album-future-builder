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
    return Scaffold(
      appBar: AppBar(
        title: const Text('앨범 리스트'),
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: viewModel.albumList.length,
              itemBuilder: (context, index) {
                final Album album = viewModel.albumList[index];
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
