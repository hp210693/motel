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
import 'package:ionicons/ionicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/bloc/nav-router/nav_router_bloc.dart';
import 'package:motel/bloc/nav-router/nav_router_event.dart';
import 'package:motel/utility/ut_color.dart';
import 'package:motel/utility/ut_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ShowRoomScreen extends StatefulWidget {
  final List<String> sampleImages;
  const ShowRoomScreen(this.sampleImages, {super.key});

  @override
  State<ShowRoomScreen> createState() => _ShowRoomPageState(sampleImages);
}

class _ShowRoomPageState extends State<ShowRoomScreen> {
  int current = 0;
  final List<String> sampleImages;
  final CarouselController controller = CarouselController();
  _ShowRoomPageState(this.sampleImages);
  @override
  void deactivate() {
    super.deactivate();
    BlocProvider.of<NavRouterBloc>(context).add(NavNothingEvent());
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15, top: 50, bottom: 10),
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                log("click button close");
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Close ",
                    textAlign: TextAlign.center,
                    style: UTStyles.text[8],
                  ),
                  Icon(Ionicons.close_circle_outline,
                      size: 20.0, color: UTColors.backGround[1]),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: CarouselSlider(
            items: sampleImages
                .map(
                  (item) => Image.network(
                    item,
                  ),
                )
                .toList(),
            carouselController: controller,
            options: CarouselOptions(
                height: height / 1.5,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    current = index;
                  });
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10, bottom: 20),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "${current + 1}/${sampleImages.length}",
              textAlign: TextAlign.center,
              style: UTStyles.text[8],
            ),
          ),
        ),
      ],
    );
  }
}
