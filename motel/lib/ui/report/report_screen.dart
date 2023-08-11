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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/bloc/report/report_bloc.dart';
import 'package:motel/bloc/report/report_event.dart';
import 'package:motel/ui/report/report_year_screen.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportScreen> {
  final controller = PageController(
    initialPage: activePage,
  );
  final List<Widget> pages = [
    const ReportYearScreen(),
    Container(color: Colors.red),
    Container(color: Colors.blue)
  ];
  static int activePage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  static const textType = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    backgroundColor: Colors.purpleAccent,
    color: Colors.blueGrey,
    decoration: TextDecoration.none,
  );

  Widget titleView(String text) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: const Text("Năm", style: textType),
        ),
        const SizedBox(width: 15),
        GestureDetector(
          onTap: () {},
          child: const FittedBox(
            child: Text(" Tháng", style: textType),
          ),
        ),
        const SizedBox(width: 15),
        GestureDetector(
          onTap: () {},
          child: const FittedBox(
            //fit: BoxFit.fitHeight,
            child: Text(" Tuần", style: textType),
          ),
        ),
      ],
    );

    /* return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () {},
          child: const Text("Năm", style: textType),
        ),
        const SizedBox(width: 15),
        GestureDetector(
          onTap: () {},
          child: const FittedBox(
            child: Text(" Tháng", style: textType),
          ),
        ),
        const SizedBox(width: 15),
        GestureDetector(
          onTap: () {},
          child: const FittedBox(
            //fit: BoxFit.fitHeight,
            child: Text(" Tuần", style: textType),
          ),
        ),
      ],
    ); */
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(primaryColor: Colors.blue),
      color: Colors.black,
      home: BlocProvider(
        create: (_) => ReportBloc()..add(ReportFetchDataEvent('', '')),
        child: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.loose,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 0.7,
              child: PageView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    activePage = value;
                    log('state - page = $activePage');
                  });
                },
                physics: const BouncingScrollPhysics(),
                children: pages,
              ),
            ),
            Positioned(top: 50, child: titleView('')),
          ],
        ),
      ),

      // builder: EasyLoading.init(),
    );

    /*    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      color: Colors.yellow,
      home: BlocProvider(
        create: (_) => ReportBloc()..add(ReportFetchDataEvent('', '')),
        child: viewChild(),
      ),
      // builder: EasyLoading.init(),
    ); */
  }
}
