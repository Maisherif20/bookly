import '../../../domain_layer/Entities/BookModel/SaleInfo.dart';
// import 'ListPriceDto.dart';
import 'RetailPriceDto.dart';
import 'OffersDto.dart';

class SaleInfoDto {
  SaleInfoDto({
      this.country, 
      this.saleability, 
      this.isEbook, 
      // this.listPrice,
      this.retailPrice, 
      this.buyLink, 
      this.offers,});

  SaleInfoDto.fromJson(dynamic json) {
    country = json['country'];
    saleability = json['saleability'];
    isEbook = json['isEbook'];
    // listPrice = json['listPrice'];
    retailPrice = json['retailPrice'] != null ? RetailPriceDto.fromJson(json['retailPrice']) : null;
    buyLink = json['buyLink'];
    if (json['offers'] != null) {
      offers = [];
      json['offers'].forEach((v) {
        offers?.add(OffersDto.fromJson(v));
      });
    }
  }
  String? country;
  String? saleability;
  bool? isEbook;
  // ListPriceDto? listPrice;
  RetailPriceDto? retailPrice;
  String? buyLink;
  List<OffersDto>? offers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['saleability'] = saleability;
    map['isEbook'] = isEbook;
    // map['listPrice'] = listPrice;
    if (retailPrice != null) {
      map['retailPrice'] = retailPrice?.toJson();
    }
    map['buyLink'] = buyLink;
    if (offers != null) {
      map['offers'] = offers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
  SaleInfo toSaleInfo(){
    return SaleInfo(
      country:country,
      saleability: saleability,
      isEbook: isEbook,
      // listPrice: listPrice?.toListPrice(),
      retailPrice: retailPrice?.toRetailPrice(),
      offers: offers?.map((e) => e.toOffers()).toList(),
    );
  }

}