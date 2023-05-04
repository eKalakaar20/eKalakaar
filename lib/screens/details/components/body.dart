import 'package:flutter/material.dart';
import 'package:novo/utils/constants.dart';

import 'image_and_icons.dart';
import 'title_and_price.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(size: size),
          TitleAndPrice(title: "Angelica", country: "Russia", price: 440),
          SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: OutlinedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green[800]),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                    ))),
                  ),
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                 style: OutlinedButton.styleFrom(
               side: BorderSide(width: 5.0, color: Colors.transparent),),
                  onPressed: () {},
                  child: Text("Description",style:TextStyle(color:Colors.black),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
