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
  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  Map<dynamic, List<dynamic>>? rooms;

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
              itemBuilder: (BuildContext context1, int index1) {
                String title1 = "";
                if (rooms != null) {
                  title1 = rooms!.keys.toList()[index1].toString();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Day $title1',
                      style: const TextStyle(backgroundColor: Colors.yellow),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 3,
                        childAspectRatio: 1 / .8,
                      ),
                      itemCount: rooms!.values.toList()[index1].length,
                      itemBuilder: (_, int index2) {
                        // String name = rooms[index2].roomName;
                        return subView();
                      },
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

  /*  Widget viewChild() {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          navigateBlocState(state);
          return SafeArea(
            child: ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (BuildContext context1, int index1) {
                String title1 = rooms[index1].flowId.toString();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Day $title1',
                      style: const TextStyle(backgroundColor: Colors.yellow),
                    ),
                    /*     GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: rooms[index1].flowId,
                        itemBuilder: (_, int index2) {
                          String name = rooms[index2].roomName;
                          return subView();
                        }), */
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  } */

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

  Widget subView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              nameRoomView("hhh"),
              widthHeightView(),
              moneyView(),
            ],
          ),
        ),
      ],
    );
  }

  Widget widthHeightView() {
    return const Text(
      "Dài x Rộng: 10m x 20m",
      maxLines: 2,
      style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.yellow,
          backgroundColor: Colors.purpleAccent),
    );
  }

  Widget moneyView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.yellow,
          child: const Icon(
            Icons.attach_money,
            color: Colors.white,
            size: 16,
          ),
        ),
        const Text(
          "600.00",
          style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
              backgroundColor: Colors.purpleAccent),
        ),
      ],
    );
  }

  Widget nameRoomView(String nameRoom) {
    return Text(
      'Phòng\n$nameRoom',
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.yellow,
          backgroundColor: Colors.purple),
    );
  }
}
