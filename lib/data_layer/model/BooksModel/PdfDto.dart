import '../../../domain_layer/Entities/BookModel/Pdf.dart';

class PdfDto {
  PdfDto({
      this.isAvailable, 
      this.acsTokenLink,});

  PdfDto.fromJson(dynamic json) {
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
  Pdf toPdf(){
    return Pdf(
      isAvailable: isAvailable,
      acsTokenLink: acsTokenLink,
    );
  }

}