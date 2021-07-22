import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bug_visio/src/data/entities/poi.dart';
import 'package:test_bug_visio/src/map_service.dart';
import 'package:test_bug_visio/src/modules/android_view/notifier.dart';

class PoiListView extends StatelessWidget {
  const PoiListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pois =
        context.select<SearchPoisNotifier, List<Poi>>((n) => n.resultPois);
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.only(top: 100),
      child: pois == null || pois.isEmpty
          ? const SizedBox()
          : ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: pois.length,
              itemBuilder: (context, index) {
                return _PoiListTile(
                  poi: pois[index],
                  isFirstTile: index == 0,
                );
              },
            ),
    );
  }
}

class _PoiListTile extends StatelessWidget {
  const _PoiListTile({
    @required this.poi,
    @required this.isFirstTile,
    Key key,
  })  : assert(poi != null),
        super(key: key);

  final Poi poi;
  final bool isFirstTile;

  @override
  Widget build(BuildContext context) {
    final categoryImageUrl = poi?.categories?.firstOrNull?.icon?.contentUrl;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: isFirstTile ? BorderSide(color: Colors.grey) : BorderSide.none,
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        title: Text(
          poi.title,
        ),
        leading: (categoryImageUrl != null)
            ? Image.network(
                categoryImageUrl,
                width: 42,
                height: 42,
              )
            : const SizedBox(),
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          context.read<MapService>().focusOnPlace(poi.location);
        },
      ),
    );
  }
}
