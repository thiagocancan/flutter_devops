import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'editar_usuario_model.dart';
export 'editar_usuario_model.dart';

class EditarUsuarioWidget extends StatefulWidget {
  const EditarUsuarioWidget({super.key});

  @override
  State<EditarUsuarioWidget> createState() => _EditarUsuarioWidgetState();
}

class _EditarUsuarioWidgetState extends State<EditarUsuarioWidget> {
  late EditarUsuarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarUsuarioModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.foto = functions.base64img(currentUserData!.img);
      safeSetState(() {});
    });

    _model.textController ??=
        TextEditingController(text: currentUserData?.displayName);
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            'Editar Perfil',
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Manrope',
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if ((_model.uploadedLocalFile.bytes?.isEmpty ?? true))
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        maxWidth: 100.00,
                        maxHeight: 100.00,
                        imageQuality: 40,
                        allowPhoto: true,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        safeSetState(() => _model.isDataUploading = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];

                        try {
                          selectedUploadedFiles = selectedMedia
                              .map((m) => FFUploadedFile(
                                    name: m.storagePath.split('/').last,
                                    bytes: m.bytes,
                                    height: m.dimensions?.height,
                                    width: m.dimensions?.width,
                                    blurHash: m.blurHash,
                                  ))
                              .toList();
                        } finally {
                          _model.isDataUploading = false;
                        }
                        if (selectedUploadedFiles.length ==
                            selectedMedia.length) {
                          safeSetState(() {
                            _model.uploadedLocalFile =
                                selectedUploadedFiles.first;
                          });
                        } else {
                          safeSetState(() {});
                          return;
                        }
                      }

                      _model.stringtobase64 = await actions.base64convert(
                        _model.uploadedLocalFile,
                      );

                      safeSetState(() {});
                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.memory(
                            _model.foto?.bytes ?? Uint8List.fromList([]),
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                ),
              if ((_model.uploadedLocalFile.bytes?.isNotEmpty ?? false))
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiary,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.memory(
                          _model.uploadedLocalFile.bytes ??
                              Uint8List.fromList([]),
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: SizedBox(
                    width: 200.0,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'usuário',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Manrope',
                                  color: FlutterFlowTheme.of(context).accent4,
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).accent4,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            letterSpacing: 0.0,
                          ),
                      textAlign: TextAlign.center,
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  _model.updateuserresponse =
                      await LembretesGroup.updateUserCall.call(
                    name: _model.textController.text,
                    image: (_model.uploadedLocalFile.bytes?.isNotEmpty ??
                                false)
                        ? _model.stringtobase64
                        : currentUserData?.img,
                    jwt: currentAuthenticationToken,
                  );

                  if ((_model.updateuserresponse?.succeeded ?? true)) {
                    authManager.updateAuthUserData(
                      authenticationToken: currentAuthenticationToken,
                      authUid: getJsonField(
                        (_model.updateuserresponse?.jsonBody ?? ''),
                        r'''$.user.id''',
                      ).toString(),
                      userData: UserStruct(
                        displayName: getJsonField(
                          (_model.updateuserresponse?.jsonBody ?? ''),
                          r'''$.user.name''',
                        ).toString(),
                        displayEmail: currentUserData?.displayEmail,
                        img: getJsonField(
                          (_model.updateuserresponse?.jsonBody ?? ''),
                          r'''$.user.image''',
                        ).toString(),
                      ),
                    );

                    context.pushNamed('perfil1');

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Usuário Atualizado',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  }

                  safeSetState(() {});
                },
                text: 'Salvar',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).iltan,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Manrope',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
