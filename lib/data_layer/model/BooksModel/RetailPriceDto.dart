import '../../../domain_layer/Entities/BookModel/RetailPrice.dart';

class RetailPriceDto {
  RetailPriceDto({
      this.amountInMicros, 
      this.currencyCode,});

  RetailPriceDto.fromJson(dynamic json) {
    amountInMicros = json['amountInMicros'];
    currencyCode = json['currencyCode'];
  }
  num? amountInMicros;
  String? currencyCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amountInMicros'] = amountInMicros;
    map['currencyCode'] = currencyCode;
    return map;
  }
  RetailPrice toRetailPrice(){
    return RetailPrice(
      amountInMicros: amountInMicros,
      currencyCode: currencyCode,
    );
  }

}