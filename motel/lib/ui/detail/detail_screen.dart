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
import 'package:motel/bloc/login/login_bloc.dart';
import 'package:motel/bloc/login/login_state.dart';
import 'package:motel/bloc/nav-router/nav_router_bloc.dart';
import 'package:motel/bloc/nav-router/nav_router_event.dart';
import 'package:motel/ui/app-router/app_router.dart';
import 'package:motel/utility/ut_color.dart';
import 'package:motel/utility/ut_styles.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const DetailScreen());
  }

  @override
  State<DetailScreen> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailScreen> {
  static const List<String> sampleImages = [
    'https://img.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg?w=1800&t=st=1673886721~exp=1673887321~hmac=57318aa37912a81d9c6e8f98d4e94fb97a766bf6161af66488f4d890f88a3109',
    'https://img.freepik.com/free-photo/attractive-curly-woman-purple-cashmere-sweater-fuchsia-sunglasses-poses-isolated-wall_197531-24158.jpg?w=1800&t=st=1673886680~exp=1673887280~hmac=258c92922874ad41d856e7fdba03ce349556cf619de4074143cec958b5b4cf05',
    'https://img.freepik.com/free-photo/stylish-blonde-woman-beret-beautiful-french-girl-jacket-standing-red-wall_197531-14428.jpg?w=1800&t=st=1673886821~exp=1673887421~hmac=5e77d3fab088b29a3b19a9023289fa95c1dc2af15565f290886bab4642fa2621',
    'https://img.freepik.com/free-photo/pretty-young-girl-with-pale-skin-dark-hair-french-beret-sunglasses-polka-dot-skirt-white-top-red-shirt-walking-around-sunny-city-laughing_197531-24480.jpg?w=1800&t=st=1673886800~exp=1673887400~hmac=9a1c61de63180118c5497ce105bbb36bfbb53050111de466d5110108848f2128',
    'https://img.freepik.com/free-photo/elegant-woman-brown-coat-spring-city_1157-33434.jpg?w=1800&t=st=1673886830~exp=1673887430~hmac=cc8c28a9332e008db251bdf9c7b838b7aa5077ec7663773087a8cc56d11138ff',
    'https://img.freepik.com/free-photo/high-fashion-look-glamor-closeup-portrait-beautiful-sexy-stylish-blond-young-woman-model-with-bright-yellow-makeup-with-perfect-clean-skin-with-gold-jewelery-black-cloth_158538-2003.jpg?w=826&t=st=1673886857~exp=1673887457~hmac=3ba51578e6a1e9c58e95a6b72e492cbbc26abf8e2f116a0672113770d3f4edbe',
  ];

/*   @override
  void dispose() {
    //  BlocProvider.of<NavRouterBloc>(context).add(NavRouterEvent.detail);

    super.dispose();
    AppRouter.pop();
    print("xxxxxx");
  } */

  List<int> list = [1, 2, 3, 4, 5];
  /*  @override
  Widget build(BuildContext context) {
    print("co vao khong dayu");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Chi tiết phòng",
            textAlign: TextAlign.center,
          ),
        ),
        body: viewChild(),
      ),
      builder: EasyLoading.init(),
    );
  
  } */

/*   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Chi tiết phòng",
            textAlign: TextAlign.center,
          ),
        ),
        body: BlocProvider(
          create: (_) => LoginBloc(),
          child: viewChild(),
        ),
      ),
      builder: EasyLoading.init(),
    );
  } */

  @override
  Widget build(BuildContext context) {
    EasyLoading.init();
    return Scaffold(
      appBar: AppBar(title: const Text("Chi tiết phòng")),
      backgroundColor: UTColors.backGround[1],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                  child: Text(
                    "Đăng nhập",
                    style: UTStyles.title[3],
                  ),
                ),
                const SizedBox(height: 30),
                /* FanCarouselImageSlider(
                  imagesLink: sampleImages,
                  isAssets: false,
                  autoPlay: true,
                ), */
                CarouselSlider(
                  options: CarouselOptions(),
                  items: sampleImages
                      .map((item) => Container(
                            child: Center(child: Image.network(item)),
                            //color: Colors.green,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
