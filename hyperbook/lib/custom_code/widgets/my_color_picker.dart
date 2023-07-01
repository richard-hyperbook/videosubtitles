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
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

const List<Icon> iconStates = [
  Icon(
    Icons.no_photography,
    color: Colors.black,
  ),
  Icon(
    Icons.photo_camera,
    color: Colors.black,
  ),
  Icon(
    Icons.battery_unknown,
    color: Colors.black,
  ),
  Icon(
    Icons.battery_full,
    color: Colors.black,
  ),
  Icon(
    Icons.highlight,
    color: Colors.black,
  ),
  Icon(
    Icons.delete_outlined,
    color: Colors.black,
  ),
  Icon(
    Icons.color_lens_rounded,
    color: Colors.black,
  ),
];

class MyColorPicker extends StatefulWidget {
  const MyColorPicker({
    Key? key,
    this.width,
    this.height,
    this.index,
    this.label,
    this.usersColorsInts,
    this.stateIndex,
    this.icon,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int? index;
  final String? label;
  final List<int>? usersColorsInts;
  final int? stateIndex;
  final Widget? icon;

  @override
  _MyColorPickerState createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  Color color = Colors.cyan;

  @override
  Widget build(BuildContext context) {
    print(
        '(D59)}${widget.index}*${widget.usersColorsInts}~${FFAppState().chosenColors}');
    if (FFAppState().chosenColors.length < 1) {
      for (int i = 0; i < widget.usersColorsInts!.length; i++) {
        FFAppState().chosenColors.add(Color(widget.usersColorsInts![i]));
      }
    }
    color = FFAppState().chosenColors[widget.index!];
    return ListTile(
      onTap: () => pickColor(context),
      // leading: Icon(
      // Icons.color_lens_rounded,
      // color: color,
      // ),
      leading: widget.icon!, //iconStates[widget.stateIndex!],
      title: Text(
        widget.label!,
        style: FlutterFlowTheme.of(context).title3.override(
              fontFamily: 'Lexend Deca',
              color: color,
            ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: color,
        size: 20,
      ),
      tileColor: const Color(0x00F5F5F5),
      dense: false,
    );
  }

  Widget buildColorPicker() => BlockPicker(
        //showLabel: true,
        pickerColor: color,
        onColorChanged: (color) => {
          setState(() {
            this.color = color;
            FFAppState().chosenColors[widget.index!] = color;
            print('(D45)${FFAppState().chosenColors.length}');
          })
        },
        //   showLabel: false,
      );

  void pickColor(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Colors'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildColorPicker(),
                TextButton(
                  child: const Text('Select', style: TextStyle(fontSize: 20)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ));
}
