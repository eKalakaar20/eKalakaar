import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class list extends StatefulWidget {
  const list({super.key});

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  var item = [
    'https://ekalakaar.com/assets/carousel_images/ekalakkar_frontpic.jpeg',
    'https://ekalakaar.com/assets/carousel_images/Dance_1.jpeg'
    'https://ekalakaar.com/assets/carousel_images/Music_1.jpeg'
    'https://ekalakaar.com/assets/carousel_images/Dance_3.jpeg'
    'https://ekalakaar.com/assets/carousel_images/Music_2.jpeg',
    'https://ekalakaar.com/assets/carousel_images/Music_3.jpeg',
    'https://ekalakaar.com/assets/carousel_images/Dance_2.jpeg',
    'https://ekalakaar.com/assets/carousel_images/Music_4.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount:item.length ,
      itemBuilder: (context,index,realindex){
         
          return Image.network(item[index]);
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