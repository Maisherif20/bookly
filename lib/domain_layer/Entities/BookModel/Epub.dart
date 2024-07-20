import 'package:bookly/domain_layer/Entities/BookModel/Epub.dart';

class Epub {
  Epub({
    this.isAvailable,
    this.acsTokenLink,});

  Epub.fromJson(dynamic json) {
    isAvailable = json['isAvailable'];
    acsTokenLink = json['acsTokenLink'];
  }
  bool? isAvailable;
  String? acsTokenLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAvailable'] = isAvailable;
    map['acsTokenLink'] = acsTokenLink;
    return map;
  }
  Epub toEpub(){
    return Epub(
        isAvailable: isAvailable,
        acsTokenLink:acsTokenLink
    );
  }

}