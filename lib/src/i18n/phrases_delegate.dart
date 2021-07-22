// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'locales/phrases_en.dart' as phrases_en;
import 'locales/phrases_fr.dart' as phrases_fr;
import 'phrases.dart';

final Map<String, Phrases> _phrasesMap = {
  'en': phrases_en.Phrases(),
  'fr': phrases_fr.Phrases(),
};

class PhrasesDelegate extends LocalizationsDelegate<Phrases> {
  const PhrasesDelegate();

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('fr'),
  ];

  @override
  bool isSupported(Locale locale) {
    return supportedLocales.contains(locale);
  }

  @override
  Future<Phrases> load(Locale locale) {
    final String? countryCode = locale.countryCode;
    final String name = (countryCode == null || countryCode.isEmpty)
        ? locale.languageCode
        : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    final String? availableLocale = Intl.verifiedLocale(
      localeName,
      (locale) => _phrasesMap[locale] != null,
      onFailure: (_) => null,
    );

    Phrases phrases;

    if (availableLocale != null) {
      // We already check that the loader for this locale exist
      phrases = _phrasesMap[availableLocale]!;
    } else {
      // We assume the user configure at list one local, if not the application can't run
      phrases = _phrasesMap[0]!;
    }

    // Force the locale in Intl.
    Intl.defaultLocale = localeName;

    return SynchronousFuture(phrases);
  }

  @override
  bool shouldReload(LocalizationsDelegate old) {
    return false;
  }

  static Phrases? of(BuildContext context) {
    return Localizations.of<Phrases>(context, Phrases);
  }
}
