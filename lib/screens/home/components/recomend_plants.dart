import 'package:flutter/material.dart';
import 'package:novo/screens/details/details_screen.dart';

import '../../../constants.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendPlantCard(
            image: "https://ekalakaar.com/assets/images/patron1.jpg",
            title: "Patron",
            country: "Russia",
            price: 440,

          ),
          RecomendPlantCard(
            image: "https://ekalakaar.com/assets/images/artist.jpg",
            title: "Artist",
            country: "Russia",
            price: 440,
          ),
          RecomendPlantCard(
            image: "https://ekalakaar.com/assets/images/partners.jpg",
            title: "partners",
            country: "Russia",
            price: 440,
          ),
          RecomendPlantCard(
            image: "https://ekalakaar.com/assets/images/fans.jpg",
            title: "Art Lovers",
            country: "Russia",
            price: 440,
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
  }) : super(key: key);

  final String image, title, country;
  final int price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return 
    Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.network(image),
          GestureDetector(
            onTap: null,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.7),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Text(title.toUpperCase(),style: TextStyle(color: kPrimaryColor,fontWeight:FontWeight.bold),),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.chevron_right),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
