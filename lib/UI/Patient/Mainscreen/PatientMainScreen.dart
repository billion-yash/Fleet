import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'HospitalMainScreen/HospitalListScreen.dart';


var ScreenNumber = 0;

class PatientMainScreen extends StatefulWidget {
  const PatientMainScreen({Key? key}) : super(key: key);

  @override
  _PatientMainScreenState createState() => _PatientMainScreenState();
}

class _PatientMainScreenState extends State<PatientMainScreen> {
  List<StatefulWidget> list = [
    HospitalListScreen(),
    HospitalListScreen(),
    HospitalListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          getDrawer(),
          list[ScreenNumber],
        ],
      ),
    );
  }

  getDrawer() {
    return Container(
      color: kPrimaryColor,
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yash Dhanlobhe',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text('8668611930',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          Column(
              children : drawerItems.map((element) => GestureDetector(
                  onTap: () {
                    setState(() {
                      ScreenNumber = element['screenNumber'];
                    });
                  },
                  child: Container(
                    color: ScreenNumber == element['screenNumber']
                        ? Colors.black38
                        : kPrimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            element['icon'],
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(element['title'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))
                        ],
                      ),
                    ),
                  )
              )).toList(),
          ),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, "/choosePHScreen");
            },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Log out',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
List<Map> drawerItems=[
  {
    'icon': Icons.info,
    'title' : 'Info',
    'screenNumber' : 0
  },
  {
    'icon': Icons.add_box_rounded,
    'title' : 'Add Slots',
    'screenNumber' : 1
  },
  {
    'icon': Icons.medical_services,
    'title' : 'Add Doctor',
    'screenNumber' : 2
  },
  {
    'icon': Icons.favorite,
    'title' : 'Favorites'
  },
  {
    'icon': Icons.mail,
    'title' : 'Messages'
  },
  {
    'icon': Icons.ac_unit,
    'title' : 'Profile'
  },
];