import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Carousal extends StatefulWidget {
  const Carousal({super.key});

  @override
  State<Carousal> createState() => _CarousalState();
}

class _CarousalState extends State<Carousal> {
  var item = [
    'assets/images/c1.jpg',
    'assets/images/c2.png',
    'assets/images/c3.png',
    'assets/images/c5.png',
    'assets/images/c6.png',
    'assets/images/c7.png',
    'assets/images/c8.png',
    'assets/images/c9.png',
    'assets/images/c10.png',
    'assets/images/c11.png',
    'assets/images/c12.png',
    'assets/images/c13.png',
    'assets/images/c14.png',
    'assets/images/c15.png',
    'assets/images/c16.png',
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount:item.length ,
      itemBuilder: (context,index,realindex){
         
          return Image.asset(item[index]);
      },
  options: CarouselOptions(
  height:250,
    enlargeCenterPage: true,
    enableInfiniteScroll: true,
    autoPlay: true,
    autoPlayInterval: Duration(seconds:3),
    autoPlayAnimationDuration: Duration(milliseconds: 700),
    autoPlayCurve: Curves.fastOutSlowIn,
    scrollDirection: Axis.horizontal,
    aspectRatio: 16 / 9,
    viewportFraction:0.80, // 0.85
    initialPage: 0,
    enlargeFactor: 0.31, // 0.31
    onPageChanged: (index, reason) {
    },

  ),
  
);
  }
}