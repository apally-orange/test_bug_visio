import 'package:flutter/foundation.dart';
import 'package:test_bug_visio/src/data/entities/poi.dart';

class SearchPoisNotifier extends ChangeNotifier {
  List<Poi> get pois => _pois;
  List<Poi> _pois;
  set pois(List<Poi> value) {
    if (_pois != value) {
      _pois = value;
      init();
    }
  }

  List<Poi> get resultPois => _resultPois;
  List<Poi> _resultPois;
  @protected
  set resultPois(List<Poi> value) {
    if (_resultPois != value) {
      _resultPois = value;
      notifyListeners();
    }
  }

  void init() {
    resultPois = pois;
  }

  void search(String query) {
    if (query == null || query.isEmpty) {
      init();
    } else {
      resultPois = pois
          ?.where(
            (element) => element?.title?.toLowerCase()?.contains(
                  query.toLowerCase(),
                ),
          )
          ?.toList();
    }
  }
}
