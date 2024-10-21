import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'naopossuilembretes_model.dart';
export 'naopossuilembretes_model.dart';

class NaopossuilembretesWidget extends StatefulWidget {
  const NaopossuilembretesWidget({super.key});

  @override
  State<NaopossuilembretesWidget> createState() =>
      _NaopossuilembretesWidgetState();
}

class _NaopossuilembretesWidgetState extends State<NaopossuilembretesWidget> {
  late NaopossuilembretesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NaopossuilembretesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Não possui Lembretes',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope',
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
