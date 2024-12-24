import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class appText {
  static Widget primaryText(
      {required var text,
      int? maxLines,
      FontWeight? fontWeight,
      Color? color,
      TextAlign? align,
      double? lineHeight,
      double? fontSize}) {
    return Text(
      text ?? "--:--",
      maxLines: maxLines,
      textAlign: align,
      style: GoogleFonts.poppins(
          height: lineHeight,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color ?? Color(0xFF262626)),
    );
  }
}
