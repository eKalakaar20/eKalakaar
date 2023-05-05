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
    'https://sweet-faloodeh-5b5fd0.netlify.app/assets/carousel_images/c1.jpg',
    'https://sweet-faloodeh-5b5fd0.netlify.app/assets/carousel_images/c2.jpg',
    'https://sweet-faloodeh-5b5fd0.netlify.app/assets/carousel_images/c3.jpg',
    'https://sweet-faloodeh-5b5fd0.netlify.app/assets/carousel_images/c4.jpg',
    'https://sweet-faloodeh-5b5fd0.netlify.app/assets/carousel_images/c5.jpg',
    'https://sweet-faloodeh-5b5fd0.netlify.app/assets/carousel_images/c6.jpg',
    'https://sweet-faloodeh-5b5fd0.netlify.app/assets/carousel_images/c7.jpg',
    'https://sweet-faloodeh-5b5fd0.netlify.app/assets/carousel_images/c8.jpg',
    'https://sweet-faloodeh-5b5fd0.netlify.app/assets/carousel_images/c9.jpg',
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