import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/hyperbook1.png',
            fit: BoxFit.fitWidth,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'createAccount': ParameterData.none(),
  'login': ParameterData.none(),
  'editProfile': ParameterData.none(),
  'profilePage': ParameterData.none(),
  'changePassword': ParameterData.none(),
  'registerPage': ParameterData.none(),
  'phoneSignIn': ParameterData.none(),
  'verifyPhone': ParameterData.none(),
  'chapterEdit': (data) async => ParameterData(
        allParams: {
          'chapter': getParameter<DocumentReference>(data, 'chapter'),
          'title': getParameter<String>(data, 'title'),
          'body': getParameter<String>(data, 'body'),
          'hyperbook': getParameter<DocumentReference>(data, 'hyperbook'),
          'user': getParameter<DocumentReference>(data, 'user'),
        },
      ),
  'settings': ParameterData.none(),
  'map_display': (data) async => ParameterData(
        allParams: {
          'hyperbook': getParameter<DocumentReference>(data, 'hyperbook'),
          'hyperbookTitle': getParameter<String>(data, 'hyperbookTitle'),
          'moderator': getParameter<DocumentReference>(data, 'moderator'),
        },
      ),
  'hyperbook_edit': (data) async => ParameterData(
        allParams: {
          'hyperbook': getParameter<DocumentReference>(data, 'hyperbook'),
          'hyperbookTitle': getParameter<String>(data, 'hyperbookTitle'),
          'hyperbookBlurb': getParameter<String>(data, 'hyperbookBlurb'),
          'hyperbookType': getParameter<int>(data, 'hyperbookType'),
          'requresReaderApproval':
              getParameter<String>(data, 'requresReaderApproval'),
          'requiresWriterApproval':
              getParameter<String>(data, 'requiresWriterApproval'),
          'visibility': getParameter<String>(data, 'visibility'),
          'startChapter': getParameter<DocumentReference>(data, 'startChapter'),
          'collaboratorPriviledges':
              getParameter<String>(data, 'collaboratorPriviledges'),
          'moderator': getParameter<DocumentReference>(data, 'moderator'),
        },
      ),
  'tutorial': ParameterData.none(),
  'chapterRead': (data) async => ParameterData(
        allParams: {
          'chapter': getParameter<DocumentReference>(data, 'chapter'),
          'title': getParameter<String>(data, 'title'),
          'body': getParameter<String>(data, 'body'),
          'hyperbookTitle': getParameter<String>(data, 'hyperbookTitle'),
          'hyperbook': getParameter<DocumentReference>(data, 'hyperbook'),
          'chapterState': getParameter<int>(data, 'chapterState'),
          'chapterReaderIndex': getParameter<int>(data, 'chapterReaderIndex'),
          'readReference':
              getParameter<DocumentReference>(data, 'readReference'),
        },
      ),
  'chapter_display': (data) async => ParameterData(
        allParams: {
          'hyperbook': getParameter<DocumentReference>(data, 'hyperbook'),
          'hyperbookTitle': getParameter<String>(data, 'hyperbookTitle'),
        },
      ),
  'introduction': ParameterData.none(),
  'backup_hyperbook': (data) async => ParameterData(
        allParams: {
          'hyperbook': getParameter<DocumentReference>(data, 'hyperbook'),
          'hyperbookTitle': getParameter<String>(data, 'hyperbookTitle'),
        },
      ),
  'hyperbook_display': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
