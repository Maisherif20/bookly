import '../../../domain_layer/Entities/BookModel/IndustryIdentifiers.dart';

class IndustryIdentifiersDto {
  IndustryIdentifiersDto({
      this.type, 
      this.identifier,});

  IndustryIdentifiersDto.fromJson(dynamic json) {
    type = json['type'];
    identifier = json['identifier'];
  }
  String? type;
  String? identifier;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['identifier'] = identifier;
    return map;
  }

  IndustryIdentifiers toIndustryIdentifiers(){
    return IndustryIdentifiers(
      type: type,
      identifier: identifier,
    );
  }
}