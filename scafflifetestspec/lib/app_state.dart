import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import '/backend/backend.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _parentTestRefGlobal = prefs.getString('ff_parentTestRefGlobal')?.ref ??
          _parentTestRefGlobal;
    });
    _safeInit(() {
      _parentTestNameGlobal =
          prefs.getString('ff_parentTestNameGlobal') ?? _parentTestNameGlobal;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _parentTestRefGlobal =
      FirebaseFirestore.instance.doc('/Tests/jyIo27zkPJLqvv0Kp5Qw');
  DocumentReference? get parentTestRefGlobal => _parentTestRefGlobal;
  set parentTestRefGlobal(DocumentReference? value) {
    _parentTestRefGlobal = value;
    value != null
        ? prefs.setString('ff_parentTestRefGlobal', value.path)
        : prefs.remove('ff_parentTestRefGlobal');
  }

  String _parentTestNameGlobal = 'golly';
  String get parentTestNameGlobal => _parentTestNameGlobal;
  set parentTestNameGlobal(String value) {
    _parentTestNameGlobal = value;
    prefs.setString('ff_parentTestNameGlobal', value);
  }

  double _nextTestStepIndex = 1.0;
  double get nextTestStepIndex => _nextTestStepIndex;
  set nextTestStepIndex(double value) {
    _nextTestStepIndex = value;
  }
}


List<TestsRecord> parentTestsListGlobal = [];
/*// FirebaseFirestore.instance.doc('/Tests/jyIo27zkPJLqvv0Kp5Qw');
List<DocumentReference?> get parentTestsListGlobal => _parentTestsListGlobal;
set parentTestsListGlobal(DocumentReference? value) {
  _parentTestRefGlobal = value;
  value != null
      ? prefs.setString('ff_parentTestRefGlobal', value.path)
      : prefs.remove('ff_parentTestRefGlobal');
}*/





void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
const double kButtonHeight = 25;

RunsRecord? testRunGlobal;
List<String>? passFailsGlobal;
List<String>? notesParamGlobal;
DocumentReference? testParentRefGlobal;
