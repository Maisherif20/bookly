import 'package:bookly/domain_layer/Entities/BookModel/AccessInfo.dart';

import 'EpubDto.dart';
import 'PdfDto.dart';

class AccessInfoDto {
  AccessInfoDto({
      this.country, 
      this.viewability, 
      this.embeddable, 
      this.publicDomain, 
      this.textToSpeechPermission, 
      this.epub, 
      this.pdf, 
      this.webReaderLink, 
      this.accessViewStatus, 
      this.quoteSharingAllowed,});

  AccessInfoDto.fromJson(dynamic json) {
    country = json['country'];
    viewability = json['viewability'];
    embeddable = json['embeddable'];
    publicDomain = json['publicDomain'];
    textToSpeechPermission = json['textToSpeechPermission'];
    epub = json['epub'] != null ? EpubDto.fromJson(json['epub']) : null;
    pdf = json['pdf'] != null ? PdfDto.fromJson(json['pdf']) : null;
    webReaderLink = json['webReaderLink'];
    accessViewStatus = json['accessViewStatus'];
    quoteSharingAllowed = json['quoteSharingAllowed'];
  }
  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  EpubDto? epub;
  PdfDto? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['viewability'] = viewability;
    map['embeddable'] = embeddable;
    map['publicDomain'] = publicDomain;
    map['textToSpeechPermission'] = textToSpeechPermission;
    if (epub != null) {
      map['epub'] = epub?.toJson();
    }
    if (pdf != null) {
      map['pdf'] = pdf?.toJson();
    }
    map['webReaderLink'] = webReaderLink;
    map['accessViewStatus'] = accessViewStatus;
    map['quoteSharingAllowed'] = quoteSharingAllowed;
    return map;
  }
  AccessInfo toAccessInfo(){
    return AccessInfo(
      country: country,
      viewability: viewability,
      embeddable: embeddable,
      publicDomain: publicDomain,
      textToSpeechPermission: textToSpeechPermission,
      epub: epub?.toEpub(),
      pdf: pdf?.toPdf(),
      webReaderLink: webReaderLink,
      accessViewStatus: accessViewStatus,
      quoteSharingAllowed: quoteSharingAllowed,
    );
  }
}