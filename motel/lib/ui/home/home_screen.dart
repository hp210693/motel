/*MIT License

Copyright (c) 2020 Hung Phan

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
                      style: const TextStyle(
                        backgroundColor: Colors.blueGrey,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 3,
                        childAspectRatio: 1 / .6,
                      ),
                      itemCount: numberRooms,
                      itemBuilder: (_, index2) {
                        dynamic name1 = rooms!.values.toList()[index1];
                        Room room =
                            rooms!.values.toList()[index1].elementAt(index2);
                        return subView(room);
                      },
                    ),
                    const SizedBox(height: 5),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            //color: Colors.yellowAccent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              nameRoomView(room.roomName),
              widthHeightView(),
              moneyView(room.roomRates),
            ],
          ),
        ),
      ],
    );
  }

  Widget widthHeightView() {
    return const Text(
      "Diện tích: 10m x 20m",
      maxLines: 2,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        //color: Colors.yellow,
        // backgroundColor: Colors.purpleAccent,
      ),
    );
  }

  Widget moneyView(double money) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.green,
          child: const Icon(
            Icons.attach_money,
            color: Colors.white,
            size: 14,
          ),
        ),
        Text(
          ' $money',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            //color: Colors.yellow,
            //backgroundColor: Colors.purpleAccent,
          ),
        ),
      ],
    );
  }

  Widget nameRoomView(String nameRoom) {
    return Text(
      nameRoom,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.redAccent,
        //backgroundColor: Colors.purple,
      ),
    );
  }
}
