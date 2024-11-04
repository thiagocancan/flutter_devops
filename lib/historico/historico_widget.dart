import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'historico_model.dart';
export 'historico_model.dart';

class HistoricoWidget extends StatefulWidget {
  const HistoricoWidget({super.key});

  @override
  State<HistoricoWidget> createState() => _HistoricoWidgetState();
}

class _HistoricoWidgetState extends State<HistoricoWidget> {
  late HistoricoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoricoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: const BoxDecoration(
                  color: Color(0xFF00BFFF),
                  shape: BoxShape.circle,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        title: Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Text(
            'Lembretes',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Roboto',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).warning,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Text(
                            'Lembrete 1',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 12.0),
                            child: Text(
                              'Descrição',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 12.0)),
            ),
            const Spacer(),
          ].addToEnd(const SizedBox(height: 64.0)),
        ),
      ),
    );
  }
}
