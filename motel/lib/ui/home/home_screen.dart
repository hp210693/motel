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
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:motel/bloc/home/home_bloc.dart';
import 'package:motel/bloc/home/home_event.dart';
import 'package:motel/bloc/home/home_state.dart';
import 'package:motel/data/home/room.dart';
import 'package:motel/utility/ut_money.dart';
import 'package:motel/utility/ut_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  Map? rooms;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      color: Colors.yellow,
      home: BlocProvider(
          create: (_) => HomeBloc()..add(HomeFetchDataEvent("", "")),
          child: viewChild()),
      builder: EasyLoading.init(),
    );
  }

  Widget viewChild() {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          navigateBlocState(state);
          return SafeArea(
            child: ListView.builder(
              itemCount: rooms == null ? 0 : rooms?.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index1) {
                String nameFlow = "";
                int numberRooms = 0;
                if (rooms != null) {
                  nameFlow = rooms!.keys.toList()[index1].toString();
                  numberRooms = rooms!.values.toList()[index1].length;
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dãy $nameFlow',
                      style: UTStyles.title[1],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.all(3.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: numberRooms,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 3.0,
                          mainAxisSpacing: 3.0,
                        ),
                        itemBuilder: (BuildContext _, int index2) {
                          Room room =
                              rooms!.values.toList()[index1].elementAt(index2);
                          return subView(room);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  void navigateBlocState(state) {
    log("BlocBuilder state = $state");
    switch (state.runtimeType) {
      case HomeLoadingState:
        EasyLoading.show(
          status: 'Đợi chút nhé...',
          maskType: EasyLoadingMaskType.clear,
        );
        break;
      case HomeSuccessedState:
        rooms = state.rooms;
        EasyLoading.showSuccess(
          "Thành công",
          maskType: EasyLoadingMaskType.clear,
        );
        break;
      case HomeErrorState:
        EasyLoading.showError("Đã có lỗi xảy ra!",
            maskType: EasyLoadingMaskType.clear);
        break;
      default:
        EasyLoading.dismiss();
        break;
    }
  }

  Widget subView(Room room) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        color: Colors.white24,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          nameRoomView(room.roomName),
          areaView(room.area),
          moneyView(room.roomRates),
          statusRoomView(room.statusRoom),
        ],
      ),
    );
  }

  Widget areaView(String area) {
    return Text(
      'Diện tích: $area',
      maxLines: 2,
      style: UTStyles.text[1],
    );
  }

  Widget moneyView(double money) {
    return Row(
      children: [
        Container(
          color: Colors.transparent,
          child: const Icon(
            Icons.attach_money,
            color: Colors.blue,
            size: 14,
          ),
        ),
        Text(
          '${''}${vnd(money)}',
          style: UTStyles.text[1],
        ),
      ],
    );
  }

  Widget nameRoomView(String nameRoom) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        nameRoom,
        style: UTStyles.head1,
      ),
    );
  }

  Widget statusRoomView(int status) {
    return Text(
      'Tình trạng: ${status == -1 ? "hết phòng" : "còn phòng"}',
      style: UTStyles.text[1],
    );
  }
}
