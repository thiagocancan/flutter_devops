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

FFUploadedFile base64img(String imagebase64) {
  final bytesdec = base64Decode(imagebase64);
  return FFUploadedFile(bytes: bytesdec);
}

String showFFColorPicker(Color selectColor) {
  // its a function that converts color to hex
  String hexColor = '#${selectColor.value.toRadixString(16).substring(2)}';
  return hexColor;
}
