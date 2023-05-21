import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../utils/constants.dart';

class FindOpportunityScreen extends StatefulWidget {
  const FindOpportunityScreen({super.key});

  @override
  State<FindOpportunityScreen> createState() => _FindOpportunityScreenState();
}

class _FindOpportunityScreenState extends State<FindOpportunityScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: BoxDecoration(
              color: Colors.white),
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Row(
                children: [
                  SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Apportunites",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold,color: kTextColor2),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Found 200 Patrons ",
                          style: TextStyle(
                            fontSize: 15,
                            color: kTextColor2
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  SafeArea(
                      child: SvgPicture.asset(
                    "assets/images/loc.svg",
                    color: Colors.black,
                    height: 35,
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                      'assets/icons/search.svg',
                      height: 0.1,
                    ),
                  // icon: SvgPicture.asset("assets/icons/search.svg"),
                  hintText: "Search",
                  suffixIcon: IconButton(
                    //  iconSize: 50,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/cross.svg',
                      height: 19,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(18),
                  fillColor: const Color(0xFFF5F5F5),
                  filled: true,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
                    // topRight: Radius.circular(25)
                    // ),
                    image: DecorationImage(image: AssetImage("assets/images/bg.jpg"),fit: BoxFit.cover,opacity: 0.8)
                  ),
                  child: ListView.builder(
                      itemCount: 25,
                      itemBuilder: (BuildContext context, int index) {
                        return OpportunityCard();
                      }),
                ),
              )
            ])));
  }
}

class OpportunityCard extends StatefulWidget {
  const OpportunityCard({super.key});

  @override
  State<OpportunityCard> createState() => _OpportunityCardState();
}

class _OpportunityCardState extends State<OpportunityCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("assets/images/artist.jpg"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 6,
                ),
                Text(
                  "BuzzDancing Fox",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: kTextColor2),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/star.svg',
                      height: 25,
                     // color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "3.9",
                      style: TextStyle(
                        fontSize: 10,
                        color: kTextColor2
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Text(
                      "Reviews (200)",
                      style: TextStyle(
                        fontSize: 10,
                         color: kTextColor2
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Set in landscaped gardens overlooking the ...",
                  style: TextStyle(
                    fontSize: 10,
                     color: kTextColor2
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "3 Openings",
                      style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 8, 152, 255),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Mumbai",
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: kTextColor2),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: kPrimaryColor),
                        width: size.width * 0.25,
                        height: size.height * 0.05,
                        child: const Center(
                          child: Text(
                            "Apply",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 5,)
      ],
    );
  }
}
