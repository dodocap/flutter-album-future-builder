import 'dart:async';
import 'package:orm_album_future_builder/model/album.dart';
import 'package:orm_album_future_builder/repository/album_repository.dart';
import 'package:orm_album_future_builder/repository/album_repository_impl.dart';

class MainViewModel {
  final AlbumRepository _albumRepository = AlbumRepositoryImpl();

  List<Album> _albumList = [];
  List<Album> get albumList => List.unmodifiable(_albumList);

  final StreamController<bool> _isLoading = StreamController();
  Stream<bool> get isLoading => _isLoading.stream;

  Future<void> getAlbums() async {
    _isLoading.add(true);

    _albumList = await _albumRepository.getAlbums();
    _albumList.removeWhere((element) => element.id == -1);

    _isLoading.add(false);
  }
}
