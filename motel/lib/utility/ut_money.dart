import 'package:intl/intl.dart';

String vnd(double money) => ' ${NumberFormat('#,##0', 'en_US').format(money)}';
String vnd2(double money) =>
    ' ${NumberFormat('#,##0.00', 'en_US').format(money)}';
String vndk(double money) =>
    ' ${NumberFormat('#,##0', 'en_US').format(money).split(',').first}';
