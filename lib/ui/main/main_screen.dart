import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orm_album_future_builder/core/ui_event.dart';
import 'package:orm_album_future_builder/model/album.dart';
import 'package:orm_album_future_builder/ui/main/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  StreamSubscription? _uiEventSubscription;

  @override
  void initState() {
    Future.microtask(() {
      final viewModel = context.read<MainViewModel>();
      _uiEventSubscription = viewModel.eventStream.listen((event) {
        switch (event) {
          case ShowSnackBar():
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(event.msg)));
        }
      });
      viewModel.getAlbums();
    });
    super.initState();
  }

  @override
  void dispose() {
    _uiEventSubscription?.cancel();
    super.dispose();
  }

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
