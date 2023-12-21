import 'package:flutter/material.dart';

abstract class UTColors {
  static const backGround = _UTColors(
    <int, Color>{
      1: Color(0xffedf0f5),
      2: Color(0xfff7f8fc),
      3: Color(0xfffee600),
      4: Color(0xff000000),
      5: Color(0xffffffff),
    },
  );

  static const text = _UTColors(
    <int, Color>{
      1: Color(0xff010101),
      2: Color(0xffd6ced9),
      3: Color(0xff7f8180),
      4: Color.fromARGB(234, 226, 0, 95),
      5: Color.fromARGB(234, 8, 85, 31),
    },
  );
}

class _UTColors<T> extends TextStyle {
  final Map<T, Color> _swatch;
  const _UTColors(this._swatch);

  // Returns an element of the swatch table.
  Color operator [](T index) => _swatch[index]!;
}
