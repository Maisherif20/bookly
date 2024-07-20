import '../../../domain_layer/Entities/BookModel/SearchInfo.dart';

class SearchInfoDto {
  SearchInfoDto({
      this.textSnippet,});

  SearchInfoDto.fromJson(dynamic json) {
    textSnippet = json['textSnippet'];
  }
  String? textSnippet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textSnippet'] = textSnippet;
    return map;
  }
  SearchInfo toSearchInfo(){
    return SearchInfo(
      textSnippet: textSnippet,
    );
  }

}