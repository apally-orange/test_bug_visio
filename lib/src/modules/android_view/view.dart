import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_bug_visio/src/core/widgets/poi_list.dart';
import 'package:test_bug_visio/src/core/widgets/search_bar.dart';
import 'package:test_bug_visio/src/data/entities/poi.dart';
import 'package:test_bug_visio/src/modules/android_view/notifier.dart';

class AndroidMapView extends StatelessWidget {
  const AndroidMapView({
    Key key,
    @required this.viewType,
    this.onPlatformViewCreated,
    this.creationParams,
    this.creationParamsCodec,
    this.pois,
  })  : assert(viewType != null),
        super(key: key);

  final String viewType;
  final PlatformViewCreatedCallback onPlatformViewCreated;
  final dynamic creationParams;
  final MessageCodec<dynamic> creationParamsCodec;
  final List<Poi> pois;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider0<SearchPoisNotifier>(
      create: (_) => SearchPoisNotifier(),
      update: (context, old) => old..pois = pois,
      child: _View(
        viewType: viewType,
        onPlatformViewCreated: onPlatformViewCreated,
        creationParams: creationParams,
        creationParamsCodec: creationParamsCodec,
      ),
    );
  }
}

class _View extends StatefulWidget {
  const _View({
    Key key,
    @required this.viewType,
    this.onPlatformViewCreated,
    this.creationParams,
    this.creationParamsCodec,
  })  : assert(viewType != null),
        super(key: key);

  final String viewType;
  final PlatformViewCreatedCallback onPlatformViewCreated;
  final dynamic creationParams;
  final MessageCodec<dynamic> creationParamsCodec;

  @override
  __ViewState createState() => __ViewState();
}

class __ViewState extends State<_View> {
  TextEditingController _controller;
  FocusNode _focusNode;

  bool listIsVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_onFocusChanged);
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _focusNode?.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    setState(() {
      listIsVisible = _focusNode.hasFocus;
      if (!listIsVisible) {
        _controller.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AndroidView(
          viewType: widget.viewType,
          onPlatformViewCreated: widget.onPlatformViewCreated,
          creationParams: widget.creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        ),
        // PlatformViewLink(
        //   viewType: widget.viewType,
        //   surfaceFactory: (
        //     BuildContext context,
        //     PlatformViewController controller,
        //   ) {
        //     widget.onPlatformViewCreated(controller.viewId);
        //     return AndroidViewSurface(
        //       controller: controller as AndroidViewController,
        //       gestureRecognizers: const <
        //           Factory<OneSequenceGestureRecognizer>>{},
        //       hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        //     );
        //   },
        //   onCreatePlatformView: (PlatformViewCreationParams params) {
        //     return PlatformViewsService.initSurfaceAndroidView(
        //       id: params.id,
        //       viewType: params.viewType,
        //       layoutDirection: TextDirection.ltr,
        //       creationParams: widget.creationParams,
        //       creationParamsCodec: const StandardMessageCodec(),
        //     )
        //       ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
        //       ..create();
        //   },
        // ),
        if (listIsVisible) const PoiListView(),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 5, right: 5),
            child: SearchBar(
              controller: _controller,
              focusNode: _focusNode,
              backIconShow: listIsVisible,
              onChanged: (query) {
                context.read<SearchPoisNotifier>().search(query);
              },
            ),
          ),
        ),
      ],
    );
  }
}
