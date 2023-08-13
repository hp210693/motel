import 'package:intl/intl.dart';

String vnd(double money) =>
    '${NumberFormat('#,##0.00', 'en_US').format(money)} VND';
