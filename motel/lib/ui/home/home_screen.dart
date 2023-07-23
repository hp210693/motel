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
  List<List<Room>> flows = []; //<List<Room>>[flowA];
  void _navigateBlocState(state) {
    log("BlocBuilder state = $state");
    switch (state.runtimeType) {
      case HomeLoadingState:
        EasyLoading.show(
          status: 'Đợi chút nhé...',
          maskType: EasyLoadingMaskType.clear,
        );
        break;
      case HomeSuccessedState:
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      color: Colors.yellow,
      home: BlocProvider(
          create: (_) => HomeBloc()..add(HomeFetchDataEvent("", "")),
          child: _viewChild()),
      builder: EasyLoading.init(),
    );
  }

  Widget _viewChild() {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          _navigateBlocState(state);

          return SafeArea(
            child: ListView.builder(
              itemCount: flows.length,
              itemBuilder: (BuildContext context1, int index1) {
                String title1 = ""; //flows[index1][0].title.toString();
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
                                crossAxisCount: 4),
                        itemCount: flows[index1].length,
                        itemBuilder: (_, int index2) {
                          String name =
                              ""; //flows[index1][index2].name.toString();
                          return Column(
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
                                    Text(
                                      'Phòng\n$name',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow,
                                          backgroundColor: Colors.purple),
                                    ),
                                    const Text(
                                      "Dài x Rộng: 10m x 20m",
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow,
                                          backgroundColor: Colors.purpleAccent),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                              backgroundColor:
                                                  Colors.purpleAccent),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
