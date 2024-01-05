import 'package:orm_album_future_builder/data/dto/photo_dto.dart';
import 'package:orm_album_future_builder/domain/model/photo.dart';

extension PhotoDtoToModel on PhotoDto {
  Photo mapper() {
    return Photo(
      id: id?.toInt() ?? -1,
      title: title ?? '제목없음',
      url: url ?? '',
      thumbnailUrl: thumbnailUrl ?? '',
    );
  }
}
