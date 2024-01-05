import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:orm_album_future_builder/api/album_api.dart';
import 'package:orm_album_future_builder/core/constants.dart';
import 'package:orm_album_future_builder/core/result.dart';
import 'package:orm_album_future_builder/dto/album_dto.dart';
import 'package:orm_album_future_builder/dto/photo_dto.dart';

class JsonPlaceholderAlbumApiImpl implements AlbumApi {
  @override
  Future<Result<List<AlbumDto>>> getAlbums() async {
    try {
      final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

      final list = jsonDecode(response.body) as List<dynamic>;

      return Result.success(list.map((e) => AlbumDto.fromJson(e)).toList());
    } catch (e) {
      return const Result.error(errNetwork);
    }
  }

  @override
  Future<Result<List<PhotoDto>>> getPhotos(String id) async {
    try {
      final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$id/photos'));

      final list = jsonDecode(response.body) as List<dynamic>;

      return Result.success(list.map((e) => PhotoDto.fromJson(e)).toList());
    } catch (e) {
      return const Result.error(errNetwork);
    }
  }
}
