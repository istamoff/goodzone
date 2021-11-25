import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goodzone/data/model/banner/banner_response.dart';
import 'package:get/get.dart';

class CarosulData extends StatefulWidget {
  final List<Banners> carouselList;

  const CarosulData({Key? key, required this.carouselList}) : super(key: key);

  @override
  _CarosulDataState createState() => _CarosulDataState();
}

class _CarosulDataState extends State<CarosulData> {

  int _current = 0;

  late List<Widget> imageSlider;

  @override
  void initState() {
    imageSlider = widget.carouselList
        .map(
          (e) => Container(
            margin: const EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: e.image!,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    placeholder: (context, url) => SizedBox(
                      height: Get.height / 5,
                      width: 100,
                      child: Center(
                        child: Image.asset(
                          'asset/png/logo.png',
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    fit: BoxFit.fill,
                    height: Get.height / 4 + 32,
                    width: Get.width - 24,
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: imageSlider,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }));
  }
}
