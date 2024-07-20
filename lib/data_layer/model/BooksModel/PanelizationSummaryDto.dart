import '../../../domain_layer/Entities/BookModel/PanelizationSummary.dart';

class PanelizationSummaryDto {
  PanelizationSummaryDto({
    this.containsEpubBubbles,
    this.containsImageBubbles,
    this.epubBubbleVersion,
    this.imageBubbleVersion,
  });

  PanelizationSummaryDto.fromJson(dynamic json) {
    containsEpubBubbles = json['containsEpubBubbles'];
    containsImageBubbles = json['containsImageBubbles'];
    epubBubbleVersion = json['epubBubbleVersion'];
    imageBubbleVersion = json['imageBubbleVersion'];
  }
  bool? containsEpubBubbles;
  bool? containsImageBubbles;
  String? epubBubbleVersion;
  String? imageBubbleVersion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['containsEpubBubbles'] = containsEpubBubbles;
    map['containsImageBubbles'] = containsImageBubbles;
    map['epubBubbleVersion'] = epubBubbleVersion;
    map['imageBubbleVersion'] = imageBubbleVersion;
    return map;
  }

  PanelizationSummary toPanelizationSummary() {
    return PanelizationSummary(
      containsEpubBubbles: containsEpubBubbles,
      containsImageBubbles: containsEpubBubbles,
      epubBubbleVersion: epubBubbleVersion,
      imageBubbleVersion: imageBubbleVersion,
    );
  }
}
