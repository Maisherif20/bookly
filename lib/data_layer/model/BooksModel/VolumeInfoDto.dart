import 'package:bookly/domain_layer/Entities/BookModel/VolumeInfo.dart';
import 'IndustryIdentifiersDto.dart';
import 'ReadingModesDto.dart';
import 'PanelizationSummaryDto.dart';
import 'ImageLinksDto.dart';

class VolumeInfoDto {
  VolumeInfoDto({
      this.title, 
      this.authors, 
      this.publisher, 
      this.publishedDate, 
      this.description, 
      this.industryIdentifiers, 
      this.readingModes, 
      this.pageCount, 
      this.printType, 
      this.categories, 
      this.averageRating, 
      this.ratingsCount, 
      this.maturityRating, 
      this.allowAnonLogging, 
      this.contentVersion, 
      this.panelizationSummary, 
      this.imageLinks, 
      this.language, 
      this.previewLink, 
      this.infoLink, 
      this.canonicalVolumeLink,});

  VolumeInfoDto.fromJson(dynamic json) {
    title = json['title'];
    authors = json['authors'] != null ? json['authors'].cast<String>() : [];
    publisher = json['publisher'];
    publishedDate = json['publishedDate'];
    description = json['description'];
    if (json['industryIdentifiers'] != null) {
      industryIdentifiers = [];
      json['industryIdentifiers'].forEach((v) {
        industryIdentifiers?.add(IndustryIdentifiersDto.fromJson(v));
      });
    }
    readingModes = json['readingModes'] != null ? ReadingModesDto.fromJson(json['readingModes']) : null;
    pageCount = json['pageCount'];
    printType = json['printType'];
    categories = json['categories'] != null ? json['categories'].cast<String>() : [];
    averageRating = json['averageRating'];
    ratingsCount = json['ratingsCount'];
    maturityRating = json['maturityRating'];
    allowAnonLogging = json['allowAnonLogging'];
    contentVersion = json['contentVersion'];
    panelizationSummary = json['panelizationSummary'] != null ? PanelizationSummaryDto.fromJson(json['panelizationSummary']) : null;
    imageLinks = json['imageLinks'] != null ? ImageLinksDto.fromJson(json['imageLinks']) : null;
    language = json['language'];
    previewLink = json['previewLink'];
    infoLink = json['infoLink'];
    canonicalVolumeLink = json['canonicalVolumeLink'];
  }
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifiersDto>? industryIdentifiers;
  ReadingModesDto? readingModes;
  num? pageCount;
  String? printType;
  List<String>? categories;
  num? averageRating;
  num? ratingsCount;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummaryDto? panelizationSummary;
  ImageLinksDto? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['authors'] = authors;
    map['publisher'] = publisher;
    map['publishedDate'] = publishedDate;
    map['description'] = description;
    if (industryIdentifiers != null) {
      map['industryIdentifiers'] = industryIdentifiers?.map((v) => v.toJson()).toList();
    }
    if (readingModes != null) {
      map['readingModes'] = readingModes?.toJson();
    }
    map['pageCount'] = pageCount;
    map['printType'] = printType;
    map['categories'] = categories;
    map['averageRating'] = averageRating;
    map['ratingsCount'] = ratingsCount;
    map['maturityRating'] = maturityRating;
    map['allowAnonLogging'] = allowAnonLogging;
    map['contentVersion'] = contentVersion;
    if (panelizationSummary != null) {
      map['panelizationSummary'] = panelizationSummary?.toJson();
    }
    if (imageLinks != null) {
      map['imageLinks'] = imageLinks?.toJson();
    }
    map['language'] = language;
    map['previewLink'] = previewLink;
    map['infoLink'] = infoLink;
    map['canonicalVolumeLink'] = canonicalVolumeLink;
    return map;
  }
  VolumeInfo toVolumeInfo(){
    return VolumeInfo(
      title: title,
      authors: authors,
      publisher: publisher,
      publishedDate: publishedDate,
      description: description,
      industryIdentifiers:industryIdentifiers?.map((e) => e.toIndustryIdentifiers()).toList() ,
      readingModes: readingModes?.toReadingModes(),
      pageCount: pageCount,
      printType: printType,
      categories: categories,
      allowAnonLogging: allowAnonLogging,
      averageRating: averageRating,
      ratingsCount: ratingsCount,
      maturityRating: maturityRating,
      contentVersion: contentVersion,
      canonicalVolumeLink: canonicalVolumeLink,
      panelizationSummary:panelizationSummary?.toPanelizationSummary() ,
      imageLinks:imageLinks?.toImageLinks() ,
      language: language,
      previewLink: previewLink,
      infoLink: infoLink,
    );
  }

}