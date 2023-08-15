import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motel/utility/ut_color.dart';

abstract class UTStyles {
  static final title = _UTStyles(
    <int, TextStyle>{
      1: GoogleFonts.acme(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: UTColors.text[1],
      ),
      2: GoogleFonts.acme(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: UTColors.text[1],
      ),
      3: GoogleFonts.acme(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: UTColors.text[1],
      ),
    },
  );

  static const head1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    // backgroundColor: Colors.purpleAccent,
  );

  static final text = _UTStyles(
    <int, TextStyle>{
      1: GoogleFonts.acme(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: UTColors.text[1],
      ),
      2: GoogleFonts.acme(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: UTColors.text[3],
      ),
      3: GoogleFonts.acme(
        fontSize: 22,
        fontWeight: FontWeight.normal,
        color: UTColors.backGround[5],
      ),
      4: GoogleFonts.aBeeZee(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: UTColors.text[3],
      ),
      5: GoogleFonts.acme(
        fontSize: 16,
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
