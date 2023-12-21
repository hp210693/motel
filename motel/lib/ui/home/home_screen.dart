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
import 'package:motel/bloc/nav-router/nav_router_bloc.dart';
import 'package:motel/bloc/nav-router/nav_router_event.dart';
import 'package:motel/data/room.dart';
import 'package:motel/ui/app-router/app_router.dart';
import 'package:motel/ui/detail/detail_screen.dart';
import 'package:motel/utility/ut_color.dart';
import 'package:motel/utility/ut_money.dart';
import 'package:motel/utility/ut_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  Map? rooms;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(primaryColor: Colors.blue),
      //  color: Colors.yellow,
      home: BlocProvider(
          create: (_) => HomeBloc()..add(HomeFetchDataEvent("", "")),
          child: viewChild()),
      builder: EasyLoading.init(),
    );
  }

  Widget viewChild() {
    return Scaffold(
      backgroundColor: UTColors.backGround[1],
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
                  Room temp = rooms!.values.toList()[index1].elementAt(0);
                  nameFlow = index1 == 9 ? "KIOT" : temp.roomName.toString()[0];
                  numberRooms = rooms!.values.toList()[index1].length;
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dãy $nameFlow',
                      style: UTStyles.title[2],
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
        border: Border.all(color: UTColors.backGround[3]),
        color: const Color.fromARGB(255, 40, 41, 41),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {
          log("----user click detail $room");
          AppRouter.push(const DetailScreen());
        },
        child: Container(
          color: UTColors.backGround[5],
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
        ),
      ),
    );
  }

  Widget areaView(String area) {
    return Text(
      'Diện tích: $area',
      maxLines: 2,
      style: UTStyles.text[6],
    );
  }

  Widget moneyView(double money) {
    return Row(
      children: [
        Container(
          color: Colors.transparent,
          child: const Icon(
            Icons.attach_money,
            color: Colors.red,
            size: 14,
          ),
        ),
        Text(
          '${''}${vnd(money)}',
          style: UTStyles.text[6],
        ),
      ],
    );
  }

  Widget nameRoomView(String nameRoom) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        nameRoom,
        style: UTStyles.title[1],
      ),
    );
  }

  Widget statusRoomView(int status) {
    return Text(
      'Trạng thái: ${status == -1 ? "hết phòng" : "Còn phòng"}',
      style: UTStyles.text[6],
    );
  }
}
