
import 'package:flutter/material.dart';
import 'package:novo/screens/artist/dashboard_screen.dart';
import '../../utils/constants.dart';
import '../../utils/control.dart';
class EditProfileScreen extends StatefulWidget {
   EditProfileScreen({Key? key}) : super(key: key);
  static String routeName = 'EditProfileScreen';
  

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //app bar theme for tablet
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 126, 2, 2),
        title: Text('Edit Profile'),
        actions: [
          InkWell(
            onTap: () {
            setState(() {
            });
           Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardScreen()));
              
            },
            child: Container(
              padding: EdgeInsets.only(right: kDefaultPadding / 2),
              child: Row(
                children: [
                  Icon(Icons.check),
                  kHalfWidthSizedBox,
                  Text(
                    'Save Profile',
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
          child: SingleChildScrollView(
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
                      Stack(
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
                          Positioned(
                            left: 60,
                            top:60,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.black,
                              child: Icon(Icons.edit))),
                        ],
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
                        title: 'First Name', value: firstnamecontroler),
                    ProfileDetailRow(title: 'Last Name', value: lastnamecontroler),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProfileDetailRow(title: 'Category', value: catagorycontroler),
                    ProfileDetailRow(title: 'Education in Art', value: educationcontroler),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProfileDetailRow(
                        title: 'Experience', value: expcontroler),
                    ProfileDetailRow(title: 'Age', value: agecontroler),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProfileDetailRow(
                        title: 'State', value: statecontroler),
                    ProfileDetailRow(title: 'Major Performance', value: perfromcontroler),
                  ],
                ),
                sizedBox,
                ProfileDetailColumn(
                  title: 'Email',
                  value: emailcontroler,
                ),
                   
                ProfileDetailColumn(
                  title: 'Phone Number',
                  value: phonenumbercontroler,
                ),
               SizedBox(height: 200,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileDetailRow extends StatefulWidget {
  const ProfileDetailRow({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
   final TextEditingController  value;

  @override
  State<ProfileDetailRow> createState() => _ProfileDetailRowState();
}

class _ProfileDetailRowState extends State<ProfileDetailRow> {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.5,
      child:Padding(
        padding: const EdgeInsets.only(left:15.0,bottom: 10,right: 10),
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.edit),
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: widget.title
          ),
          controller: widget.value,
        ),
      )
    );
  }
}

class ProfileDetailColumn extends StatefulWidget {
  const ProfileDetailColumn(
      {Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final TextEditingController value;

  @override
  State<ProfileDetailColumn> createState() => _ProfileDetailColumnState();
}

class _ProfileDetailColumnState extends State<ProfileDetailColumn> {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const  EdgeInsets.only(left:15.0,bottom: 15),
        child: TextField(
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.edit),
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: widget.title
          ),
          controller: widget.value,
        ),
      )
    );
  }
}
