
import 'package:flutter/material.dart';
import 'package:novo/screens/artist/editprofile_screen.dart';
import '../../utils/constants.dart';
import '../../utils/control.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static String routeName = 'DashboardScreen';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     // resizeToAvoidBottomInset: false,
      //app bar theme for tablet
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 126, 2, 2),
        title: Text('Dashboard'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()));
              //send report to school management, in case if you want some changes to your profile
            },
            child: Container(
              padding: EdgeInsets.only(right: kDefaultPadding / 2),
              child: Row(
                children: [
                  Icon(Icons.edit),
                  kHalfWidthSizedBox,
                  Text(
                    'Edit Profile',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg.jpg"),fit: BoxFit.cover),
         ),
        child: Container(
         
          //color: kOtherColor,
          child: Column(
            children: [
              Container(
                //margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left:10),
                width: size.width*1,
                height: size.height*0.2,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 126, 2, 2),
                  borderRadius: kBottomBorderRadius*2.5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor:Colors.green,
                      radius: size.width*0.13,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          
                          radius:
                              size.width*0.13,
                          backgroundColor: kSecondaryColor,
                          backgroundImage:
                              AssetImage('assets/images/ek.jpg'),
                        ),
                      ),
                    ),
                    kWidthSizedBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          firstnamecontroler.text+" "+lastnamecontroler.text,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(catagorycontroler.text,
                            style: Theme.of(context).textTheme.subtitle2),
                      ],
                    )
                  ],
                ),
              ),
              sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(
                      title: 'First Name', value: firstnamecontroler.text.length<1?"N/A":firstnamecontroler.text),
                  ProfileDetailRow(title: 'Last Name', value: lastnamecontroler.text.length<1?"N/A":lastnamecontroler.text),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(title: 'Category', value: catagorycontroler.text.length<1?"N/A":catagorycontroler.text),
                  ProfileDetailRow(title: 'Education in Art', value: educationcontroler.text.length<1?"N/A":educationcontroler.text),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(
                      title: 'Experience', value: expcontroler.text.length<1?"N/A":expcontroler.text),
                  ProfileDetailRow(title: 'Age', value: agecontroler.text.length<1?"N/A":agecontroler.text),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(
                      title: 'State', value: statecontroler.text.length<1?"N/A":statecontroler.text),
                  ProfileDetailRow(title: 'Major Performance', value: perfromcontroler.text.length<1?"N/A":perfromcontroler.text),
                ],
              ),
              sizedBox,
              ProfileDetailColumn(
                title: 'Email',
                value: emailcontroler.text.length<1?"N/A":emailcontroler.text,
              ),
                 
              ProfileDetailColumn(
                title: 'Phone Number',
                value: phonenumbercontroler.text.length<1?"N/A":phonenumbercontroler.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: kTextBlackColor,
                      fontSize: 13
                    ),
              ),
              kHalfSizedBox,
              Text(value, style: Theme.of(context).textTheme.caption),
              kHalfSizedBox,
              SizedBox(
                width: size.width*0.35,
                child: Divider(
                  thickness: 1.0,
                ),
              ),
            ],
          ),
          Icon(
            Icons.lock_outline,
            size: 10,
          ),
        ],
      ),
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn(
      {Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: kTextBlackColor,
                      fontSize: 11
                    ),
              ),
              kHalfSizedBox,
              Text(value, style: Theme.of(context).textTheme.caption),
              kHalfSizedBox,
              SizedBox(
                width: size.width*0.92,
                child: Divider(
                  thickness: 1.0,
                ),
              )
            ],
          ),
          Icon(
            Icons.lock_outline,
            size: 10
          ),
        ],
      ),
    );
  }
}