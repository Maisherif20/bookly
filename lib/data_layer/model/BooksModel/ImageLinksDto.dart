import 'package:bookly/domain_layer/Entities/BookModel/ImageLinks.dart';

class ImageLinksDto {
  ImageLinksDto({
      this.smallThumbnail, 
      this.thumbnail,});

  ImageLinksDto.fromJson(dynamic json) {
    smallThumbnail = json['smallThumbnail'];
    thumbnail = json['thumbnail'];
  }
  String? smallThumbnail;
  String? thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['smallThumbnail'] = smallThumbnail;
    map['thumbnail'] = thumbnail;
    return map;
  }
  ImageLinks toImageLinks(){
    return ImageLinks(
      smallThumbnail: smallThumbnail,
      thumbnail: thumbnail,
    );
  }

}