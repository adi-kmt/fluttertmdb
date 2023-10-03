import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Typography {
  Typography._();

  static TextStyle subHeading =
      GoogleFonts.roboto(fontSize: 36, fontWeight: FontWeight.w400, height: 44);

  static TextStyle appbarHeading =
      GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400, height: 32);

  static TextStyle mainHeading =
      GoogleFonts.roboto(fontSize: 45, fontWeight: FontWeight.w400, height: 52);

  static TextStyle desc =
      GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500, height: 24);
}
