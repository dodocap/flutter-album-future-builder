import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:orm_album_future_builder/api/album_api.dart';
import 'package:orm_album_future_builder/dto/album_dto.dart';
import 'package:orm_album_future_builder/dto/photo_dto.dart';

class JsonPlaceholderAlbumApiImpl implements AlbumApi {
  @override
  Future<List<AlbumDto>> getAlbums() async {
    final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    final list = jsonDecode(response.body) as List<dynamic>;

    return list.map((e) => AlbumDto.fromJson(e)).toList();
  }

  @override
  Future<List<PhotoDto>> getPhotos() async {
    final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    final list = jsonDecode(response.body) as List<dynamic>;

    return list.map((e) => PhotoDto.fromJson(e)).toList();
  }
}
