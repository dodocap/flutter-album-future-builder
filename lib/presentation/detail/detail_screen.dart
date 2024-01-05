import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orm_album_future_builder/core/ui_event.dart';
import 'package:orm_album_future_builder/domain/model/photo.dart';
import 'package:orm_album_future_builder/presentation/detail/detail_view_model.dart';
import 'package:provider/provider.dart';

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
  StreamSubscription? _uiEventSubscription;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final viewModel = context.read<DetailViewModel>();
      _uiEventSubscription = viewModel.eventStream.listen((event) {
        switch (event) {
          case ShowSnackBar():
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(event.msg)));
        }
      });
      viewModel.getPhotos(widget._id);
    });
  }

  @override
  void dispose() {
    _uiEventSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: state.photoList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                ),
                itemBuilder: (context, index) {
                  final Photo photo = state.photoList[index];
                  return GestureDetector(
                    onTap: () {
                      context.push(Uri(
                        path: '/detail/photo',
                        queryParameters: {'title': photo.title, 'url': photo.url},
                      ).toString());
                    },
                    child: CachedNetworkImage(
                      imageUrl: photo.thumbnailUrl,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
