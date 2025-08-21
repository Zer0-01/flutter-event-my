class LanguageCodeConstant {
  static const String en = 'en';
  static const String ms = 'ms';
}

class CountryCodeConstant {
  static const String uk = 'GB';
  static const String malaysia = 'MY';
}

enum EventCategoryEnum { wedding, birthday, sport, religious, corporate }

enum CountryEnum {
  malaysia(LanguageCodeConstant.ms, CountryCodeConstant.malaysia),
  uk(LanguageCodeConstant.en, CountryCodeConstant.uk);

  final String languageCode;
  final String countryCode;

  const CountryEnum(this.languageCode, this.countryCode);
}
