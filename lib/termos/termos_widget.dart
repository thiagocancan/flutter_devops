import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'termos_model.dart';
export 'termos_model.dart';

class TermosWidget extends StatefulWidget {
  const TermosWidget({super.key});

  @override
  State<TermosWidget> createState() => _TermosWidgetState();
}

class _TermosWidgetState extends State<TermosWidget> {
  late TermosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermosModel());
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
          backgroundColor: const Color(0xFF00BFFF),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Termos e Serviços',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: 100.0,
                        height: 1543.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 10.0, 5.0, 0.0),
                          child: Text(
                            'Última atualização: [20.10.2024]\n\nBem-vindo ao OutNotes! Ao usar nosso aplicativo, você concorda com os termos e condições a seguir. Se você não concorda com estes Termos, por favor, não utilize o aplicativo.\n\n1. Aceitação dos Termos\nAo acessar ou usar o OutNotes, você concorda em estar vinculado a estes Termos de Serviço e a todas as leis e regulamentos aplicáveis. Se você não concorda com algum destes termos, não utilize o nosso serviço.\n\n2. Descrição do Serviço\nO OutNotes oferece uma plataforma para [descrição resumida dos serviços, como organização de anotações e ideias]. Reservamo-nos o direito de modificar ou descontinuar o serviço (ou qualquer parte dele) a qualquer momento, com ou sem aviso prévio.\n\n3. Cadastro e Conta\nPara utilizar o OutNotes, pode ser necessário criar uma conta. Você é responsável por manter a confidencialidade de sua conta e senha.\nVocê concorda em fornecer informações precisas e atualizadas durante o processo de registro.\nVocê é responsável por todas as atividades que ocorrem em sua conta.\n\n4. Direitos de Propriedade Intelectual\nTodo o conteúdo, funcionalidades e características disponíveis no OutNotes, incluindo, mas não se limitando a textos, gráficos, logotipos e software, são de propriedade exclusiva de OutNotes ou de seus licenciadores, e são protegidos por direitos autorais e outras leis de propriedade intelectual.\n\n5. Uso Aceitável\nVocê concorda em usar o OutNotes apenas para fins legais e de acordo com estes Termos.\nÉ proibido:\nUsar o app para qualquer propósito ilícito.\nTentar violar a segurança do aplicativo ou acessar informações sem autorização.\nModificar, distribuir ou reproduzir o conteúdo do app sem autorização.\n\n6. Privacidade\nSua privacidade é importante para nós. Ao usar o OutNotes, você concorda com nossa Política de Privacidade, que detalha como coletamos, usamos e protegemos suas informações pessoais.\n\n7. Limitação de Responsabilidade\nO OutNotes é fornecido \"como está\" e \"conforme disponível\". Não garantimos que o serviço será ininterrupto ou livre de erros. Em nenhuma circunstância a OutNotes será responsável por quaisquer danos indiretos, incidentais ou consequenciais decorrentes do uso ou da incapacidade de usar o aplicativo.\n\n8. Modificações nos Termos\nReservamo-nos o direito de alterar estes Termos de Serviço a qualquer momento. Notificaremos você de qualquer mudança substancial por meio de uma notificação dentro do aplicativo ou por e-mail. O uso contínuo do aplicativo após essas alterações constituirá sua aceitação dos novos termos.\n\n9. Lei Aplicável\nEstes Termos de Serviço serão regidos e interpretados de acordo com as leis do [País/Estado].\n\n10. Contato\nSe você tiver dúvidas sobre estes Termos de Serviço, entre em contato conosco em [e-mail de contato].',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
