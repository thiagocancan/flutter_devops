import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'mew51369': {
      'pt': 'Login',
      'en': 'Login',
    },
    'gycks3a2': {
      'pt': 'Seja bem vindo!',
      'en': 'Welcome!',
    },
    'x3kk0udf': {
      'pt': 'Email',
      'en': 'E-mail',
    },
    'f8p2tdhq': {
      'pt': 'Senha',
      'en': 'Password',
    },
    '0ugy6f5u': {
      'pt': 'Entrar',
      'en': 'To enter',
    },
    'zutahjp8': {
      'pt': 'Digite o email',
      'en': 'Enter email',
    },
    '7feenbqu': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '59uke7kl': {
      'pt': 'Digite a senha',
      'en': 'Enter password',
    },
    'm11jlmnk': {
      'pt': 'Senha mínima de 6 caracteres',
      'en': 'Minimum password of 6 characters',
    },
    'lh4avvm1': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'odc79j9b': {
      'pt': 'Criar Conta',
      'en': 'Create Account',
    },
  },
  // Boasvindas
  {
    'b5apn5fk': {
      'pt': 'N O T E S',
      'en': 'N O T E S',
    },
    'yzl5ie4u': {
      'pt': 'Criar nova conta',
      'en': 'Create new account',
    },
    'zn06tm6e': {
      'pt': 'Login',
      'en': 'Login',
    },
    'ql7v3y2v': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // CriarConta
  {
    'eipzjfjt': {
      'pt': 'Nova Conta',
      'en': 'New Account',
    },
    '1p51pcmh': {
      'pt': 'Seja bem vindo!',
      'en': 'Welcome!',
    },
    'pp7n1uum': {
      'pt': 'Nome',
      'en': 'Name',
    },
    'jsfiti1m': {
      'pt': 'Email',
      'en': 'E-mail',
    },
    '8eruodmx': {
      'pt': 'Senha',
      'en': 'Password',
    },
    'l3ob66f9': {
      'pt': 'Confirme a Senha',
      'en': 'Confirm Password',
    },
    'smaradjh': {
      'pt': 'Campo Obrigatõrio',
      'en': 'Mandatory Field',
    },
    'l45a21an': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'yn8jes3v': {
      'pt': 'Campo Obrigatõrio',
      'en': 'Mandatory Field',
    },
    'i1f5snd9': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'h4k1dgyx': {
      'pt': 'Campo Obrigatõrio',
      'en': 'Mandatory Field',
    },
    'snzwct20': {
      'pt': 'É necessário no mínimo 6 caracteres ',
      'en': 'Minimum 6 characters required',
    },
    'czsg158a': {
      'pt': 'É necessário no mínimo 6 caracteres ',
      'en': 'Minimum 6 characters required',
    },
    's5v84df2': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'suhxyw8p': {
      'pt': 'Field is required',
      'en': 'Field is required',
    },
    'fggy3551': {
      'pt': 'É necessário no mínimo 6 caracteres ',
      'en': 'Minimum 6 characters required',
    },
    'd98bh5t1': {
      'pt': 'É necessário no mínimo 6 caracteres ',
      'en': 'Minimum 6 characters required',
    },
    'c9rjeps5': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'w7x04ean': {
      'pt': 'Criar',
      'en': 'To create',
    },
    'zrdiustw': {
      'pt': 'Criando esta conta você concorda com os ',
      'en': 'By creating this account you agree to the',
    },
    'lp7nt15o': {
      'pt': 'termos de uso',
      'en': 'terms of use',
    },
    't7hh56vn': {
      'pt': '.',
      'en': '.',
    },
  },
  // Home
  {
    '9s3ahl94': {
      'pt': 'Lembretes',
      'en': 'Reminders',
    },
    '0ywmz5qp': {
      'pt': 'Select...',
      'en': 'Select...',
    },
    '9omh536v': {
      'pt': 'Search...',
      'en': 'Search...',
    },
    'btavhv41': {
      'pt': 'Todos',
      'en': 'All',
    },
    'w1glvrix': {
      'pt': 'Lembretes',
      'en': 'Reminders',
    },
    '5shbl51p': {
      'pt': 'Remédios',
      'en': 'Medicines',
    },
    'if3whx30': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Historico
  {
    'fmrspr1s': {
      'pt': 'Histórico',
      'en': 'History',
    },
    'gphff3q5': {
      'pt': 'Limpar Historico',
      'en': 'Clear History',
    },
    '74ehzs1p': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // notificaoes
  {
    '6eh9xt3w': {
      'pt': 'Fazer feira',
      'en': 'Go shopping',
    },
    '5qxs55vx': {
      'pt': 'Não esquecer de fazer a feira do mês',
      'en': 'Don\'t forget to do your monthly shopping',
    },
    'uf1rkhnq': {
      'pt': '01/01/2000',
      'en': '01/01/2000',
    },
    'i4jhj41m': {
      'pt': 'Ativo',
      'en': 'Active',
    },
    'fs256qf1': {
      'pt': 'há 2 horas',
      'en': '2 hours ago',
    },
    'fzqi44cu': {
      'pt': 'Pagar contas',
      'en': 'Pay bills',
    },
    '6ummbkw5': {
      'pt': 'Não esquecer de pagas contas do mês',
      'en': 'Don\'t forget to pay your monthly bills',
    },
    'bfj7889z': {
      'pt': '01/01/2000',
      'en': '01/01/2000',
    },
    'k24n1uvw': {
      'pt': 'Ativo',
      'en': 'Active',
    },
    'jyci3lfq': {
      'pt': '1 semana atrás',
      'en': '1 week ago',
    },
    'wqz82gba': {
      'pt': 'Adicionar nova Notificação',
      'en': 'Add new Notification',
    },
    'xug0tzuz': {
      'pt': 'Adicione uma nova Notificação ',
      'en': 'Add a new Notification',
    },
    'pm1beu5z': {
      'pt': '1 ano atrás',
      'en': '1 year ago',
    },
    '4yszjrp0': {
      'pt': 'Adicionar nova Notificação',
      'en': 'Add new Notification',
    },
    'ksp6vz5w': {
      'pt': 'Adicione uma  nova Notificação',
      'en': 'Add a new Notification',
    },
    'z75fn3lj': {
      'pt': 'Entrou em 02/04/2020',
      'en': 'Joined on 04/02/2020',
    },
    '4nkehk0q': {
      'pt': 'Back',
      'en': 'Back',
    },
    'ybk1idzq': {
      'pt': 'Notificações',
      'en': 'Notifications',
    },
    '0yssef1l': {
      'pt': 'Notificações',
      'en': 'Notifications',
    },
    'zufnw2iu': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // perfil
  {
    '6fe9skrg': {
      'pt': 'Perfil',
      'en': 'Profile',
    },
    'xrmwppc7': {
      'pt': 'Conta',
      'en': 'Account',
    },
    'y0jpvt57': {
      'pt': 'Configurações',
      'en': 'Settings',
    },
    't9pm5njc': {
      'pt': 'Editar perfil',
      'en': 'Edit profile',
    },
    'qjhwk8se': {
      'pt': 'Alterar Tema',
      'en': 'Change Theme',
    },
    'vgq7gdtt': {
      'pt': 'Geral',
      'en': 'General',
    },
    'yi46t6fl': {
      'pt': 'suporte',
      'en': 'support',
    },
    'tfs6s7v8': {
      'pt': 'Termos de Serviço',
      'en': 'Terms of Service',
    },
    'xe2q3fjc': {
      'pt': 'Sair',
      'en': 'To go out',
    },
    'lzj0dn1o': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // calendario
  {
    '1r3htbfg': {
      'pt': 'Mês',
      'en': 'Month',
    },
    'vg425k8i': {
      'pt': 'Semana',
      'en': 'Week',
    },
    '02gum6cq': {
      'pt': 'Calendário',
      'en': 'Calendar',
    },
    'pblekd3f': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // urlBase
  {
    '866zqpq4': {
      'pt': 'Url Base',
      'en': 'Base Url',
    },
    'ucuds8fo': {
      'pt': 'Url Base',
      'en': 'Base Url',
    },
    'k17usk9l': {
      'pt': 'Salvar',
      'en': 'Save',
    },
    'tnrcnuhr': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // editar_usuario
  {
    '35iyagkw': {
      'pt': 'usuário',
      'en': 'user',
    },
    'g72shc1t': {
      'pt': 'Salvar',
      'en': 'Save',
    },
    'zb5negsc': {
      'pt': 'Editar Perfil',
      'en': 'Edit Profile',
    },
    'tnkyr6al': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Termos
  {
    'g0hsf2eo': {
      'pt': 'Termos e Serviços',
      'en': 'Terms and Services',
    },
    'd3vpzs7f': {
      'pt':
          'Última atualização: [20.10.2024]\n\nBem-vindo ao OutNotes! Ao usar nosso aplicativo, você concorda com os termos e condições a seguir. Se você não concorda com estes Termos, por favor, não utilize o aplicativo.\n\n1. Aceitação dos Termos\nAo acessar ou usar o OutNotes, você concorda em estar vinculado a estes Termos de Serviço e a todas as leis e regulamentos aplicáveis. Se você não concorda com algum destes termos, não utilize o nosso serviço.\n\n2. Descrição do Serviço\nO OutNotes oferece uma plataforma para [descrição resumida dos serviços, como organização de anotações e ideias]. Reservamo-nos o direito de modificar ou descontinuar o serviço (ou qualquer parte dele) a qualquer momento, com ou sem aviso prévio.\n\n3. Cadastro e Conta\nPara utilizar o OutNotes, pode ser necessário criar uma conta. Você é responsável por manter a confidencialidade de sua conta e senha.\nVocê concorda em fornecer informações precisas e atualizadas durante o processo de registro.\nVocê é responsável por todas as atividades que ocorrem em sua conta.\n\n4. Direitos de Propriedade Intelectual\nTodo o conteúdo, funcionalidades e características disponíveis no OutNotes, incluindo, mas não se limitando a textos, gráficos, logotipos e software, são de propriedade exclusiva de OutNotes ou de seus licenciadores, e são protegidos por direitos autorais e outras leis de propriedade intelectual.\n\n5. Uso Aceitável\nVocê concorda em usar o OutNotes apenas para fins legais e de acordo com estes Termos.\nÉ proibido:\nUsar o app para qualquer propósito ilícito.\nTentar violar a segurança do aplicativo ou acessar informações sem autorização.\nModificar, distribuir ou reproduzir o conteúdo do app sem autorização.\n\n6. Privacidade\nSua privacidade é importante para nós. Ao usar o OutNotes, você concorda com nossa Política de Privacidade, que detalha como coletamos, usamos e protegemos suas informações pessoais.\n\n7. Limitação de Responsabilidade\nO OutNotes é fornecido \"como está\" e \"conforme disponível\". Não garantimos que o serviço será ininterrupto ou livre de erros. Em nenhuma circunstância a OutNotes será responsável por quaisquer danos indiretos, incidentais ou consequenciais decorrentes do uso ou da incapacidade de usar o aplicativo.\n\n8. Modificações nos Termos\nReservamo-nos o direito de alterar estes Termos de Serviço a qualquer momento. Notificaremos você de qualquer mudança substancial por meio de uma notificação dentro do aplicativo ou por e-mail. O uso contínuo do aplicativo após essas alterações constituirá sua aceitação dos novos termos.\n\n9. Lei Aplicável\nEstes Termos de Serviço serão regidos e interpretados de acordo com as leis do Brasil.\n\n10. Contato\nSe você tiver dúvidas sobre estes Termos de Serviço, entre em contato conosco em',
      'en':
          'Last updated: [20.10.2024]\n\nWelcome to OutNotes! By using our app, you agree to the following terms and conditions. If you do not agree to these Terms, please do not use the app.\n\n1. Acceptance of Terms\nBy accessing or using OutNotes, you agree to be bound by these Terms of Service and all applicable laws and regulations. If you do not agree to any of these terms, please do not use our service.\n\n2. Description of Service\nOutNotes provides a platform for [brief description of services, such as organizing notes and ideas]. We reserve the right to modify or discontinue the service (or any part thereof) at any time, with or without notice.\n\n3. Registration and Account\nIn order to use OutNotes, you may be required to create an account. You are responsible for maintaining the confidentiality of your account and password.\n\nYou agree to provide accurate and up-to-date information during the registration process.\nYou are responsible for all activities that occur under your account.\n\n4. Intellectual Property Rights\nAll content, functionality and features available on OutNotes, including but not limited to text, graphics, logos and software, are the exclusive property of OutNotes or its licensors and are protected by copyright and other intellectual property laws.\n\n5. Acceptable Use\nYou agree to use OutNotes only for lawful purposes and in accordance with these Terms.\nYou may not:\nUse the app for any unlawful purpose.\nAttempt to breach the security of the app or access information without authorization.\nModify, distribute or reproduce the content of the app without authorization.\n\n6. Privacy\nYour privacy is important to us. By using OutNotes, you agree to our Privacy Policy, which details how we collect, use and protect your personal information.\n\n7. Limitation of Liability\nOutNotes is provided \"as is\" and \"as available.\" We do not guarantee that the service will be uninterrupted or error-free. Under no circumstances will OutNotes be liable for any indirect, incidental or consequential damages arising out of the use of or inability to use the application.\n\n8. Modifications to the Terms\nWe reserve the right to change these Terms of Service at any time. We will notify you of any material changes by means of an in-app notification or by email. Your continued use of the application after such changes will constitute your acceptance of the new terms.\n\n9. Governing Law\nThese Terms of Service shall be governed by and construed in accordance with the laws of Brazil.\n\n10. Contact\nIf you have any questions about these Terms of Service, please contact us at',
    },
    's4km22ze': {
      'pt': ' [e-mail de contato]',
      'en': '[contact email]',
    },
    '55sejlig': {
      'pt': '.',
      'en': '.',
    },
    'j8qrthqr': {
      'pt':
          'Última atualização: [20.10.2024]\n\nBem-vindo ao OutNotes! Ao usar nosso aplicativo, você concorda com os termos e condições a seguir. Se você não concorda com estes Termos, por favor, não utilize o aplicativo.\n\n1. Aceitação dos Termos\nAo acessar ou usar o OutNotes, você concorda em estar vinculado a estes Termos de Serviço e a todas as leis e regulamentos aplicáveis. Se você não concorda com algum destes termos, não utilize o nosso serviço.\n\n2. Descrição do Serviço\nO OutNotes oferece uma plataforma para [descrição resumida dos serviços, como organização de anotações e ideias]. Reservamo-nos o direito de modificar ou descontinuar o serviço (ou qualquer parte dele) a qualquer momento, com ou sem aviso prévio.\n\n3. Cadastro e Conta\nPara utilizar o OutNotes, pode ser necessário criar uma conta. Você é responsável por manter a confidencialidade de sua conta e senha.\nVocê concorda em fornecer informações precisas e atualizadas durante o processo de registro.\nVocê é responsável por todas as atividades que ocorrem em sua conta.\n\n4. Direitos de Propriedade Intelectual\nTodo o conteúdo, funcionalidades e características disponíveis no OutNotes, incluindo, mas não se limitando a textos, gráficos, logotipos e software, são de propriedade exclusiva de OutNotes ou de seus licenciadores, e são protegidos por direitos autorais e outras leis de propriedade intelectual.\n\n5. Uso Aceitável\nVocê concorda em usar o OutNotes apenas para fins legais e de acordo com estes Termos.\nÉ proibido:\nUsar o app para qualquer propósito ilícito.\nTentar violar a segurança do aplicativo ou acessar informações sem autorização.\nModificar, distribuir ou reproduzir o conteúdo do app sem autorização.\n\n6. Privacidade\nSua privacidade é importante para nós. Ao usar o OutNotes, você concorda com nossa Política de Privacidade, que detalha como coletamos, usamos e protegemos suas informações pessoais.\n\n7. Limitação de Responsabilidade\nO OutNotes é fornecido \"como está\" e \"conforme disponível\". Não garantimos que o serviço será ininterrupto ou livre de erros. Em nenhuma circunstância a OutNotes será responsável por quaisquer danos indiretos, incidentais ou consequenciais decorrentes do uso ou da incapacidade de usar o aplicativo.\n\n8. Modificações nos Termos\nReservamo-nos o direito de alterar estes Termos de Serviço a qualquer momento. Notificaremos você de qualquer mudança substancial por meio de uma notificação dentro do aplicativo ou por e-mail. O uso contínuo do aplicativo após essas alterações constituirá sua aceitação dos novos termos.\n\n9. Lei Aplicável\nEstes Termos de Serviço serão regidos e interpretados de acordo com as leis do Brasil.\n\n10. Contato\nSe você tiver dúvidas sobre estes Termos de Serviço, entre em contato conosco em [e-mail de contato].',
      'en':
          'Last updated: [20.10.2024]\n\nWelcome to OutNotes! By using our app, you agree to the following terms and conditions. If you do not agree to these Terms, please do not use the app.\n\n1. Acceptance of Terms\nBy accessing or using OutNotes, you agree to be bound by these Terms of Service and all applicable laws and regulations. If you do not agree to any of these terms, please do not use our service.\n\n2. Description of Service\nOutNotes provides a platform for [brief description of services, such as organizing notes and ideas]. We reserve the right to modify or discontinue the service (or any part thereof) at any time, with or without notice.\n\n3. Registration and Account\nIn order to use OutNotes, you may be required to create an account. You are responsible for maintaining the confidentiality of your account and password.\n\nYou agree to provide accurate and up-to-date information during the registration process.\nYou are responsible for all activities that occur under your account.\n\n4. Intellectual Property Rights\nAll content, functionality and features available on OutNotes, including but not limited to text, graphics, logos and software, are the exclusive property of OutNotes or its licensors and are protected by copyright and other intellectual property laws.\n\n5. Acceptable Use\nYou agree to use OutNotes only for lawful purposes and in accordance with these Terms.\nYou may not:\nUse the app for any unlawful purpose.\nAttempt to breach the security of the app or access information without authorization.\nModify, distribute or reproduce the content of the app without authorization.\n\n6. Privacy\nYour privacy is important to us. By using OutNotes, you agree to our Privacy Policy, which details how we collect, use and protect your personal information.\n\n7. Limitation of Liability\nOutNotes is provided \"as is\" and \"as available.\" We do not guarantee that the service will be uninterrupted or error-free. Under no circumstances will OutNotes be liable for any indirect, incidental or consequential damages arising out of the use of or inability to use the application.\n\n8. Modifications to the Terms\nWe reserve the right to change these Terms of Service at any time. We will notify you of any material changes by means of an in-app notification or by email. Your continued use of the application after such changes will constitute your acceptance of the new terms.\n\n9. Governing Law\nThese Terms of Service shall be governed by and construed in accordance with the laws of Brazil.\n\n10. Contact\nIf you have any questions about these Terms of Service, please contact us at [contact email].',
    },
    '1p4aqqtx': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // lembrete
  {
    '8ldqr420': {
      'pt': 'Lembretes',
      'en': 'Reminders',
    },
    'xbqle7ep': {
      'pt': 'Medicamento',
      'en': 'Medication',
    },
    'l2gcaa1s': {
      'pt': 'Título',
      'en': 'Title',
    },
    'xumua9rs': {
      'pt': 'Descrição...',
      'en': 'Description...',
    },
    'qbu1dcr7': {
      'pt': 'insira',
      'en': 'insert',
    },
    '57z310uh': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '54hmnix8': {
      'pt': 'Field is required',
      'en': 'Field is required',
    },
    '0e1z7hl5': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    't2kwnlhr': {
      'pt': 'Horario',
      'en': 'Time',
    },
    'hesriamg': {
      'pt': 'Criar',
      'en': 'To create',
    },
  },
  // calendar
  {
    '87s6such': {
      'pt': 'Salvar',
      'en': 'Save',
    },
  },
  // agendamento
  {
    'ioljm8v8': {
      'pt': 'Agendamento',
      'en': 'Scheduling',
    },
    'jiavendd': {
      'pt': 'Não Repetir',
      'en': 'Do Not Repeat',
    },
    '3d8dt8su': {
      'pt': 'Select...',
      'en': 'Select...',
    },
    '2i6g91lh': {
      'pt': 'Search...',
      'en': 'Search...',
    },
    'v0gmu3f9': {
      'pt': 'Não Repetir',
      'en': 'Do Not Repeat',
    },
    'gdquoyxk': {
      'pt': 'Diariamente',
      'en': 'Daily',
    },
    '3mbvdro9': {
      'pt': 'Mensalmente',
      'en': 'Monthly',
    },
    'eog1uf93': {
      'pt': '4 em 4 horas',
      'en': '4 in 4 hours',
    },
    'cfudfdfz': {
      'pt': '6 em 6 horas',
      'en': '6 in 6 hours',
    },
    'uw5tzbfb': {
      'pt': '8 em 8 horas',
      'en': '8 in 8 hours',
    },
    's3dfq4pr': {
      'pt': '12 em 12 horas',
      'en': '12 in 12 hours',
    },
    'pffgqv4o': {
      'pt': 'Salvar',
      'en': 'Save',
    },
  },
  // editarLembrete
  {
    'b27qv1wh': {
      'pt': 'Título...',
      'en': 'Title...',
    },
    'uqquxkbj': {
      'pt': 'Descrição...',
      'en': 'Description...',
    },
    'ps6n9aqi': {
      'pt': 'Sair',
      'en': 'To go out',
    },
  },
  // DeleteReminder
  {
    'c1m1rzsj': {
      'pt': 'Apagar Lembrete',
      'en': 'Delete Reminder',
    },
    'dqpmbr5a': {
      'pt': 'Cancelar',
      'en': 'Cancel',
    },
    'rcoq6onh': {
      'pt': 'Apagar',
      'en': 'To switch off',
    },
  },
  // Naopossuilembretes
  {
    'cnprv033': {
      'pt': 'Não possui Lembretes',
      'en': 'No Reminders',
    },
  },
  // Miscellaneous
  {
    'irvl91rg': {
      'pt': '',
      'en': '',
    },
    'k8x9b6sv': {
      'pt': '',
      'en': '',
    },
    'pr9hpsgb': {
      'pt': '',
      'en': '',
    },
    '2gm576nz': {
      'pt': '',
      'en': '',
    },
    'a8uzo9xs': {
      'pt': '',
      'en': '',
    },
    'jhs2z24x': {
      'pt': '',
      'en': '',
    },
    '8rkfvf00': {
      'pt': '',
      'en': '',
    },
    'v4ndth42': {
      'pt': '',
      'en': '',
    },
    '1gl11qss': {
      'pt': '',
      'en': '',
    },
    'lh0hpacn': {
      'pt': '',
      'en': '',
    },
    'xpzfqv2p': {
      'pt': '',
      'en': '',
    },
    'a1fg4sjg': {
      'pt': '',
      'en': '',
    },
    'm11fx369': {
      'pt': '',
      'en': '',
    },
    'q9b9zdnc': {
      'pt': '',
      'en': '',
    },
    'o21b59nj': {
      'pt': '',
      'en': '',
    },
    '72f3xv5b': {
      'pt': '',
      'en': '',
    },
    'yj4mo1o4': {
      'pt': '',
      'en': '',
    },
    'fjiargih': {
      'pt': '',
      'en': '',
    },
    'dm8tp2bv': {
      'pt': '',
      'en': '',
    },
    '9512r4i4': {
      'pt': '',
      'en': '',
    },
    'os882h46': {
      'pt': '',
      'en': '',
    },
    'cvbf30ax': {
      'pt': '',
      'en': '',
    },
    '303aqogp': {
      'pt': '',
      'en': '',
    },
    'qv83pjp1': {
      'pt': '',
      'en': '',
    },
    'p7xz1vtv': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
