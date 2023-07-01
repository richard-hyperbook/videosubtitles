import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _introductionHyperbook =
          prefs.getString('ff_introductionHyperbook')?.ref ??
              _introductionHyperbook;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _currentHyperbook;
  DocumentReference? get currentHyperbook => _currentHyperbook;
  set currentHyperbook(DocumentReference? _value) {
    _currentHyperbook = _value;
  }

  String _currentHyperbookTitle = 'DummyTitle';
  String get currentHyperbookTitle => _currentHyperbookTitle;
  set currentHyperbookTitle(String _value) {
    _currentHyperbookTitle = _value;
  }

  List<Color> _chosenColors = [];
  List<Color> get chosenColors => _chosenColors;
  set chosenColors(List<Color> _value) {
    _chosenColors = _value;
  }

  void addToChosenColors(Color _value) {
    _chosenColors.add(_value);
  }

  void removeFromChosenColors(Color _value) {
    _chosenColors.remove(_value);
  }

  void removeAtIndexFromChosenColors(int _index) {
    _chosenColors.removeAt(_index);
  }

  void updateChosenColorsAtIndex(
    int _index,
    Color Function(Color) updateFn,
  ) {
    _chosenColors[_index] = updateFn(_chosenColors[_index]);
  }

  int _currentChapterStateIndex = 0;
  int get currentChapterStateIndex => _currentChapterStateIndex;
  set currentChapterStateIndex(int _value) {
    _currentChapterStateIndex = _value;
  }

  String _currentChapterTitle = 'Unknown';
  String get currentChapterTitle => _currentChapterTitle;
  set currentChapterTitle(String _value) {
    _currentChapterTitle = _value;
  }

  String _currentBody = '';
  String get currentBody => _currentBody;
  set currentBody(String _value) {
    _currentBody = _value;
  }

  List<int> _chaptersReadState = [];
  List<int> get chaptersReadState => _chaptersReadState;
  set chaptersReadState(List<int> _value) {
    _chaptersReadState = _value;
  }

  void addToChaptersReadState(int _value) {
    _chaptersReadState.add(_value);
  }

  void removeFromChaptersReadState(int _value) {
    _chaptersReadState.remove(_value);
  }

  void removeAtIndexFromChaptersReadState(int _index) {
    _chaptersReadState.removeAt(_index);
  }

  void updateChaptersReadStateAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _chaptersReadState[_index] = updateFn(_chaptersReadState[_index]);
  }

  List<DocumentReference> _chaptersRead = [];
  List<DocumentReference> get chaptersRead => _chaptersRead;
  set chaptersRead(List<DocumentReference> _value) {
    _chaptersRead = _value;
  }

  void addToChaptersRead(DocumentReference _value) {
    _chaptersRead.add(_value);
  }

  void removeFromChaptersRead(DocumentReference _value) {
    _chaptersRead.remove(_value);
  }

  void removeAtIndexFromChaptersRead(int _index) {
    _chaptersRead.removeAt(_index);
  }

  void updateChaptersReadAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _chaptersRead[_index] = updateFn(_chaptersRead[_index]);
  }

  List<Color> _chaptersReadStateColors = [];
  List<Color> get chaptersReadStateColors => _chaptersReadStateColors;
  set chaptersReadStateColors(List<Color> _value) {
    _chaptersReadStateColors = _value;
  }

  void addToChaptersReadStateColors(Color _value) {
    _chaptersReadStateColors.add(_value);
  }

  void removeFromChaptersReadStateColors(Color _value) {
    _chaptersReadStateColors.remove(_value);
  }

  void removeAtIndexFromChaptersReadStateColors(int _index) {
    _chaptersReadStateColors.removeAt(_index);
  }

  void updateChaptersReadStateColorsAtIndex(
    int _index,
    Color Function(Color) updateFn,
  ) {
    _chaptersReadStateColors[_index] =
        updateFn(_chaptersReadStateColors[_index]);
  }

  List<DocumentReference> _chaptersReadReferences = [];
  List<DocumentReference> get chaptersReadReferences => _chaptersReadReferences;
  set chaptersReadReferences(List<DocumentReference> _value) {
    _chaptersReadReferences = _value;
  }

  void addToChaptersReadReferences(DocumentReference _value) {
    _chaptersReadReferences.add(_value);
  }

  void removeFromChaptersReadReferences(DocumentReference _value) {
    _chaptersReadReferences.remove(_value);
  }

  void removeAtIndexFromChaptersReadReferences(int _index) {
    _chaptersReadReferences.removeAt(_index);
  }

  void updateChaptersReadReferencesAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _chaptersReadReferences[_index] = updateFn(_chaptersReadReferences[_index]);
  }

  DocumentReference? _chosenModerator;
  DocumentReference? get chosenModerator => _chosenModerator;
  set chosenModerator(DocumentReference? _value) {
    _chosenModerator = _value;
  }

  DocumentReference? _currentChapter;
  DocumentReference? get currentChapter => _currentChapter;
  set currentChapter(DocumentReference? _value) {
    _currentChapter = _value;
  }

  bool _filterByModerator = false;
  bool get filterByModerator => _filterByModerator;
  set filterByModerator(bool _value) {
    _filterByModerator = _value;
  }

  DocumentReference? _introductionHyperbook;
  DocumentReference? get introductionHyperbook => _introductionHyperbook;
  set introductionHyperbook(DocumentReference? _value) {
    _introductionHyperbook = _value;
    _value != null
        ? prefs.setString('ff_introductionHyperbook', _value.path)
        : prefs.remove('ff_introductionHyperbook');
  }

  bool _canReadCurrentHyperbook = false;
  bool get canReadCurrentHyperbook => _canReadCurrentHyperbook;
  set canReadCurrentHyperbook(bool _value) {
    _canReadCurrentHyperbook = _value;
  }

  bool _canEditCurrentHyperbook = false;
  bool get canEditCurrentHyperbook => _canEditCurrentHyperbook;
  set canEditCurrentHyperbook(bool _value) {
    _canEditCurrentHyperbook = _value;
  }

  List<bool> _canRead = [];
  List<bool> get canRead => _canRead;
  set canRead(List<bool> _value) {
    _canRead = _value;
  }

  void addToCanRead(bool _value) {
    _canRead.add(_value);
  }

  void removeFromCanRead(bool _value) {
    _canRead.remove(_value);
  }

  void removeAtIndexFromCanRead(int _index) {
    _canRead.removeAt(_index);
  }

  void updateCanReadAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _canRead[_index] = updateFn(_canRead[_index]);
  }

  List<bool> _canEdit = [];
  List<bool> get canEdit => _canEdit;
  set canEdit(List<bool> _value) {
    _canEdit = _value;
  }

  void addToCanEdit(bool _value) {
    _canEdit.add(_value);
  }

  void removeFromCanEdit(bool _value) {
    _canEdit.remove(_value);
  }

  void removeAtIndexFromCanEdit(int _index) {
    _canEdit.removeAt(_index);
  }

  void updateCanEditAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _canEdit[_index] = updateFn(_canEdit[_index]);
  }

  bool _canReadThisHyperbook = false;
  bool get canReadThisHyperbook => _canReadThisHyperbook;
  set canReadThisHyperbook(bool _value) {
    _canReadThisHyperbook = _value;
  }

  bool _canCollaborateThisHyperbook = false;
  bool get canCollaborateThisHyperbook => _canCollaborateThisHyperbook;
  set canCollaborateThisHyperbook(bool _value) {
    _canCollaborateThisHyperbook = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

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

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
