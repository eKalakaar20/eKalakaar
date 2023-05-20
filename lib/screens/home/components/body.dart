import 'package:flutter/material.dart';
import 'package:novo/utils/constants.dart';
import 'featurred_plants.dart';
import 'header_with_seachbox.dart';
import 'carousel.dart';
import 'services.dart';
import 'title_with_more_bbtn.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeaderWithSearchBox(size: size),
            Carousal(),
            TitleWithMoreBtn(title: "Services Provided", press: () {}),
            RecomendsPlants(),
            TitleWithMoreBtn(title: "Our Elite Partners", press: () {}),
            FeaturedPlants(),
            SizedBox(height: kDefaultPadding),
          ],
        ),
      ),
    );
  }
}
