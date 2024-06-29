import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'screenshot_page_model.dart';
export 'screenshot_page_model.dart';

class ScreenshotPageWidget extends StatefulWidget {
  const ScreenshotPageWidget({
    super.key,
    required this.screenshotPath,
  });

  final String? screenshotPath;

  @override
  State<ScreenshotPageWidget> createState() => _ScreenshotPageWidgetState();
}

class _ScreenshotPageWidgetState extends State<ScreenshotPageWidget> {
  late ScreenshotPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScreenshotPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('(L20)${widget.screenshotPath!}');
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          title: Text(
            'Screenshot',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child:



                InteractiveViewer(
                  child: Image.network(
                    widget.screenshotPath!,
                    height: 500, //_screenHeight! * 0.65,
                    width: 500, //_screenWidth! * 0.79,
                    loadingBuilder: (BuildContext? context, Widget? child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child!;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes !=
                              null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),




                /*Image.network(
                  widget.screenshotPath!,
                  width: 300.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),*/
              ),
            ],
          ),
        ),
      ),
    );
  }
}
