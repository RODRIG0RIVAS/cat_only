import 'dart:convert';

import '../../../domain/entities/cat_raw/cat_raw.dart';

class CatRawAdapter {
  static CatRaw fromMap(Map<String, dynamic> map) {
    return CatRaw(
      map['id'] ?? '',
      map['url'] ?? '',
      map['width'] ?? 0,
      map['height'] ?? 0,
    );
  }

  static CatRaw fromJson(String json) {
    return CatRawAdapter.fromMap(jsonDecode(json));
  }

  static Map<String, dynamic> toMap(CatRaw catRaw) {
    return {
      'id': catRaw.id,
      'url': catRaw.url,
      'width': catRaw.width,
      'height': catRaw.height,
    };
  }
}
