import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_lembrete_widget.dart' show EditarLembreteWidget;
import 'package:flutter/material.dart';

class EditarLembreteModel extends FlutterFlowModel<EditarLembreteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textFieldTextController;
  String? Function(BuildContext, String?)? textFieldTextControllerValidator;
  Color? colorPicked;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (Update Reminder)] action in Button widget.
  ApiCallResponse? updateReminderResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textFieldTextController?.dispose();
  }
}
