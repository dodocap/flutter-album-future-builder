import 'package:orm_album_future_builder/data/dto/album_dto.dart';
import 'package:orm_album_future_builder/domain/model/album.dart';

extension AlbumDtoToModel on AlbumDto {
  Album mapper() {
    return Album(
      id: id?.toInt() ?? -1,
      title: title ?? ''
    );
  }
}