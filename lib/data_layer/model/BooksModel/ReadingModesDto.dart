import 'package:bookly/domain_layer/Entities/BookModel/ReadingModes.dart';

class ReadingModesDto {
  ReadingModesDto({
      this.text, 
      this.image,});

  ReadingModesDto.fromJson(dynamic json) {
    text = json['text'];
    image = json['image'];
  }
  bool? text;
  bool? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['image'] = image;
    return map;
  }
  ReadingModes toReadingModes(){
    return ReadingModes(
      text: text,
      image: image,
    );
  }

}