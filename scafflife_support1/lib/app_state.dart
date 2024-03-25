import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
      _nextTicketNumber =
          prefs.getInt('ff_nextTicketNumber') ?? _nextTicketNumber;
    });
    _safeInit(() {
      _showOnlyCurrentIssues =
          prefs.getBool('ff_showOnlyCurrentIssues') ?? _showOnlyCurrentIssues;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _dateRaised;
  DateTime? get dateRaised => _dateRaised;
  set dateRaised(DateTime? value) {
    _dateRaised = value;
  }

  DateTime? _dateFixed;
  DateTime? get dateFixed => _dateFixed;
  set dateFixed(DateTime? value) {
    _dateFixed = value;
  }

  int _nextTicketNumber = 0;
  int get nextTicketNumber => _nextTicketNumber;
  set nextTicketNumber(int value) {
    _nextTicketNumber = value;
    prefs.setInt('ff_nextTicketNumber', value);
  }

  bool _showOnlyCurrentIssues = false;
  bool get showOnlyCurrentIssues => _showOnlyCurrentIssues;
  set showOnlyCurrentIssues(bool value) {
    _showOnlyCurrentIssues = value;
    prefs.setBool('ff_showOnlyCurrentIssues', value);
  }

  String _currentStatus = 'Current';
  String get currentStatus => _currentStatus;
  set currentStatus(String value) {
    _currentStatus = value;
  }

  DocumentReference? _currentIssueReference;
  DocumentReference? get currentIssueReference => _currentIssueReference;
  set currentIssueReference(DocumentReference? value) {
    _currentIssueReference = value;
  }

  String _historyActionsText = '';
  String get historyActionsText => _historyActionsText;
  set historyActionsText(String value) {
    _historyActionsText = value;
  }

  bool _issueTitleChanged = false;
  bool get issueTitleChanged => _issueTitleChanged;
  set issueTitleChanged(bool value) {
    _issueTitleChanged = value;
  }

  bool _issueDescriptionChanged = false;
  bool get issueDescriptionChanged => _issueDescriptionChanged;
  set issueDescriptionChanged(bool value) {
    _issueDescriptionChanged = value;
  }

  bool _dateRaisedChanged = false;
  bool get dateRaisedChanged => _dateRaisedChanged;
  set dateRaisedChanged(bool value) {
    _dateRaisedChanged = value;
  }

  bool _versionSoftwareFixedChanged = false;
  bool get versionSoftwareFixedChanged => _versionSoftwareFixedChanged;
  set versionSoftwareFixedChanged(bool value) {
    _versionSoftwareFixedChanged = value;
  }

  bool _versionSoftwareRaisedChanged = false;
  bool get versionSoftwareRaisedChanged => _versionSoftwareRaisedChanged;
  set versionSoftwareRaisedChanged(bool value) {
    _versionSoftwareRaisedChanged = value;
  }

  bool _dateFixedChanged = false;
  bool get dateFixedChanged => _dateFixedChanged;
  set dateFixedChanged(bool value) {
    _dateFixedChanged = value;
  }

  bool _statusChanged = false;
  bool get statusChanged => _statusChanged;
  set statusChanged(bool value) {
    _statusChanged = value;
  }

  bool _notesChanged = false;
  bool get notesChanged => _notesChanged;
  set notesChanged(bool value) {
    _notesChanged = value;
  }

  bool _ticketNumberChanged = false;
  bool get ticketNumberChanged => _ticketNumberChanged;
  set ticketNumberChanged(bool value) {
    _ticketNumberChanged = value;
  }

  bool _raisedByChanged = false;
  bool get raisedByChanged => _raisedByChanged;
  set raisedByChanged(bool value) {
    _raisedByChanged = value;
  }

  bool _urgencyChanged = false;
  bool get urgencyChanged => _urgencyChanged;
  set urgencyChanged(bool value) {
    _urgencyChanged = value;
  }

  bool _screenshotChanged = false;
  bool get screenshotChanged => _screenshotChanged;
  set screenshotChanged(bool value) {
    _screenshotChanged = value;
  }
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
