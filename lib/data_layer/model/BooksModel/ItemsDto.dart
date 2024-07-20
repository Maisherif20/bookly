import 'package:bookly/domain_layer/Entities/BookModel/Items.dart';
import 'VolumeInfoDto.dart';
import 'SaleInfoDto.dart';
import 'AccessInfoDto.dart';
import 'SearchInfoDto.dart';

class ItemsDto {
  ItemsDto({
      this.kind, 
      this.id, 
      this.etag, 
      this.selfLink, 
      this.volumeInfo, 
      this.saleInfo, 
      this.accessInfo, 
      this.searchInfo,});

  ItemsDto.fromJson(dynamic json) {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    volumeInfo = json['volumeInfo'] != null ? VolumeInfoDto.fromJson(json['volumeInfo']) : null;
    saleInfo = json['saleInfo'] != null ? SaleInfoDto.fromJson(json['saleInfo']) : null;
    accessInfo = json['accessInfo'] != null ? AccessInfoDto.fromJson(json['accessInfo']) : null;
    searchInfo = json['searchInfo'] != null ? SearchInfoDto.fromJson(json['searchInfo']) : null;
  }
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfoDto? volumeInfo;
  SaleInfoDto? saleInfo;
  AccessInfoDto? accessInfo;
  SearchInfoDto? searchInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = kind;
    map['id'] = id;
    map['etag'] = etag;
    map['selfLink'] = selfLink;
    if (volumeInfo != null) {
      map['volumeInfo'] = volumeInfo?.toJson();
    }
    if (saleInfo != null) {
      map['saleInfo'] = saleInfo?.toJson();
    }
    if (accessInfo != null) {
      map['accessInfo'] = accessInfo?.toJson();
    }
    if (searchInfo != null) {
      map['searchInfo'] = searchInfo?.toJson();
    }
    return map;
  }
  Items toItems(){
    return Items(
      kind: kind,
      id: id,
      etag: etag,
      selfLink: selfLink,
      volumeInfo: volumeInfo?.toVolumeInfo(),
    );
  }

}