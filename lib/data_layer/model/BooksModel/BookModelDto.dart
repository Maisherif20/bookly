import 'package:bookly/domain_layer/Entities/BookModel/BookModel.dart';

import 'ItemsDto.dart';

class BookModelDto {
  BookModelDto({
      this.kind, 
      this.statusMsg,
      this.message,
      this.totalItems,
      this.items,});

  BookModelDto.fromJson(dynamic json) {
    kind = json['kind'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    totalItems = json['totalItems'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(ItemsDto.fromJson(v));
      });
    }
  }
  String? kind;
  String? statusMsg;
  String? message;
  num? totalItems;
  List<ItemsDto>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = kind;
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    map['totalItems'] = totalItems;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
  BookModel toBookModel(){
    return BookModel(
      kind: kind,
      totalItems: totalItems,
      items: items?.map((e) => e.toItems()).toList(),
    );
  }

}