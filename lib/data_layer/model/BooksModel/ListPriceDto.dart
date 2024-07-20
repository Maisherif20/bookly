import '../../../domain_layer/Entities/BookModel/ListPrice.dart';
class ListPriceDto {
  ListPriceDto({
      this.amountInMicros, 
      this.currencyCode,});

  ListPriceDto.fromJson(dynamic json) {
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
  ListPrice toListPrice(){
    return ListPrice(
      amountInMicros: amountInMicros,
      currencyCode: currencyCode,
    );
  }

}