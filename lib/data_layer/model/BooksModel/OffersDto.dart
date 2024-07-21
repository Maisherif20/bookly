import 'package:bookly/domain_layer/Entities/BookModel/Offers.dart';

// import 'ListPriceDto.dart';
import 'RetailPriceDto.dart';

class OffersDto {
  OffersDto({
      this.finskyOfferType, 
      // this.listPrice,
      this.retailPrice, 
      this.giftable,});

  OffersDto.fromJson(dynamic json) {
    finskyOfferType = json['finskyOfferType'];
    // listPrice = json['listPrice'];
    retailPrice = json['retailPrice'] != null ? RetailPriceDto.fromJson(json['retailPrice']) : null;
    giftable = json['giftable'];
  }
  num? finskyOfferType;
  // ListPriceDto? listPrice;
  RetailPriceDto? retailPrice;
  bool? giftable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['finskyOfferType'] = finskyOfferType;
    // map['listPrice'] = listPrice;
    if (retailPrice != null) {
      map['retailPrice'] = retailPrice?.toJson();
    }
    map['giftable'] = giftable;
    return map;
  }
  Offers toOffers(){
    return Offers(
      finskyOfferType: finskyOfferType,
      // listPrice: listPrice?.toListPrice(),
      retailPrice: retailPrice?.toRetailPrice(),
      giftable: giftable,
    );
  }

}