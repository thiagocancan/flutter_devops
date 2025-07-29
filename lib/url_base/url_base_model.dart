import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'url_base_widget.dart' show UrlBaseWidget;
import 'package:flutter/material.dart';

class UrlBaseModel extends FlutterFlowModel<UrlBaseWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
