/*MIT License

Copyright (c) 2023 Hung Phan (@hp210693)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.*/

import 'dart:developer';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:motel/bloc/report/report_bloc.dart';
import 'package:motel/bloc/report/report_event.dart';
import 'package:motel/bloc/report/report_state.dart';
import 'package:motel/data/report/report.dart';
import 'package:intl/intl.dart';
import 'package:motel/utility/ex_double.dart';

class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}

class ReportYearScreen extends StatefulWidget {
  const ReportYearScreen({super.key});

  @override
  State<ReportYearScreen> createState() => _ReportYearPageState();
}

class _ReportYearPageState extends State<ReportYearScreen> {
  Map<String, List<Report>>? reports;
  static const maxY = 14.0;
  static double total = 180000000;
  static final money = NumberFormat('#,##0.00', 'en_US');
  bool fitInsideBottomTitle = true;
  bool fitInsideLeftTitle = false;
  late double touchedValue;

  List<Color> gradientColors = [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue,
  ];

  @override
  void initState() {
    touchedValue = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      color: Colors.yellow,
      home: BlocProvider(
        create: (_) => ReportBloc()..add(ReportFetchDataEvent('', '')),
        child: viewChild(),
      ),
      // builder: EasyLoading.init(),
    );
  }

  void navigateBlocState(state) {
    log("BlocBuilder state = $state");
    switch (state.runtimeType) {
      case ReportLoadingState:
        EasyLoading.show(
          status: 'Đợi chút nhé...',
          maskType: EasyLoadingMaskType.clear,
        );
        break;
      case ReportSuccessedState:
        reports = state.reports;
        EasyLoading.showSuccess(
          "Thành công",
          maskType: EasyLoadingMaskType.clear,
        );
        break;
      case ReportErrorState:
        EasyLoading.showError("Đã có lỗi xảy ra!",
            maskType: EasyLoadingMaskType.clear);
        break;
      default:
        EasyLoading.dismiss();
        break;
    }
  }

  Widget viewChild() {
    return Scaffold(
      body: BlocBuilder<ReportBloc, ReportState>(
        builder: (context, state) {
          navigateBlocState(state);
          if (reports == null) return const Text('');
          return Container(
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 0.7,
                  child: LineChart(
                    mainData(),
                  ),

                  /* Padding(
                    padding: const EdgeInsets.only(
                      right: 5,
                      left: 5,
                      top: 5,
                      bottom: 5,
                    ),
                    child: LineChart(
                      mainData(),
                    ),
                  ), */
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final isTouched = value == touchedValue;
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: isTouched ? Colors.red : Colors.blue,
    );

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('1', style: style);
        break;
      case 1:
        text = Text('2', style: style);
        break;
      case 2:
        text = Text('3', style: style);
        break;
      case 3:
        text = Text('4', style: style);
        break;
      case 4:
        text = Text('5', style: style);
        break;
      case 5:
        text = Text('6', style: style);
        break;
      case 6:
        text = Text('7', style: style);
        break;
      case 7:
        text = Text('8', style: style);
        break;
      case 8:
        text = Text('9', style: style);
        break;
      case 9:
        text = Text('10', style: style);
        break;
      case 10:
        text = Text('11', style: style);
        break;
      case 11:
        text = Text('12', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '20T';
        break;
      case 2:
        text = '40T';
        break;
      case 4:
        text = '60T';
        break;
      case 6:
        text = '80T';
        break;
      case 8:
        text = '100T';
        break;
      case 10:
        text = '120T';
        break;
      case 12:
        text = '140T';
        break;
      case 14:
        text = '180T';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  List<FlSpot> listSpot() {
    List<FlSpot> list = [];
    reports?.entries.forEachIndexed(
      (index, element) {
        list.add(
          FlSpot(
            index * 1.0,
            (maxY /
                    (total /
                        (element.value.fold(0.0,
                            (pre, element) => pre + element.totalPayment))))
                .toPrecision(3),
          ),
        );
      },
    );
    return list;
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.black,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.redAccent,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 45,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 35,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: Colors.red),
      ),
      minX: 0,
      maxX: reports!.length - 1.0,
      minY: 0,
      maxY: maxY,
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.deepOrange,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map(
              (barSpot) {
                final flSpot = barSpot;
                /* TextAlign textAlign;
                switch (flSpot.x.toInt()) {
                  case 0:
                    textAlign = TextAlign.right;
                    break;
                  case 11:
                    textAlign = TextAlign.left;
                    break;
                  default:
                    textAlign = TextAlign.center;
                } */
                log('????---${flSpot.x}-  ${money.format((total * flSpot.y) / 14)}');
                return LineTooltipItem(
                  'Doanh thu tháng ${flSpot.x.toInt() + 1}\n',
                  const TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: (money.format((total * flSpot.y) / 14)).toString(),
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const TextSpan(
                      text: ' VND',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                  textAlign: TextAlign.center,
                );
              },
            ).toList();
          },
        ),
        /*    getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map(
            (spotIndex) {
              /*   final spot = barData.spots[spotIndex];
              /*   if (spot.x == 0 || spot.x == 6) {
                return null;
              } */ */
              return TouchedSpotIndicatorData(
                const FlLine(
                  color: Colors.purple,
                  strokeWidth: 4,
                ),
                FlDotData(
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 8,
                      color: Colors.white,
                      strokeWidth: 5,
                      strokeColor: Colors.orange,
                    );
                  },
                ),
              );
            },
          ).toList();
        }, */
        touchCallback: (FlTouchEvent event, LineTouchResponse? lineTouch) {
          if (!event.isInterestedForInteractions ||
              lineTouch == null ||
              lineTouch.lineBarSpots == null) {
            setState(() {
              touchedValue = -1;
            });
            return;
          }
          final value = lineTouch.lineBarSpots![0].x;

          /*  if (value == 0 || value == 6) {
            setState(() {
              touchedValue = -1;
            });
            return;
          }
 */
          setState(() {
            touchedValue = value;
          });
        },
      ),
      lineBarsData: [
        LineChartBarData(
          spots: listSpot(),
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
