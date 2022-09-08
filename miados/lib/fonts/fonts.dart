enum FontKey { kleeOne }

extension RawFontKey on FontKey {
  String get rawFamily {
    switch (this) {
      case FontKey.kleeOne:
        return 'KleeOne';
    }
  }
}

final kleeOne = FontKey.kleeOne.rawFamily;
