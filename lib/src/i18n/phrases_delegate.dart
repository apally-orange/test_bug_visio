// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'locales/phrases_en.dart' deferred as phrases_en;
import 'locales/phrases_fr.dart' deferred as phrases_fr;
import 'phrases.dart';

class _Loader {
  const _Loader({
    this.loadLibrary,
    this.loadPhrases,
  });

  final Future<dynamic> Function() loadLibrary;
  final Phrases Function() loadPhrases;
}

final Map<String, _Loader> _loaders = {
  'en': _Loader(
    loadLibrary: phrases_en.loadLibrary,
    loadPhrases: () => phrases_en.Phrases(),
  ),
  'fr': _Loader(
    loadLibrary: phrases_fr.loadLibrary,
    loadPhrases: () => phrases_fr.Phrases(),
  ),
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
  Future<Phrases> load(Locale locale) async {
    final String name =
        (locale.countryCode == null || locale.countryCode.isEmpty)
            ? locale.languageCode
            : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    final String availableLocale = Intl.verifiedLocale(
      localeName,
      (locale) => _loaders[locale] != null,
      onFailure: (_) => null,
    );

    if (availableLocale != null) {
      final _Loader loader = _loaders[availableLocale];
      if (loader != null) {
        await loader.loadLibrary();

        // Force the locale in Intl.
        Intl.defaultLocale = localeName;
        await initializeDateFormatting(localeName);

        return loader.loadPhrases();
      }
    }

    return null;
  }

  @override
  bool shouldReload(LocalizationsDelegate old) {
    return false;
  }

  static Phrases of(BuildContext context) {
    return Localizations.of<Phrases>(context, Phrases);
  }
}

extension BuildContextExtensions on BuildContext {
  Phrases get phrases => PhrasesDelegate.of(this);
}
