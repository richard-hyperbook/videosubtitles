// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';
import 'package:flutter/material.dart';

class IconButtonTooltipMap extends StatefulWidget {
  const IconButtonTooltipMap(
      {Key? key,
      this.width,
      this.height,
      this.currentHyperbook,
      this.tooltipMessage,
      tttt})
      : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference? currentHyperbook;
  final String? tooltipMessage;

  @override
  _IconButtonTooltipMapState createState() => _IconButtonTooltipMapState();
}

class _IconButtonTooltipMapState extends State<IconButtonTooltipMap> {
  @override
  Widget build(BuildContext context) {
    print('(D28)');
    String? message = widget.tooltipMessage;
    if (message == null) {
      message = 'XXX';
    }
    return Tooltip(
        message: message,
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          // borderRadius: 30,
          borderWidth: 1,
          buttonSize: 30,
          icon: FaIcon(
            FontAwesomeIcons.networkWired,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () async {
            setState(
                () => FFAppState().currentHyperbook = widget.currentHyperbook);
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'map_display'),
              ),
            );
          },
        ));
  }
}
