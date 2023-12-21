import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motel/utility/ut_color.dart';

abstract class UTStyles {
  static final title = _UTStyles(
    <int, TextStyle>{
      1: GoogleFonts.robotoSlab(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: UTColors.text[1],
      ),
      2: GoogleFonts.robotoSlab(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: UTColors.text[1],
      ),
      3: GoogleFonts.robotoSlab(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: UTColors.text[1],
      ),
      4: GoogleFonts.robotoSlab(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: UTColors.text[1],
      ),
      5: GoogleFonts.robotoSlab(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: UTColors.text[3],
      ),
      6: GoogleFonts.robotoSlab(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: UTColors.text[5],
      ),
      7: GoogleFonts.robotoSlab(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: UTColors.text[4],
      ),
    },
  );

  static final text = _UTStyles(
    <int, TextStyle>{
      1: GoogleFonts.robotoSlab(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: UTColors.text[1],
      ),
      2: GoogleFonts.robotoSlab(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: UTColors.text[3],
      ),
      3: GoogleFonts.robotoSlab(
        fontSize: 22,
        fontWeight: FontWeight.normal,
        color: UTColors.backGround[5],
      ),
      4: GoogleFonts.robotoSlab(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: UTColors.text[3],
      ),
      5: GoogleFonts.robotoSlab(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: UTColors.text[3],
      ),
      6: GoogleFonts.robotoSlab(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: UTColors.text[3],
      ),
      7: GoogleFonts.robotoSlab(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: UTColors.text[3],
      ),
    },
  );
}

class _UTStyles<T> extends TextStyle {
  final Map<T, TextStyle> _swatch;
  const _UTStyles(this._swatch);

  // Returns an element of the swatch table.
  TextStyle operator [](T index) => _swatch[index]!;
}
