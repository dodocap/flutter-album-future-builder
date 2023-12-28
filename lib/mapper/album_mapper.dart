import 'package:orm_album_future_builder/dto/album_dto.dart';
import 'package:orm_album_future_builder/model/album.dart';

extension AlbumDtoToModel on AlbumDto {
  Album mapper() {
    return Album(
      id: userId?.toInt() ?? -1,
      title: title ?? ''
    );
  }
}