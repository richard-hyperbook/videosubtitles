import '/backend/backend.dart';
import '/components/test_steps_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_steps_page_widget.dart' show TestStepsPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TestStepsPageModel extends FlutterFlowModel<TestStepsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in TestStepsPage widget.
  List<TestStepsRecord>? queryTestStepsCopy2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TestStepsRecord? newTestStep;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<TestStepsRecord>? queryTestSteps;
  // Stores action output result for [Custom Action - setNextTestStepIndex] action in Button widget.
  double? max;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, TestStepsRecord>?
      listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Models for TestStepsItem dynamic component.
  late FlutterFlowDynamicModels<TestStepsItemModel> testStepsItemModels;

  @override
  void initState(BuildContext context) {
    testStepsItemModels = FlutterFlowDynamicModels(() => TestStepsItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    for (var s in listViewStreamSubscriptions) {
      s?.cancel();
    }
    listViewPagingController?.dispose();

    testStepsItemModels.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, TestStepsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, TestStepsRecord>
      _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, TestStepsRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryTestStepsRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
