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
import 'package:maps_launcher/maps_launcher.dart';
import 'package:motel/bloc/detail/detail_bloc.dart';
import 'package:motel/bloc/detail/detail_state.dart';
import 'package:motel/bloc/nav-router/nav_router_bloc.dart';
import 'package:motel/bloc/nav-router/nav_router_event.dart';
import 'package:motel/data/room.dart';
import 'package:motel/utility/ut_color.dart';
import 'package:motel/utility/ut_money.dart';
import 'package:motel/utility/ut_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final Room _roomShared;
  const DetailScreen(this._roomShared, {super.key});

  @override
  State<DetailScreen> createState() => _DetailPageState(_roomShared);
}

class _DetailPageState extends State<DetailScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<String> sampleImages = [
    'https://img.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg?w=1800&t=st=1673886721~exp=1673887321~hmac=57318aa37912a81d9c6e8f98d4e94fb97a766bf6161af66488f4d890f88a3109',
    'https://img.freepik.com/free-photo/attractive-curly-woman-purple-cashmere-sweater-fuchsia-sunglasses-poses-isolated-wall_197531-24158.jpg?w=1800&t=st=1673886680~exp=1673887280~hmac=258c92922874ad41d856e7fdba03ce349556cf619de4074143cec958b5b4cf05',
    'https://img.freepik.com/free-photo/stylish-blonde-woman-beret-beautiful-french-girl-jacket-standing-red-wall_197531-14428.jpg?w=1800&t=st=1673886821~exp=1673887421~hmac=5e77d3fab088b29a3b19a9023289fa95c1dc2af15565f290886bab4642fa2621',
    'https://img.freepik.com/free-photo/pretty-young-girl-with-pale-skin-dark-hair-french-beret-sunglasses-polka-dot-skirt-white-top-red-shirt-walking-around-sunny-city-laughing_197531-24480.jpg?w=1800&t=st=1673886800~exp=1673887400~hmac=9a1c61de63180118c5497ce105bbb36bfbb53050111de466d5110108848f2128',
    'https://img.freepik.com/free-photo/elegant-woman-brown-coat-spring-city_1157-33434.jpg?w=1800&t=st=1673886830~exp=1673887430~hmac=cc8c28a9332e008db251bdf9c7b838b7aa5077ec7663773087a8cc56d11138ff',
    'https://img.freepik.com/free-photo/high-fashion-look-glamor-closeup-portrait-beautiful-sexy-stylish-blond-young-woman-model-with-bright-yellow-makeup-with-perfect-clean-skin-with-gold-jewelery-black-cloth_158538-2003.jpg?w=826&t=st=1673886857~exp=1673887457~hmac=3ba51578e6a1e9c58e95a6b72e492cbbc26abf8e2f116a0672113770d3f4edbe',
  ];
  final Room roomShared;
  _DetailPageState(this.roomShared);

  final Uri url = Uri.parse('tel:+84-123456789');

  @override
  void deactivate() {
    super.deactivate();
    BlocProvider.of<NavRouterBloc>(context).add(NavNothingEvent());
  }

  Widget picturesRoom() {
    // sampleImages.add(roomShared.imgRoom[0]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CarouselSlider(
          items: sampleImages
              .map((item) => InkWell(
                  onTap: () => {
                        context
                            .read<NavRouterBloc>()
                            .add(NavShowRoomEvent(sampleImages))
                      },
                  child: Center(child: Image.network(item))))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: sampleImages.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => {
                _controller.animateToPage(entry.key),
                log("???hhhh2"),
              },
              child: Container(
                width: 10.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? UTColors.backGround[6]
                            : UTColors.backGround[4])
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget noteView() {
    double width = MediaQuery.of(context).size.width - 34;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
          child: Text(
            "Lưu ý",
            style: UTStyles.title[4],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
          child: Text(
            "SỨC CHỨA",
            style: UTStyles.title[5],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "4 người +",
                    style: UTStyles.title[5],
                  ),
                  const SizedBox(height: 4.0),
                  Container(
                    height: 12.0,
                    width: width / 3,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    "Chật",
                    style: UTStyles.title[5],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, right: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "3 người",
                      style: UTStyles.title[5],
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      height: 12.0,
                      width: width / 3,
                      decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      "Ổn",
                      style: UTStyles.title[5],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "2 người",
                    style: UTStyles.title[5],
                  ),
                  const SizedBox(height: 4.0),
                  Container(
                    height: 12.0,
                    width: width / 3,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    "Rộng",
                    style: UTStyles.title[5],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget describeView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
          child: Text(
            "Mô tả chi tiết",
            style: UTStyles.title[4],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
          child: Text(
            '''Địa chỉ: Tổ 99 khu phố Bàu Ké thị trấn Tân Phú Huyện Đồng Phú, Bình Phước\n'''
            '''Gần khu công nghiệp Bắc Đồng Phú 5 phút đi bộ\n'''
            '''Giá thuê chưa bao gồm tiền điện, nước, rác\n'''
            '''Xem phòng liên hệ: 0123456789 Mr. Hùng''',
            style: UTStyles.title[5],
          ),
        ),
      ],
    );
  }

  Widget addressView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
          child: Text(
            "Địa chỉ",
            style: UTStyles.title[4],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
          child: InkWell(
            onTap: () => {
              MapsLauncher.launchCoordinates(
                  11.47390955371074, 106.8868173673191, 'Nhà trọ Thảo Nguyên'),
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Ionicons.location_outline,
                  color: Colors.blueGrey,
                  size: 20.0,
                ),
                RichText(
                  text: TextSpan(
                    text:
                        ' Tổ 99 khu phố Bàu Ké thị trấn Tân Phú huyện Đồng Phú,\n Bình Phước',
                    style: UTStyles.title[5],
                    children: <TextSpan>[
                      TextSpan(
                        text: '  Chỉ đường',
                        style: UTStyles.title[6],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
          child: InkWell(
            onTap: () => {openLink(url)},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Ionicons.call_outline,
                  color: Colors.blueGrey,
                  size: 20.0,
                ),
                Text(
                  " Số điện thoại: 0123456789",
                  style: UTStyles.title[5],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget lineView() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 8.0,
      width: width,
      decoration: BoxDecoration(color: Colors.grey[300]),
    );
  }

  Widget ultiView() {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Giá Phòng: ",
              style: UTStyles.title[1],
              children: [
                TextSpan(
                    text: '${vnd(roomShared.roomRates)} VND/phòng',
                    style: UTStyles.title[7]),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Còn phòng",
                  style: UTStyles.title[5],
                ),
                const SizedBox(height: 4.0),
                Text(
                  "${roomShared.statusRoom}",
                  style: UTStyles.title[7],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Diện tích",
                  style: UTStyles.title[5],
                ),
                const SizedBox(height: 4.0),
                Text(
                  '${roomShared.area} m\u00b2',
                  style: UTStyles.title[7],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Đặt cọc",
                  style: UTStyles.title[5],
                ),
                const SizedBox(height: 4.0),
                Text(
                  '${vnd(roomShared.deposits)}k',
                  style: UTStyles.title[7],
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
          child: Container(
            height: 1.0,
            width: width,
            decoration: BoxDecoration(color: Colors.grey[400]),
          ),
        ),
        GridView.count(
          primary: false,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: (1 / .4),
          crossAxisCount: 3,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Ionicons.bulb_outline,
                  color: Colors.blueGrey,
                  size: 20.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  "${vndk(roomShared.electricPrice)}k",
                  style: UTStyles.title[8],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Ionicons.water_outline,
                  color: Colors.blueGrey,
                  size: 20.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  "${vndk(roomShared.waterPrice)}k",
                  style: UTStyles.title[8],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Ionicons.trash_outline,
                  color: Colors.blueGrey,
                  size: 20.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  "${vndk(roomShared.junkMoney)}k",
                  style: UTStyles.title[8],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Ionicons.man_outline,
                  color: Colors.blueGrey,
                  size: 20.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  "WC riêng",
                  style: UTStyles.title[8],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Ionicons.wifi_outline,
                  color: Colors.blueGrey,
                  size: 20.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  "Free",
                  style: UTStyles.title[8],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Ionicons.time_outline,
                  color: Colors.blueGrey,
                  size: 20.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  "Tự do",
                  style: UTStyles.title[8],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Future<void> openLink(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget detailBottom() {
    double width = MediaQuery.of(context).size.width - 30;
    return Container(
      color: UTColors.backGround[1],
      child: SizedBox(
        height: 60,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  log("user click button login");
                  // context.read<LoginBloc>().add(LoginInEvent(userName, password));
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: UTColors.text[3]),
                    color: UTColors.backGround[6],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Ionicons.chatbox_ellipses_outline, size: 20),
                        Text(
                          " Chat",
                          style: UTStyles.title[4],
                        ),
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: InkWell(
                  onTap: () {
                    log("user click button login");
                    // context.read<LoginBloc>().add(LoginInEvent(userName, password));
                  },
                  child: Container(
                    width: width / 2 - 20,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: UTColors.text[3]),
                      color: UTColors.backGround[1],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      " Gữi chỗ",
                      style: UTStyles.title[4],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  log("user click button login");
                  openLink(url);

                  // context.read<LoginBloc>().add(LoginInEvent(userName, password));
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: UTColors.text[3]),
                    color: UTColors.backGround[1],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Ionicons.call_outline, size: 20),
                        Text(
                          " Gọi",
                          style: UTStyles.title[4],
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameRoomView() {
    String temp = roomShared.roomName.contains("KIOT") == true
        ? "KIOT"
        : roomShared.roomName.toString()[0];

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
      child: Text(
        'Dãy $temp phòng ${roomShared.roomName}',
        style: UTStyles.title[1],
      ),
    );
  }

  Widget viewChild() {
    return Scaffold(
      appBar: AppBar(
          title: Text("Chi tiết phòng", style: UTStyles.title[1]),
          centerTitle: true),
      bottomNavigationBar: detailBottom(),
      backgroundColor: UTColors.backGround[1],
      body: BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                picturesRoom(),
                nameRoomView(),
                //  lineView(),
                ultiView(),
                lineView(),
                noteView(),
                lineView(),
                addressView(),
                lineView(),
                describeView()
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    // EasyLoading.init();
    return BlocProvider(
      create: (_) => DetailBloc(), //..add(DetailInitialEvent()),
      child: viewChild(),
    );
  }
}
