import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

DateTime stringToDateTime(String dateString) {
  // Crie um função que transforme uma string em formato timestamp em formato datetime
  return DateTime.parse(dateString);
}

FFUploadedFile base64img(String imagebase64) {
  final bytesdec = base64Decode(imagebase64);
  return FFUploadedFile(bytes: bytesdec);
}

String showFFColorPicker(Color selectColor) {
  // its a function that converts color to hex
  String hexColor = '#${selectColor.value.toRadixString(16).substring(2)}';
  return hexColor;
}

String? dateFormater(String date) {
  // Crie uma funçao que receba uma string no formato timestamp e retorne uma string formatado em pt_br apenas com a data com dia, mes e ano
  DateTime dateTime = DateTime.parse(date);
  String formattedDate = DateFormat('dd/MM/yyyy', 'pt_BR').format(dateTime);
  return formattedDate;
}

String dateFormaterAlert(String date) {
  // Crie uma funçao que receba uma string no formato timestamp e retorne uma string formatado em pt_br apenas com a data com dia, mes, ano e hora no formato 00:00
  DateTime dateTime = DateTime.parse(date);
  String formattedDate =
      DateFormat('dd/MM/yyyy HH:mm', 'pt_BR').format(dateTime);
  return formattedDate;
}

String stringEncode(String string) {
  String text = string;
  String encodedText = Uri.encodeComponent(text);

  return encodedText;
}

int? lineCount(String? texto) {
  // Crie uma função que receba uma string e conte a quantidade de linhas que a string tem e retorne o valor da quantidade de linhas
  if (texto == null) {
    return null;
  }

  List<String> lines = texto.split('\n');
  return lines.length;
}
