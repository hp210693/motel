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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:motel/bloc/bottom/bottom_bloc.dart';
import 'package:motel/bloc/bottom/bottom_event.dart';
import 'package:motel/bloc/bottom/bottom_state.dart';
import 'package:motel/ui/chat/chat_screen.dart';
import 'package:motel/ui/home/home_screen.dart';
import 'package:motel/ui/report/report_screen.dart';
import 'package:motel/ui/setting/setting_screen.dart';
import 'package:motel/utility/ut_color.dart';
import 'package:motel/utility/ut_styles.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});
  static Route<void> route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const BottomScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  State<BottomScreen> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  theme: ThemeData(primaryColor: Colors.blue),
      // color: Colors.yellow,
      home: BlocProvider(create: (_) => BottomBloc(), child: viewChild()),
      builder: EasyLoading.init(),
    );
  }

  int selectedIndex = 0;

  List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const ReportScreen(),
    const ChatScreen(),
    const SettingScreen()
  ];

  Widget viewChild() {
    return Scaffold(
      body: BlocBuilder<BottomBloc, BottomState>(
        builder: (context, state) {
          return Center(
            child: widgetOptions.elementAt(selectedIndex),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomBloc, BottomState>(
        builder: (context, state) {
          return BottomNavigationBar(
            backgroundColor: UTColors.backGround[1],
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Phòng',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.report),
                label: 'Báo cáo',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded),
                label: 'Tin nhắn',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Hồ sơ',
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: UTColors.backGround[4],
            selectedLabelStyle: UTStyles.text[7],
            onTap: (value) {
              selectedIndex = value;
              context.read<BottomBloc>().add(BotttonSelectedEvent());
            },
          );
        },
      ),
    );
  }
}
